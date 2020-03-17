// Generated by gencpp from file patrol_planner/Tl_glRequest.msg
// DO NOT EDIT!


#ifndef PATROL_PLANNER_MESSAGE_TL_GLREQUEST_H
#define PATROL_PLANNER_MESSAGE_TL_GLREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace patrol_planner
{
template <class ContainerAllocator>
struct Tl_glRequest_
{
  typedef Tl_glRequest_<ContainerAllocator> Type;

  Tl_glRequest_()
    : table_name()  {
    }
  Tl_glRequest_(const ContainerAllocator& _alloc)
    : table_name(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _table_name_type;
  _table_name_type table_name;





  typedef boost::shared_ptr< ::patrol_planner::Tl_glRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::patrol_planner::Tl_glRequest_<ContainerAllocator> const> ConstPtr;

}; // struct Tl_glRequest_

typedef ::patrol_planner::Tl_glRequest_<std::allocator<void> > Tl_glRequest;

typedef boost::shared_ptr< ::patrol_planner::Tl_glRequest > Tl_glRequestPtr;
typedef boost::shared_ptr< ::patrol_planner::Tl_glRequest const> Tl_glRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::patrol_planner::Tl_glRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::patrol_planner::Tl_glRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace patrol_planner

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'patrol_planner': ['/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg', '/home/katomaran-ros/catkin_ws8/src/patrol_planner/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::patrol_planner::Tl_glRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::patrol_planner::Tl_glRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::patrol_planner::Tl_glRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::patrol_planner::Tl_glRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::patrol_planner::Tl_glRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::patrol_planner::Tl_glRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::patrol_planner::Tl_glRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "92416677ce2a8e4f7fc15435da492a7c";
  }

  static const char* value(const ::patrol_planner::Tl_glRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x92416677ce2a8e4fULL;
  static const uint64_t static_value2 = 0x7fc15435da492a7cULL;
};

template<class ContainerAllocator>
struct DataType< ::patrol_planner::Tl_glRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "patrol_planner/Tl_glRequest";
  }

  static const char* value(const ::patrol_planner::Tl_glRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::patrol_planner::Tl_glRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string table_name\n\
";
  }

  static const char* value(const ::patrol_planner::Tl_glRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::patrol_planner::Tl_glRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.table_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Tl_glRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::patrol_planner::Tl_glRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::patrol_planner::Tl_glRequest_<ContainerAllocator>& v)
  {
    s << indent << "table_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.table_name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PATROL_PLANNER_MESSAGE_TL_GLREQUEST_H
