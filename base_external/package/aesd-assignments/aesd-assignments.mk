
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 95647a27f198422fa1ab1ef79d346a4c2816672f
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = "git@github.com:cu-ecen-aeld/assignments-3-and-later-dmoneyballer.git"
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(TARGET_DIR)/usr/bin all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/usr/bin all
	$(INSTALL) -d 0777 $(TARGET_CONFIGRE_OPTS) -C $(@D)/usr/bin
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMD
	cp -f -a $(@D)/finder-app $(TARGET_DIR)/usr/bin/
	$(INSTALL) -d 0777 $(@D)/ $(TARGET_DIR)usr/bin/
	$(INSTALL) -d 0755 $(@D)/finder-app $(TARGET_DIR)/bin/
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
endef

$(eval $(generic-package))
