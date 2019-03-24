#!python
import subprocess
import os

env = Environment()

cppDefines 		= {}
cppFlags 		= ['-Wall' ]#, '-Werror']
cxxFlags 		= ['-std=c++11', '-O3' ]
paths 			= [ '.' ]


########################## Project Target #####################################
common_env = env.Clone()
common_env.Append(CPPDEFINES 	= cppDefines)
common_env.Append(CPPFLAGS 		= cppFlags)
common_env.Append(CXXFLAGS 		= cxxFlags)
common_env.Append(LINKFLAGS 	= cxxFlags )
common_env.Append(CPPPATH		= paths)



jdb_log_level = ARGUMENTS.get( "ll", 0 )
common_env.Append(CXXFLAGS 		= "-DJDB_LOG_LEVEL=" + str(jdb_log_level) )
target = common_env.StaticLibrary( target='TaskEngine', source=[ Glob( "*.cpp" ) ] )

# Install the Header files and lib file:
install = [
    common_env.Install( '/usr/local/include/TaskEngine/', [Glob("*.h")] ),
    common_env.Install( '/usr/local/lib', [Glob("*.a")] ) 
]


# set as the default target
Default( target, install )

