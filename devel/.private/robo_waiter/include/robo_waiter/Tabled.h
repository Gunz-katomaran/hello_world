// Generated by gencpp from file robo_waiter/Tabled.msg
// DO NOT EDIT!


#ifndef ROBO_WAITER_MESSAGE_TABLED_H
#define ROBO_WAITER_MESSAGE_TABLED_H


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
struct Tabled_
{
  typedef Tabled_<ContainerAllocator> Type;

  Tabled_()
    : name()
    , x(0.0)
    , y(0.0)
    , z(0.0)
    , w(0.0)  {
    }
  Tabled_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , x(0.0)
    , y(0.0)
    , z(0.0)
    , w(0.0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _z_type;
  _z_type z;

   typedef float _w_type;
  _w_type w;





  typedef boost::shared_ptr< ::robo_waiter::Tabled_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robo_waiter::Tabled_<ContainerAllocator> const> ConstPtr;

}; // struct Tabled_

typedef ::robo_waiter::Tabled_<std::allocator<void> > Tabled;

typedef boost::shared_ptr< ::robo_waiter::Tabled > TabledPtr;
typedef boost::shared_ptr< ::robo_waiter::Tabled const> TabledConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robo_waiter::Tabled_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robo_waiter::Tabled_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::robo_waiter::Tabled_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robo_waiter::Tabled_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robo_waiter::Tabled_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robo_waiter::Tabled_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robo_waiter::Tabled_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robo_waiter::Tabled_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robo_waiter::Tabled_<ContainerAllocator> >
{
  static const char* value()
  {
    return "96c018b19c8655a16f8ae708e0a815d4";
  }

  static const char* value(const ::robo_waiter::Tabled_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x96c018b19c8655a1ULL;
  static const uint64_t static_value2 = 0x6f8ae708e0a815d4ULL;
};

template<class ContainerAllocator>
struct DataType< ::robo_waiter::Tabled_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robo_waiter/Tabled";
  }

  static const char* value(const ::robo_waiter::Tabled_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robo_waiter::Tabled_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n\
float32 x\n\
float32 y\n\
float32 z\n\
float32 w\n\
";
  }

  static const char* value(const ::robo_waiter::Tabled_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robo_waiter::Tabled_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.w);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Tabled_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robo_waiter::Tabled_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robo_waiter::Tabled_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<float>::stream(s, indent + "  ", v.z);
    s << indent << "w: ";
    Printer<float>::stream(s, indent + "  ", v.w);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBO_WAITER_MESSAGE_TABLED_H
