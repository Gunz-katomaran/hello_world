// Generated by gencpp from file path_follower/NearestResponse.msg
// DO NOT EDIT!


#ifndef PATH_FOLLOWER_MESSAGE_NEARESTRESPONSE_H
#define PATH_FOLLOWER_MESSAGE_NEARESTRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace path_follower
{
template <class ContainerAllocator>
struct NearestResponse_
{
  typedef NearestResponse_<ContainerAllocator> Type;

  NearestResponse_()
    : result(false)  {
    }
  NearestResponse_(const ContainerAllocator& _alloc)
    : result(false)  {
  (void)_alloc;
    }



   typedef uint8_t _result_type;
  _result_type result;





  typedef boost::shared_ptr< ::path_follower::NearestResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::path_follower::NearestResponse_<ContainerAllocator> const> ConstPtr;

}; // struct NearestResponse_

typedef ::path_follower::NearestResponse_<std::allocator<void> > NearestResponse;

typedef boost::shared_ptr< ::path_follower::NearestResponse > NearestResponsePtr;
typedef boost::shared_ptr< ::path_follower::NearestResponse const> NearestResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::path_follower::NearestResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::path_follower::NearestResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace path_follower

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'path_follower': ['/home/katomaran-ros/catkin_ws8/src/path_follower/msg', '/home/katomaran-ros/catkin_ws8/src/path_follower/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::path_follower::NearestResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::path_follower::NearestResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_follower::NearestResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_follower::NearestResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_follower::NearestResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_follower::NearestResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::path_follower::NearestResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "eb13ac1f1354ccecb7941ee8fa2192e8";
  }

  static const char* value(const ::path_follower::NearestResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xeb13ac1f1354ccecULL;
  static const uint64_t static_value2 = 0xb7941ee8fa2192e8ULL;
};

template<class ContainerAllocator>
struct DataType< ::path_follower::NearestResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "path_follower/NearestResponse";
  }

  static const char* value(const ::path_follower::NearestResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::path_follower::NearestResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool result\n\
\n\
";
  }

  static const char* value(const ::path_follower::NearestResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::path_follower::NearestResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NearestResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::path_follower::NearestResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::path_follower::NearestResponse_<ContainerAllocator>& v)
  {
    s << indent << "result: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PATH_FOLLOWER_MESSAGE_NEARESTRESPONSE_H
