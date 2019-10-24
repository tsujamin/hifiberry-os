################################################################################
#
# beocreate
#
################################################################################

BEOCREATE_VERSION = 2f4e59900405f9c4c6b5093c59d3b5b58dfe8559
BEOCREATE_SITE = $(call github,bang-olufsen,create,$(BEOCREATE_VERSION))

define BEOCREATE_BUILD_CMDS
endef

define BEOCREATE_INSTALL_TARGET_CMDS
        mkdir -p $(TARGET_DIR)/opt/beocreate
	mkdir -p $(TARGET_DIR)/etc/beocreate
        cp -rv $(@D)/Beocreate2/beo-system $(TARGET_DIR)/opt/beocreate
	cp -rv $(@D)/Beocreate2/beo-extensions $(TARGET_DIR)/opt/beocreate
	cp -rv $(@D)/beocreate_essentials $(TARGET_DIR)/opt/beocreate
	cp -rv $(@D)/Beocreate2/etc/* $(TARGET_DIR)/etc/beocreate
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/beocreate/system.json \
                $(TARGET_DIR)/etc/beocreate/system.json
        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/beocreate/system.json \
                $(TARGET_DIR)/etc/beocreate/system.json.orig
        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/beocreate/sources.json \
                $(TARGET_DIR)/etc/beocreate/sources.json
        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/beocreate/sources.json \
                $(TARGET_DIR)/etc/beocreate/sources.json.orig
endef

define BEOCREATE_INSTALL_INIT_SYSTEMD
        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/beocreate/beocreate2.service \
                $(TARGET_DIR)/lib/systemd/system/beocreate2.service
	ln -fs ../../../../usr/lib/systemd/system/beocreate2.service \
           $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/beocreate2.service
endef

$(eval $(generic-package))