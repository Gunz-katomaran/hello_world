// Generated by gencpp from file path_follower/NearestRequest.msg
// DO NOT EDIT!


#ifndef PATH_FOLLOWER_MESSAGE_NEARESTREQUEST_H
#define PATH_FOLLOWER_MESSAGE_NEARESTREQUEST_H


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
struct NearestRequest_
{
  typedef NearestRequest_<ContainerAllocator> Type;

  NearestRequest_()
    : near(0)  {
    }
  NearestRequest_(const ContainerAllocator& _alloc)
    : near(0)  {
  (void)_alloc;
    }



   typedef int32_t _near_type;
  _near_type near;





  typedef boost::shared_ptr< ::path_follower::NearestRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::path_follower::NearestRequest_<ContainerAllocator> const> ConstPtr;

}; // struct NearestRequest_

typedef ::path_follower::NearestRequest_<std::allocator<void> > NearestRequest;

typedef boost::shared_ptr< ::path_follower::NearestRequest > NearestRequestPtr;
typedef boost::shared_ptr< ::path_follower::NearestRequest const> NearestRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::path_follower::NearestRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::path_follower::NearestRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::path_follower::NearestRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::path_follower::NearestRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_follower::NearestRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_follower::NearestRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_follower::NearestRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_follower::NearestRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::path_follower::NearestRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a06224190913faf40b21b98be252a68b";
  }

  static const char* value(const ::path_follower::NearestRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa06224190913faf4ULL;
  static const uint64_t static_value2 = 0x0b21b98be252a68bULL;
};

template<class ContainerAllocator>
struct DataType< ::path_follower::NearestRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "path_follower/NearestRequest";
  }

  static const char* value(const ::path_follower::NearestRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::path_follower::NearestRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 near\n\
";
  }

  static const char* value(const ::path_follower::NearestRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::path_follower::NearestRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.near);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NearestRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::path_follower::NearestRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::path_follower::NearestRequest_<ContainerAllocator>& v)
  {
    s << indent << "near: ";
    Printer<int32_t>::stream(s, indent + "  ", v.near);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PATH_FOLLOWER_MESSAGE_NEARESTREQUEST_H