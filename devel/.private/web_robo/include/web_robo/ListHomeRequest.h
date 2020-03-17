// Generated by gencpp from file web_robo/ListHomeRequest.msg
// DO NOT EDIT!


#ifndef WEB_ROBO_MESSAGE_LISTHOMEREQUEST_H
#define WEB_ROBO_MESSAGE_LISTHOMEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace web_robo
{
template <class ContainerAllocator>
struct ListHomeRequest_
{
  typedef ListHomeRequest_<ContainerAllocator> Type;

  ListHomeRequest_()
    : web_request()  {
    }
  ListHomeRequest_(const ContainerAllocator& _alloc)
    : web_request(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _web_request_type;
  _web_request_type web_request;





  typedef boost::shared_ptr< ::web_robo::ListHomeRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::web_robo::ListHomeRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ListHomeRequest_

typedef ::web_robo::ListHomeRequest_<std::allocator<void> > ListHomeRequest;

typedef boost::shared_ptr< ::web_robo::ListHomeRequest > ListHomeRequestPtr;
typedef boost::shared_ptr< ::web_robo::ListHomeRequest const> ListHomeRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::web_robo::ListHomeRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::web_robo::ListHomeRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace web_robo

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::web_robo::ListHomeRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::web_robo::ListHomeRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::web_robo::ListHomeRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::web_robo::ListHomeRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::web_robo::ListHomeRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::web_robo::ListHomeRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::web_robo::ListHomeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bffa79c1952358a343390760df0febf2";
  }

  static const char* value(const ::web_robo::ListHomeRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbffa79c1952358a3ULL;
  static const uint64_t static_value2 = 0x43390760df0febf2ULL;
};

template<class ContainerAllocator>
struct DataType< ::web_robo::ListHomeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "web_robo/ListHomeRequest";
  }

  static const char* value(const ::web_robo::ListHomeRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::web_robo::ListHomeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string web_request\n\
";
  }

  static const char* value(const ::web_robo::ListHomeRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::web_robo::ListHomeRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.web_request);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ListHomeRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::web_robo::ListHomeRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::web_robo::ListHomeRequest_<ContainerAllocator>& v)
  {
    s << indent << "web_request: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.web_request);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WEB_ROBO_MESSAGE_LISTHOMEREQUEST_H
