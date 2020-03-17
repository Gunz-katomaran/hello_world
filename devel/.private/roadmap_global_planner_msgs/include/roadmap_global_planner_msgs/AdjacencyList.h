// Generated by gencpp from file roadmap_global_planner_msgs/AdjacencyList.msg
// DO NOT EDIT!


#ifndef ROADMAP_GLOBAL_PLANNER_MSGS_MESSAGE_ADJACENCYLIST_H
#define ROADMAP_GLOBAL_PLANNER_MSGS_MESSAGE_ADJACENCYLIST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <roadmap_global_planner_msgs/PointList.h>
#include <roadmap_global_planner_msgs/MapPair.h>

namespace roadmap_global_planner_msgs
{
template <class ContainerAllocator>
struct AdjacencyList_
{
  typedef AdjacencyList_<ContainerAllocator> Type;

  AdjacencyList_()
    : adj_list()
    , map()  {
    }
  AdjacencyList_(const ContainerAllocator& _alloc)
    : adj_list(_alloc)
    , map(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::roadmap_global_planner_msgs::PointList_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::roadmap_global_planner_msgs::PointList_<ContainerAllocator> >::other >  _adj_list_type;
  _adj_list_type adj_list;

   typedef std::vector< ::roadmap_global_planner_msgs::MapPair_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::roadmap_global_planner_msgs::MapPair_<ContainerAllocator> >::other >  _map_type;
  _map_type map;





  typedef boost::shared_ptr< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> const> ConstPtr;

}; // struct AdjacencyList_

typedef ::roadmap_global_planner_msgs::AdjacencyList_<std::allocator<void> > AdjacencyList;

typedef boost::shared_ptr< ::roadmap_global_planner_msgs::AdjacencyList > AdjacencyListPtr;
typedef boost::shared_ptr< ::roadmap_global_planner_msgs::AdjacencyList const> AdjacencyListConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace roadmap_global_planner_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'roadmap_global_planner_msgs': ['/home/katomaran-ros/catkin_ws8/src/roadmap_global_planner_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d2f6aa9b2ba6558c5394addb6c9bfc26";
  }

  static const char* value(const ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd2f6aa9b2ba6558cULL;
  static const uint64_t static_value2 = 0x5394addb6c9bfc26ULL;
};

template<class ContainerAllocator>
struct DataType< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "roadmap_global_planner_msgs/AdjacencyList";
  }

  static const char* value(const ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "roadmap_global_planner_msgs/PointList[] adj_list\n\
roadmap_global_planner_msgs/MapPair[] map\n\
================================================================================\n\
MSG: roadmap_global_planner_msgs/PointList\n\
int32[] list\n\
\n\
================================================================================\n\
MSG: roadmap_global_planner_msgs/MapPair\n\
int32 node\n\
geometry_msgs/Pose pose\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of position and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
";
  }

  static const char* value(const ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.adj_list);
      stream.next(m.map);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AdjacencyList_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::roadmap_global_planner_msgs::AdjacencyList_<ContainerAllocator>& v)
  {
    s << indent << "adj_list[]" << std::endl;
    for (size_t i = 0; i < v.adj_list.size(); ++i)
    {
      s << indent << "  adj_list[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::roadmap_global_planner_msgs::PointList_<ContainerAllocator> >::stream(s, indent + "    ", v.adj_list[i]);
    }
    s << indent << "map[]" << std::endl;
    for (size_t i = 0; i < v.map.size(); ++i)
    {
      s << indent << "  map[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::roadmap_global_planner_msgs::MapPair_<ContainerAllocator> >::stream(s, indent + "    ", v.map[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROADMAP_GLOBAL_PLANNER_MSGS_MESSAGE_ADJACENCYLIST_H