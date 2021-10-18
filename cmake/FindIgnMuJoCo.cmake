#===============================================================================
# Copyright (C) 2021 Open Source Robotics Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
########################################
#--------------------------------------
# Find MuJoCo headers and libraries
#
# Usage of this module as follows:
#
#     ign_find_package(IgnMuJoCo)
#
# Variables defined by this module:
#
#  IgnMuJoCo::IgnMuJoCo        Imported target for MuJoCo

include(FindPackageHandleStandardArgs)

find_path(IgnMuJoCo_INCLUDE_DIRS mujoco.h)
mark_as_advanced(IgnMuJoCo_INCLUDE_DIRS)
find_library(IgnMuJoCo_LIBRARY mujoco210 libmujoco210 PATH_SUFFIXES bin)
mark_as_advanced(IgnMuJoCo_LIBRARY)

find_package_handle_standard_args(IgnMuJoCo DEFAULT_MSG IgnMuJoCo_INCLUDE_DIRS IgnMuJoCo_LIBRARY)

if(IgnMuJoCo_FOUND)
    if(NOT TARGET IgnMuJoCo::IgnMuJoCo)
        include(IgnImportTarget)
        ign_import_target(IgnMuJoCo
          TARGET_NAME IgnMuJoCo::IgnMuJoCo
          LIB_VAR IgnMuJoCo_LIBRARY
          INCLUDE_VAR IgnMuJoCo_INCLUDE_DIRS)
    endif()
endif()
