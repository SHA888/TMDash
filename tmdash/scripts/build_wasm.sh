#!/bin/bash
# WebAssembly Build Script for TMDash

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Output directory for WASM files
WASM_OUTPUT_DIR="dist/wasm"

# Ensure output directory exists
mkdir -p "$WASM_OUTPUT_DIR"

# Build the project with WebAssembly target
echo -e "${BLUE}🔨 Building TMDash for WebAssembly...${NC}"
moon build --target wasm

# Copy WASM files to the output directory
echo -e "📦 Copying WebAssembly files to $WASM_OUTPUT_DIR"
cp -r target/wasm/* "$WASM_OUTPUT_DIR/"

# Create a simple HTML test file for the WASM module
cat > "$WASM_OUTPUT_DIR/index.html" << 'EOL'
<!DOCTYPE html>
<html>
<head>
    <title>TMDash - WebAssembly Test</title>
    <meta charset="utf-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            line-height: 1.6;
        }
        .container {
            text-align: center;
            margin-top: 50px;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            margin: 10px;
            cursor: pointer;
        }
        #output {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            min-height: 50px;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>TMDash - WebAssembly Test</h1>
        <p>This page tests the WebAssembly build of TMDash.</p>
        
        <div>
            <button id="runTest">Run Test</button>
        </div>
        
        <h3>Output:</h3>
        <pre id="output">Click the button to run the test...</pre>
    </div>

    <script type="module">
        document.getElementById('runTest').addEventListener('click', async () => {
            const output = document.getElementById('output');
            output.textContent = 'Loading WebAssembly module...\n';
            
            try {
                // Import the WebAssembly module
                const module = await import('./tmdash.mjs');
                output.textContent += 'WebAssembly module loaded successfully!\n\n';
                
                // Run a test function if available
                if (module.test_wasm) {
                    output.textContent += 'Running test function...\n';
                    const result = module.test_wasm();
                    output.textContent += `Test result: ${result}\n`;
                } else {
                    output.textContent += 'No test function found in the WebAssembly module.\n';
                }
                
                output.textContent += '\n✅ WebAssembly test completed successfully!';
            } catch (error) {
                output.textContent += '\n❌ Error loading WebAssembly module:\n' + error;
                console.error(error);
            }
        });
    </script>
</body>
</html>
EOL

echo -e "${GREEN}✅ WebAssembly build completed successfully!${NC}
echo -e "To test the WebAssembly build, open ${BLUE}file://$(pwd)/$WASM_OUTPUT_DIR/index.html${NC} in a web browser"
echo -e "or start a local web server in the ${BLUE}$WASM_OUTPUT_DIR${NC} directory."

echo -e "\n${GREEN}🚀 Development server (optional):${NC}"
echo "You can use Python's built-in HTTP server to test the WebAssembly build:"
echo -e "${BLUE}cd "$WASM_OUTPUT_DIR" && python3 -m http.server 8000${NC}"
echo "Then open http://localhost:8000 in your web browser"
