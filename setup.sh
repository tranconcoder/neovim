#!/bin/bash

# Script to install Packer and setup Neovim plugins
# Run with: bash install_packer.sh

set -e  # Exit on any error

echo "🚀 Starting Packer and Neovim setup..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Neovim is installed
check_neovim() {
    if ! command -v nvim &> /dev/null; then
        print_error "Neovim is not installed. Please install it first."
        echo "Ubuntu/Debian: sudo apt install neovim"
        echo "Arch: sudo pacman -S neovim"
        echo "macOS: brew install neovim"
        exit 1
    fi
    print_success "Neovim found: $(nvim --version | head -n1)"
}

# Install Node.js if not present (required for many LSP servers)
install_nodejs() {
    if ! command -v node &> /dev/null; then
        print_warning "Node.js not found. Installing..."
        
        if command -v apt &> /dev/null; then
            # Ubuntu/Debian
            curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
            sudo apt-get install -y nodejs
        elif command -v pacman &> /dev/null; then
            # Arch Linux
            sudo pacman -S nodejs npm
        elif command -v brew &> /dev/null; then
            # macOS
            brew install node
        else
            print_error "Cannot install Node.js automatically. Please install manually."
            exit 1
        fi
    fi
    print_success "Node.js found: $(node --version)"
}

# Install Packer
install_packer() {
    PACKER_PATH="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
    
    if [ -d "$PACKER_PATH" ]; then
        print_warning "Packer already exists. Updating..."
        cd "$PACKER_PATH" && git pull
    else
        print_status "Installing Packer..."
        git clone --depth 1 https://github.com/wbthomason/packer.nvim "$PACKER_PATH"
    fi
    print_success "Packer installed/updated successfully"
}

# Install Pyright globally
install_pyright() {
    print_status "Installing Pyright language server..."
    npm install -g pyright
    print_success "Pyright installed: $(pyright --version)"
}

# Install win32yank for WSL clipboard (if in WSL)
install_wsl_clipboard() {
    if [[ $(grep -i microsoft /proc/version 2>/dev/null) ]]; then
        print_status "WSL detected. Installing win32yank for clipboard support..."
        
        # Download win32yank
        TEMP_DIR=$(mktemp -d)
        cd "$TEMP_DIR"
        
        curl -Lo win32yank.zip https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip
        unzip win32yank.zip
        
        # Install to local bin
        mkdir -p "$HOME/.local/bin"
        cp win32yank.exe "$HOME/.local/bin/"
        
        # Add to PATH if not already there
        if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
            export PATH="$HOME/.local/bin:$PATH"
        fi
        
        rm -rf "$TEMP_DIR"
        print_success "win32yank installed for WSL clipboard"
    fi
}

# Create Neovim config directory if it doesn't exist
create_config_dir() {
    CONFIG_DIR="$HOME/.config/nvim"
    mkdir -p "$CONFIG_DIR/sources"
    print_status "Neovim config directory ready: $CONFIG_DIR"
}

# Run Neovim commands
run_neovim_setup() {
    print_status "Running Neovim setup commands..."
    
    # PackerSync to install all plugins
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    
    print_success "Packer plugins installed successfully"
    
    # Optional: Install Mason LSP servers if mason is configured
    if nvim --headless -c 'lua print(pcall(require, "mason"))' -c 'quitall' 2>/dev/null | grep -q true; then
        print_status "Mason detected. Installing additional LSP servers..."
        nvim --headless -c 'MasonInstall pyright lua-language-server typescript-language-server' -c 'sleep 10' -c 'quitall'
        print_success "Mason LSP servers installed"
    fi
}

# Create a simple health check
health_check() {
    print_status "Running health check..."
    
    echo "=== System Info ==="
    echo "Neovim: $(nvim --version | head -n1)"
    echo "Node.js: $(node --version 2>/dev/null || echo 'Not installed')"
    echo "npm: $(npm --version 2>/dev/null || echo 'Not installed')"
    echo "Pyright: $(pyright --version 2>/dev/null || echo 'Not installed')"
    
    if [[ $(grep -i microsoft /proc/version 2>/dev/null) ]]; then
        echo "win32yank: $(which win32yank.exe 2>/dev/null || echo 'Not found in PATH')"
    fi
    
    echo ""
    echo "=== Neovim Health ==="
    nvim --headless -c 'checkhealth' -c 'quitall' 2>/dev/null || print_warning "Health check failed"
}

# Main execution
main() {
    print_status "Starting installation process..."
    
    check_neovim
    install_nodejs
    install_packer
    install_pyright
    install_wsl_clipboard
    create_config_dir
    run_neovim_setup
    
    print_success "🎉 Installation completed successfully!"
    echo ""
    echo "Next steps:"
    echo "1. Open Neovim: nvim"
    echo "2. Run :checkhealth to verify everything is working"
    echo "3. Run :PackerStatus to see installed plugins"
    echo ""
    
    health_check
}

# Run the main function
main "$@"
