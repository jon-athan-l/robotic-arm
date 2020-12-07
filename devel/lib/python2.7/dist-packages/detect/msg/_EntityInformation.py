# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from detect/EntityInformation.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class EntityInformation(genpy.Message):
  _md5sum = "4d47ff85ed47785b133aaf336fe6729d"
  _type = "detect/EntityInformation"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int16[2] centerPoint
int16[2] generalizedEntityPoint

"""
  __slots__ = ['centerPoint','generalizedEntityPoint']
  _slot_types = ['int16[2]','int16[2]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       centerPoint,generalizedEntityPoint

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(EntityInformation, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.centerPoint is None:
        self.centerPoint = [0] * 2
      if self.generalizedEntityPoint is None:
        self.generalizedEntityPoint = [0] * 2
    else:
      self.centerPoint = [0] * 2
      self.generalizedEntityPoint = [0] * 2

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      buff.write(_get_struct_2h().pack(*self.centerPoint))
      buff.write(_get_struct_2h().pack(*self.generalizedEntityPoint))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      self.centerPoint = _get_struct_2h().unpack(str[start:end])
      start = end
      end += 4
      self.generalizedEntityPoint = _get_struct_2h().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      buff.write(self.centerPoint.tostring())
      buff.write(self.generalizedEntityPoint.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      self.centerPoint = numpy.frombuffer(str[start:end], dtype=numpy.int16, count=2)
      start = end
      end += 4
      self.generalizedEntityPoint = numpy.frombuffer(str[start:end], dtype=numpy.int16, count=2)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2h = None
def _get_struct_2h():
    global _struct_2h
    if _struct_2h is None:
        _struct_2h = struct.Struct("<2h")
    return _struct_2h
