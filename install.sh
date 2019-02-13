DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Headers
mkdir -p /usr/local/lib
ln -sf ${DIR}/libTaskEngine.a /usr/local/lib/libTaskEngine.a

mkdir -p /usr/local/include/TaskEngine
cp *.h /usr/local/include/TaskEngine/