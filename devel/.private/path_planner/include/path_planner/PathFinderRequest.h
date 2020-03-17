// Generated by gencpp from file path_planner/PathFinderRequest.msg
// DO NOT EDIT!


#ifndef PATH_PLANNER_MESSAGE_PATHFINDERREQUEST_H
#define PATH_PLANNER_MESSAGE_PATHFINDERREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace path_planner
{
template <class ContainerAllocator>
struct PathFinderRequest_
{
  typedef PathFinderRequest_<ContainerAllocator> Type;

  PathFinderRequest_()
    : start(0)
    , goal(0)  {
    }
  PathFinderRequest_(const ContainerAllocator& _alloc)
    : start(0)
    , goal(0)  {
  (void)_alloc;
    }



   typedef int32_t _start_type;
  _start_type start;

   typedef int32_t _goal_type;
  _goal_type goal;





  typedef boost::shared_ptr< ::path_planner::PathFinderRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::path_planner::PathFinderRequest_<ContainerAllocator> const> ConstPtr;

}; // struct PathFinderRequest_

typedef ::path_planner::PathFinderRequest_<std::allocator<void> > PathFinderRequest;

typedef boost::shared_ptr< ::path_planner::PathFinderRequest > PathFinderRequestPtr;
typedef boost::shared_ptr< ::path_planner::PathFinderRequest const> PathFinderRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::path_planner::PathFinderRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::path_planner::PathFinderRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace path_planner

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'roadmap_global_planner_msgs': ['/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::path_planner::PathFinderRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::path_planner::PathFinderRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_planner::PathFinderRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_planner::PathFinderRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_planner::PathFinderRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_planner::PathFinderRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::path_planner::PathFinderRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cfc25244a7752ea588e96a62adce79d8";
  }

  static const char* value(const ::path_planner::PathFinderRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcfc25244a7752ea5ULL;
  static const uint64_t static_value2 = 0x88e96a62adce79d8ULL;
};

template<class ContainerAllocator>
struct DataType< ::path_planner::PathFinderRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "path_planner/PathFinderRequest";
  }

  static const char* value(const ::path_planner::PathFinderRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::path_planner::PathFinderRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 start\n\
int32 goal\n\
";
  }

  static const char* value(const ::path_planner::PathFinderRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::path_planner::PathFinderRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.start);
      stream.next(m.goal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PathFinderRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::path_planner::PathFinderRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::path_planner::PathFinderRequest_<ContainerAllocator>& v)
  {
    s << indent << "start: ";
    Printer<int32_t>::stream(s, indent + "  ", v.start);
    s << indent << "goal: ";
    Printer<int32_t>::stream(s, indent + "  ", v.goal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PATH_PLANNER_MESSAGE_PATHFINDERREQUEST_H