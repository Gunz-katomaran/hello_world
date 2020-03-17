// Generated by gencpp from file robot_base_servo/speedResponse.msg
// DO NOT EDIT!


#ifndef ROBOT_BASE_SERVO_MESSAGE_SPEEDRESPONSE_H
#define ROBOT_BASE_SERVO_MESSAGE_SPEEDRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robot_base_servo
{
template <class ContainerAllocator>
struct speedResponse_
{
  typedef speedResponse_<ContainerAllocator> Type;

  speedResponse_()
    : speed_1(0)
    , speed_2(0)
    , speed_3(0)
    , speed_4(0)  {
    }
  speedResponse_(const ContainerAllocator& _alloc)
    : speed_1(0)
    , speed_2(0)
    , speed_3(0)
    , speed_4(0)  {
  (void)_alloc;
    }



   typedef int32_t _speed_1_type;
  _speed_1_type speed_1;

   typedef int32_t _speed_2_type;
  _speed_2_type speed_2;

   typedef int32_t _speed_3_type;
  _speed_3_type speed_3;

   typedef int32_t _speed_4_type;
  _speed_4_type speed_4;





  typedef boost::shared_ptr< ::robot_base_servo::speedResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robot_base_servo::speedResponse_<ContainerAllocator> const> ConstPtr;

}; // struct speedResponse_

typedef ::robot_base_servo::speedResponse_<std::allocator<void> > speedResponse;

typedef boost::shared_ptr< ::robot_base_servo::speedResponse > speedResponsePtr;
typedef boost::shared_ptr< ::robot_base_servo::speedResponse const> speedResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robot_base_servo::speedResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robot_base_servo::speedResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace robot_base_servo

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::robot_base_servo::speedResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robot_base_servo::speedResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_base_servo::speedResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_base_servo::speedResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_base_servo::speedResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_base_servo::speedResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robot_base_servo::speedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f4e6290d51987b0b075a95509c473580";
  }

  static const char* value(const ::robot_base_servo::speedResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf4e6290d51987b0bULL;
  static const uint64_t static_value2 = 0x075a95509c473580ULL;
};

template<class ContainerAllocator>
struct DataType< ::robot_base_servo::speedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robot_base_servo/speedResponse";
  }

  static const char* value(const ::robot_base_servo::speedResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robot_base_servo::speedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 speed_1\n\
int32 speed_2\n\
int32 speed_3\n\
int32 speed_4\n\
\n\
";
  }

  static const char* value(const ::robot_base_servo::speedResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robot_base_servo::speedResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.speed_1);
      stream.next(m.speed_2);
      stream.next(m.speed_3);
      stream.next(m.speed_4);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct speedResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robot_base_servo::speedResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robot_base_servo::speedResponse_<ContainerAllocator>& v)
  {
    s << indent << "speed_1: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speed_1);
    s << indent << "speed_2: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speed_2);
    s << indent << "speed_3: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speed_3);
    s << indent << "speed_4: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speed_4);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOT_BASE_SERVO_MESSAGE_SPEEDRESPONSE_H