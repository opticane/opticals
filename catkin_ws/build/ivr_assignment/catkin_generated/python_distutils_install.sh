#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/media/sf_cw/catkin_ws/src/ivr_assignment"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/media/sf_cw/catkin_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/media/sf_cw/catkin_ws/install/lib/python3/dist-packages:/media/sf_cw/catkin_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/media/sf_cw/catkin_ws/build" \
    "/usr/bin/python3" \
    "/media/sf_cw/catkin_ws/src/ivr_assignment/setup.py" \
    egg_info --egg-base /media/sf_cw/catkin_ws/build/ivr_assignment \
    build --build-base "/media/sf_cw/catkin_ws/build/ivr_assignment" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/media/sf_cw/catkin_ws/install" --install-scripts="/media/sf_cw/catkin_ws/install/bin"
