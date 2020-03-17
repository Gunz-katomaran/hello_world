// Generated by gencpp from file path_follower/PoseList.msg
// DO NOT EDIT!


#ifndef PATH_FOLLOWER_MESSAGE_POSELIST_H
#define PATH_FOLLOWER_MESSAGE_POSELIST_H


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
struct PoseList_
{
  typedef PoseList_<ContainerAllocator> Type;

  PoseList_()
    : list()  {
    }
  PoseList_(const ContainerAllocator& _alloc)
    : list(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _list_type;
  _list_type list;





  typedef boost::shared_ptr< ::path_follower::PoseList_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::path_follower::PoseList_<ContainerAllocator> const> ConstPtr;

}; // struct PoseList_

typedef ::path_follower::PoseList_<std::allocator<void> > PoseList;

typedef boost::shared_ptr< ::path_follower::PoseList > PoseListPtr;
typedef boost::shared_ptr< ::path_follower::PoseList const> PoseListConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::path_follower::PoseList_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::path_follower::PoseList_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace path_follower

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'path_follower': ['/home/katomaran-ros/catkin_ws8/src/path_follower/msg', '/home/katomaran-ros/catkin_ws8/src/path_follower/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::path_follower::PoseList_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::path_follower::PoseList_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_follower::PoseList_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_follower::PoseList_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_follower::PoseList_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_follower::PoseList_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::path_follower::PoseList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f899bbf34605ab8c1065aaee8c9708ca";
  }

  static const char* value(const ::path_follower::PoseList_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf899bbf34605ab8cULL;
  static const uint64_t static_value2 = 0x1065aaee8c9708caULL;
};

template<class ContainerAllocator>
struct DataType< ::path_follower::PoseList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "path_follower/PoseList";
  }

  static const char* value(const ::path_follower::PoseList_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::path_follower::PoseList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[] list\n\
";
  }

  static const char* value(const ::path_follower::PoseList_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::path_follower::PoseList_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.list);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PoseList_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::path_follower::PoseList_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::path_follower::PoseList_<ContainerAllocator>& v)
  {
    s << indent << "list[]" << std::endl;
    for (size_t i = 0; i < v.list.size(); ++i)
    {
      s << indent << "  list[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.list[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // PATH_FOLLOWER_MESSAGE_POSELIST_H