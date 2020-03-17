// Generated by gencpp from file robo_waiter/TableRequest.msg
// DO NOT EDIT!


#ifndef ROBO_WAITER_MESSAGE_TABLEREQUEST_H
#define ROBO_WAITER_MESSAGE_TABLEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robo_waiter
{
template <class ContainerAllocator>
struct TableRequest_
{
  typedef TableRequest_<ContainerAllocator> Type;

  TableRequest_()
    : table_name()  {
    }
  TableRequest_(const ContainerAllocator& _alloc)
    : table_name(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _table_name_type;
  _table_name_type table_name;





  typedef boost::shared_ptr< ::robo_waiter::TableRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robo_waiter::TableRequest_<ContainerAllocator> const> ConstPtr;

}; // struct TableRequest_

typedef ::robo_waiter::TableRequest_<std::allocator<void> > TableRequest;

typedef boost::shared_ptr< ::robo_waiter::TableRequest > TableRequestPtr;
typedef boost::shared_ptr< ::robo_waiter::TableRequest const> TableRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robo_waiter::TableRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robo_waiter::TableRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace robo_waiter

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'robo_waiter': ['/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg', '/home/katomaran-ros/catkin_ws8/src/robo_waiter/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::robo_waiter::TableRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robo_waiter::TableRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robo_waiter::TableRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robo_waiter::TableRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robo_waiter::TableRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robo_waiter::TableRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robo_waiter::TableRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "92416677ce2a8e4f7fc15435da492a7c";
  }

  static const char* value(const ::robo_waiter::TableRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x92416677ce2a8e4fULL;
  static const uint64_t static_value2 = 0x7fc15435da492a7cULL;
};

template<class ContainerAllocator>
struct DataType< ::robo_waiter::TableRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robo_waiter/TableRequest";
  }

  static const char* value(const ::robo_waiter::TableRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robo_waiter::TableRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string table_name\n\
";
  }

  static const char* value(const ::robo_waiter::TableRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robo_waiter::TableRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.table_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TableRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robo_waiter::TableRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robo_waiter::TableRequest_<ContainerAllocator>& v)
  {
    s << indent << "table_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.table_name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBO_WAITER_MESSAGE_TABLEREQUEST_H