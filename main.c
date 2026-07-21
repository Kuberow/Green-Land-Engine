// writing it in c cuz i heard its easier than c++, and it kinda is.
// and using system libs is easier than bundling them yourself, tho lua was easy, it was a single file header
#include <stdio.h>
#define LUA_IMPL
#include "LuaLib/lua.h"
#include <vulkan/vulkan.h>
#include <openxr/openxr.h>
#include <openxr/openxr_platform.h>

int main() {
  lua_State *L = luaL_newstate(); // creates a lua state
  luaL_openlibs(L); // then gives it all the lua stuff like functions etc

  
}
