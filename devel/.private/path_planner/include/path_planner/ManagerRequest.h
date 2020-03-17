// Generated by gencpp from file path_planner/ManagerRequest.msg
// DO NOT EDIT!


#ifndef PATH_PLANNER_MESSAGE_MANAGERREQUEST_H
#define PATH_PLANNER_MESSAGE_MANAGERREQUEST_H


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
struct ManagerRequest_
{
  typedef ManagerRequest_<ContainerAllocator> Type;

  ManagerRequest_()
    : name()  {
    }
  ManagerRequest_(const ContainerAllocator& _alloc)
    : name(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;





  typedef boost::shared_ptr< ::path_planner::ManagerRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::path_planner::ManagerRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ManagerRequest_

typedef ::path_planner::ManagerRequest_<std::allocator<void> > ManagerRequest;

typedef boost::shared_ptr< ::path_planner::ManagerRequest > ManagerRequestPtr;
typedef boost::shared_ptr< ::path_planner::ManagerRequest const> ManagerRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::path_planner::ManagerRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::path_planner::ManagerRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace path_planner

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'roadmap_global_planner_msgs': ['/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::path_planner::ManagerRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::path_planner::ManagerRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_planner::ManagerRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_planner::ManagerRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_planner::ManagerRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_planner::ManagerRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::path_planner::ManagerRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c1f3d28f1b044c871e6eff2e9fc3c667";
  }

  static const char* value(const ::path_planner::ManagerRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc1f3d28f1b044c87ULL;
  static const uint64_t static_value2 = 0x1e6eff2e9fc3c667ULL;
};

template<class ContainerAllocator>
struct DataType< ::path_planner::ManagerRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "path_planner/ManagerRequest";
  }

  static const char* value(const ::path_planner::ManagerRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::path_planner::ManagerRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n\
";
  }

  static const char* value(const ::path_planner::ManagerRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::path_planner::ManagerRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ManagerRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::path_planner::ManagerRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::path_planner::ManagerRequest_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PATH_PLANNER_MESSAGE_MANAGERREQUEST_H
