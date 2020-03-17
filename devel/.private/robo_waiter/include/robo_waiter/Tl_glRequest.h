// Generated by gencpp from file robo_waiter/Tl_glRequest.msg
// DO NOT EDIT!


#ifndef ROBO_WAITER_MESSAGE_TL_GLREQUEST_H
#define ROBO_WAITER_MESSAGE_TL_GLREQUEST_H


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
struct Tl_glRequest_
{
  typedef Tl_glRequest_<ContainerAllocator> Type;

  Tl_glRequest_()
    : table_name()
    , direction()
    , duration(0)  {
    }
  Tl_glRequest_(const ContainerAllocator& _alloc)
    : table_name(_alloc)
    , direction(_alloc)
    , duration(0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _table_name_type;
  _table_name_type table_name;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _direction_type;
  _direction_type direction;

   typedef int32_t _duration_type;
  _duration_type duration;





  typedef boost::shared_ptr< ::robo_waiter::Tl_glRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robo_waiter::Tl_glRequest_<ContainerAllocator> const> ConstPtr;

}; // struct Tl_glRequest_

typedef ::robo_waiter::Tl_glRequest_<std::allocator<void> > Tl_glRequest;

typedef boost::shared_ptr< ::robo_waiter::Tl_glRequest > Tl_glRequestPtr;
typedef boost::shared_ptr< ::robo_waiter::Tl_glRequest const> Tl_glRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robo_waiter::Tl_glRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robo_waiter::Tl_glRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::robo_waiter::Tl_glRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robo_waiter::Tl_glRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robo_waiter::Tl_glRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robo_waiter::Tl_glRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robo_waiter::Tl_glRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robo_waiter::Tl_glRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robo_waiter::Tl_glRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "da92993e57bccc9097d5d4f173a11e47";
  }

  static const char* value(const ::robo_waiter::Tl_glRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xda92993e57bccc90ULL;
  static const uint64_t static_value2 = 0x97d5d4f173a11e47ULL;
};

template<class ContainerAllocator>
struct DataType< ::robo_waiter::Tl_glRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robo_waiter/Tl_glRequest";
  }

  static const char* value(const ::robo_waiter::Tl_glRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robo_waiter::Tl_glRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string table_name\n\
string direction\n\
int32 duration\n\
";
  }

  static const char* value(const ::robo_waiter::Tl_glRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robo_waiter::Tl_glRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.table_name);
      stream.next(m.direction);
      stream.next(m.duration);
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
struct Printer< ::robo_waiter::Tl_glRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robo_waiter::Tl_glRequest_<ContainerAllocator>& v)
  {
    s << indent << "table_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.table_name);
    s << indent << "direction: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.direction);
    s << indent << "duration: ";
    Printer<int32_t>::stream(s, indent + "  ", v.duration);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBO_WAITER_MESSAGE_TL_GLREQUEST_H