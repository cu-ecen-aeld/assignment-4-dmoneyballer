
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 384848212dfddca7529e1aba8aba97024abd84bc
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com: 
#AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-dmoneyballer.git
AESD_ASSIGNMENTS_SITE = https://github.com/cu-ecen-aeld/assignments-3-and-later-dmoneyballer.git
AESD_ASSIGNMENTS_SITE_METHOD = https
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES
AESD_ASSIGNMENTS_INSTALL_TARGET = YES
define AESD_ASSIGNMENTS_BUILD_CMDS
	git clone https://github.com/cu-ecen-aeld/assignments-3-and-later-dmoneyballer.git
	cd assignments-3-and-later-dmoneyballer
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) $(TARGET_CONFIGURE_OPTS) -D -m 0755  $(@D)/finder-app/finder $(TARGET_DIR)/usr/bin/
	$(INSTALL) $(TARGET_CONFIGURE_OPTS) -D -m 0755  $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) $(TARGET_CONFIGURE_OPTS) -D -m 0755  $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/ 
	$(INSTALL) $(TARGET_CONFIGURE_OPTS) -D -m 0755  $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
	$(INSTALL) $(TARGET_CONFIGURE_OPTS) -D -m 0755  $(@D)/finder-app/writer.sh $(TARGET_DIR)/usr/bin/ 	
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
endef

$(eval $(generic-package))
