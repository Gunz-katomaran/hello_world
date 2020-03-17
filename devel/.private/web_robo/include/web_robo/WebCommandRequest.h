// Generated by gencpp from file web_robo/WebCommandRequest.msg
// DO NOT EDIT!


#ifndef WEB_ROBO_MESSAGE_WEBCOMMANDREQUEST_H
#define WEB_ROBO_MESSAGE_WEBCOMMANDREQUEST_H


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
struct WebCommandRequest_
{
  typedef WebCommandRequest_<ContainerAllocator> Type;

  WebCommandRequest_()
    : command()  {
    }
  WebCommandRequest_(const ContainerAllocator& _alloc)
    : command(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _command_type;
  _command_type command;





  typedef boost::shared_ptr< ::web_robo::WebCommandRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::web_robo::WebCommandRequest_<ContainerAllocator> const> ConstPtr;

}; // struct WebCommandRequest_

typedef ::web_robo::WebCommandRequest_<std::allocator<void> > WebCommandRequest;

typedef boost::shared_ptr< ::web_robo::WebCommandRequest > WebCommandRequestPtr;
typedef boost::shared_ptr< ::web_robo::WebCommandRequest const> WebCommandRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::web_robo::WebCommandRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::web_robo::WebCommandRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::web_robo::WebCommandRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::web_robo::WebCommandRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::web_robo::WebCommandRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::web_robo::WebCommandRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::web_robo::WebCommandRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::web_robo::WebCommandRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::web_robo::WebCommandRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cba5e21e920a3a2b7b375cb65b64cdea";
  }

  static const char* value(const ::web_robo::WebCommandRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcba5e21e920a3a2bULL;
  static const uint64_t static_value2 = 0x7b375cb65b64cdeaULL;
};

template<class ContainerAllocator>
struct DataType< ::web_robo::WebCommandRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "web_robo/WebCommandRequest";
  }

  static const char* value(const ::web_robo::WebCommandRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::web_robo::WebCommandRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string command\n\
";
  }

  static const char* value(const ::web_robo::WebCommandRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::web_robo::WebCommandRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.command);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct WebCommandRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::web_robo::WebCommandRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::web_robo::WebCommandRequest_<ContainerAllocator>& v)
  {
    s << indent << "command: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.command);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WEB_ROBO_MESSAGE_WEBCOMMANDREQUEST_H
