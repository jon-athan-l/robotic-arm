// Generated by gencpp from file detect/MovementInformation.msg
// DO NOT EDIT!


#ifndef DETECT_MESSAGE_MOVEMENTINFORMATION_H
#define DETECT_MESSAGE_MOVEMENTINFORMATION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace detect
{
template <class ContainerAllocator>
struct MovementInformation_
{
  typedef MovementInformation_<ContainerAllocator> Type;

  MovementInformation_()
    : instructions()  {
    }
  MovementInformation_(const ContainerAllocator& _alloc)
    : instructions(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<int16_t, typename ContainerAllocator::template rebind<int16_t>::other >  _instructions_type;
  _instructions_type instructions;





  typedef boost::shared_ptr< ::detect::MovementInformation_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::detect::MovementInformation_<ContainerAllocator> const> ConstPtr;

}; // struct MovementInformation_

typedef ::detect::MovementInformation_<std::allocator<void> > MovementInformation;

typedef boost::shared_ptr< ::detect::MovementInformation > MovementInformationPtr;
typedef boost::shared_ptr< ::detect::MovementInformation const> MovementInformationConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::detect::MovementInformation_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::detect::MovementInformation_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::detect::MovementInformation_<ContainerAllocator1> & lhs, const ::detect::MovementInformation_<ContainerAllocator2> & rhs)
{
  return lhs.instructions == rhs.instructions;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::detect::MovementInformation_<ContainerAllocator1> & lhs, const ::detect::MovementInformation_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace detect

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::detect::MovementInformation_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::detect::MovementInformation_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::detect::MovementInformation_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::detect::MovementInformation_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::detect::MovementInformation_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::detect::MovementInformation_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::detect::MovementInformation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1a0b30a1eb7df94a9b605a7470fc6ff9";
  }

  static const char* value(const ::detect::MovementInformation_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1a0b30a1eb7df94aULL;
  static const uint64_t static_value2 = 0x9b605a7470fc6ff9ULL;
};

template<class ContainerAllocator>
struct DataType< ::detect::MovementInformation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "detect/MovementInformation";
  }

  static const char* value(const ::detect::MovementInformation_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::detect::MovementInformation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16[] instructions\n"
;
  }

  static const char* value(const ::detect::MovementInformation_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::detect::MovementInformation_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.instructions);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MovementInformation_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::detect::MovementInformation_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::detect::MovementInformation_<ContainerAllocator>& v)
  {
    s << indent << "instructions[]" << std::endl;
    for (size_t i = 0; i < v.instructions.size(); ++i)
    {
      s << indent << "  instructions[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.instructions[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // DETECT_MESSAGE_MOVEMENTINFORMATION_H
