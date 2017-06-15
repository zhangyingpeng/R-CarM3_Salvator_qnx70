ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

NAME=pci_hw-$(notdir $(PROJECT_ROOT))
INSTALLDIR=lib/dll/pci/
USEFILE=$(PROJECT_ROOT)/$(SECTION)/$(SECTION).use

ENDIAN=$(filter le be, $(VARIANT_LIST))
#ENDIAN=$(patsubst %e,-%e,$(END))

EXTRA_INCVPATH+=$(PROJECT_ROOT)/../
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../../../../lib/pci
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../../modules/capabilities
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../../modules/slog
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../../modules/debug
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../../server
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../..

EXTRA_SRCVPATH+=$(PROJECT_ROOT)/../../_common/
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/../src/
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/../src/parse
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/../src/rsrcdb
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/../src/syspage

CCFLAGS+=-DMODULE_VERSION="\"$(subst .,_,$(SO_VERSION))\""

include $(MKFILES_ROOT)/qmacros.mk

include $(SECTION_ROOT)/$(SECTION).mk
-include $(PROJECT_ROOT)/$(SECTION)/extra.mk


#####AUTO-GENERATED by packaging script... do not checkin#####
   INSTALL_ROOT_nto = $(PROJECT_ROOT)/../../../../../../install
   USE_INSTALL_ROOT=1
##############################################################

include $(MKFILES_ROOT)/qtargets.mk

