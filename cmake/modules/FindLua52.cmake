SET(LUA52_FIND_REQUIRED ${Lua52_FIND_REQUIRED})
SET(LUA52_FIND_VERSION ${Lua52_FIND_VERSION})
SET(LUA52_FIND_VERSION_EXACT ${Lua52_FIND_VERSION_EXACT})
SET(LUA52_FIND_QUIETLY ${Lua52_FIND_QUIETLY})

include(Prebuilt)
include(FindPkgConfig)

pkg_search_module(LUA52 lua5.2 lua)

if(LUA52_FIND_VERSION)
  cmake_minimum_required(VERSION 2.6.2)
  set(LUA52_FAILED_VERSION_CHECK true)

  if(LUA52_FIND_VERSION_EXACT)
    if(LUA52_VERSION VERSION_EQUAL LUA52_FIND_VERSION)
      set(LUA52_FAILED_VERSION_CHECK false)
    endif()
  else()
    if(LUA52_VERSION VERSION_EQUAL   LUA52_FIND_VERSION OR
       LUA52_VERSION VERSION_GREATER LUA52_FIND_VERSION)
      set(LUA52_FAILED_VERSION_CHECK false)
    endif()
  endif()

  if(LUA52_FAILED_VERSION_CHECK)
    if(LUA52_FIND_REQUIRED AND NOT LUA52_FIND_QUIETLY)
        if(LUA52_FIND_VERSION_EXACT)
            message(FATAL_ERROR "Lua5.2 version check failed.  Version ${LUA52_VERSION} was found, version ${LUA52_FIND_VERSION} is needed exactly.")
        else(LUA52_FIND_VERSION_EXACT)
            message(FATAL_ERROR "Lua5.2 version check failed.  Version ${LUA52_VERSION} was found, at least version ${LUA52_FIND_VERSION} is required")
        endif(LUA52_FIND_VERSION_EXACT)
    endif(LUA52_FIND_REQUIRED AND NOT LUA52_FIND_QUIETLY)

  set(LUA52_FOUND false)
  endif(LUA52_FAILED_VERSION_CHECK)

endif(LUA52_FIND_VERSION)

if (LUA52_FOUND)
  set(LUA52 ON CACHE BOOL "Build with lua5.2 support.")
  if(APPLE)
    foreach(i ${LUA52_LIBRARIES})
      find_library(_lua52_LIBRARY NAMES ${i} HINTS ${LUA52_LIBRARY_DIRS})
      list(APPEND LUA52_LIBRARIES_FULL ${_lua52_LIBRARY})
      unset(_lua52_LIBRARY CACHE)
    endforeach(i)
    set(LUA52_LIBRARIES ${LUA52_LIBRARIES_FULL})
    unset(LUA52_LIBRARIES_FULL CACHE)
  endif(APPLE)
endif (LUA52_FOUND)
