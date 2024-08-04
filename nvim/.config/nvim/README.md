NVIM v0.10.0
LuaJIT 2.1.0-beta3

# Debugger setup
## JavaScript Node
To setup JavaScript debugger
1. Clone the vs-code-js-debug repo
```bash
git clone https://github.com/microsoft/vscode-js-debug
cd vscode-js-debug
npm install --legacy-peer-deps
npx gulp vsDebugServerBundle
mv dist out
```
2. Add the path to `env.lua`
