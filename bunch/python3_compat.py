"""Compatibility module for Python 3.7+"""

__all__ = ('Mapping', 'Iterator', '_get_ident')

from collections.abc import Mapping, Iterator
from threading import get_ident as _get_ident

# The identity function is used in Bunch class for unicode handling
identity = lambda x: x
u = identity  # No longer needed, just kept for backward compatibility
