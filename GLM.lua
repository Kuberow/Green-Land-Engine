-- map generator and extractor

local mode = nil
local input = nil
local output = nil

local function exists(path)
    local f = io.open(path, "r")
    if f then
        f:close()
        return true
    end
    return false
end

local i = 1
while i <= #arg do
    local a = arg[i]

    if a == "-g" then
        mode = "generate"
        input = arg[i + 1]
        i = i + 1
    elseif a == "-e" then
        mode = "extract"
        input = arg[i + 1]
        i = i + 1
    elseif a == "-o" then
        output = arg[i + 1]
        i = i + 1
    end

    i = i + 1
end

if not mode then
    print("Error: No mode specified (-g or -e)")
    os.exit(1)
end

if not input then
    print("Error: No input file specified")
    os.exit(1)
end

print("Mode:", mode)
print("Input:", input)
print("Output:", output or "none")

if mode == "generate" then
  if exists("/usr/lib/libzstd.so") then
  os.execute("zstd " .. input .. " -o " .. output or "map.glm")
  else
    print("zstd is not installed, Aborting")
    os.exit(1)
  end
elseif mode == "extract" then
  if exists("/usr/lib/libzstd.so") then
  os.execute("zstd -d " .. input .. " -o " .. output or "map.gltf")
  else
    print("zstd is not installed, Aborting")
    os.exit(1)
  end
end
