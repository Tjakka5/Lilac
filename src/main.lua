if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
  require("lldebugger").start()
end

json = require("Lilac.Serializers.json")

ffi = require("ffi")

require("Lilac.Init")