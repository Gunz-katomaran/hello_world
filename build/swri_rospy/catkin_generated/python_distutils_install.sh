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
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/katomaran-ros/catkin_ws8/src/swri_rospy"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/katomaran-ros/catkin_ws8/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/katomaran-ros/catkin_ws8/install/lib/python2.7/dist-packages:/home/katomaran-ros/catkin_ws8/build/swri_rospy/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/katomaran-ros/catkin_ws8/build/swri_rospy" \
    "/usr/bin/python2" \
    "/home/katomaran-ros/catkin_ws8/src/swri_rospy/setup.py" \
    build --build-base "/home/katomaran-ros/catkin_ws8/build/swri_rospy" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/katomaran-ros/catkin_ws8/install" --install-scripts="/home/katomaran-ros/catkin_ws8/install/bin"
