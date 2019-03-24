#!python
import subprocess
import os

env = Environment()

# If we are being called from a higher SConstruct, then import the PREFIX, if not then get from arguments
try :
    Import( 'PREFIX' )
except  :
    PREFIX = Dir(ARGUMENTS.get( "prefix", "/usr/local" )).abspath
print( "PREFIX: %s" % (PREFIX) )

cppDefines 		= {}
cppFlags 		= ['-Wall' ]#, '-Werror']
cxxFlags 		= ['-std=c++11', '-O3' ]
paths 			= [ '.', PREFIX + '/include/', PREFIX + '/include/XmlConfig/' ]




########################## Project Target #####################################
common_env = env.Clone()
common_env.Append(CPPDEFINES 	= cppDefines)
common_env.Append(CPPFLAGS 		= cppFlags)
common_env.Append(CXXFLAGS 		= cxxFlags)
common_env.Append(LINKFLAGS 	= cxxFlags )
common_env.Append(CPPPATH		= paths)
common_env.Append(LIBPATH 		= [ PREFIX + "/lib" ] )


jdb_log_level = ARGUMENTS.get( "ll", 0 )
common_env.Append(CXXFLAGS 		= "-DJDB_LOG_LEVEL=" + str(jdb_log_level) )
target = common_env.StaticLibrary( target='TaskEngine', source=[ Glob( "*.cpp" ) ] )

# Install the Header files and lib file:
install = [
    common_env.Install( PREFIX + '/include/TaskEngine/', [Glob("*.h")] ),
    common_env.Install( PREFIX + '/lib', [Glob("*.a")] ) 
]


# set as the default target
Default( target, install )

