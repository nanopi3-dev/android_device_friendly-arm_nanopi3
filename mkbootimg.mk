TARGET_OUT_BOOT := $(PRODUCT_OUT)/boot
TARGET_OUT_RECOVERY := $(PRODUCT_OUT)/recovery_uboot

$(INSTALLED_BOOTIMAGE_TARGET): $(MAKE_EXT4FS) \
		$(INTERNAL_BOOTIMAGE_FILES) \
		$(recovery_ramdisk) \
		$(BOOTIMAGE_EXTRA_DEPS)
	$(call pretty,"Target boot ext4fs image: $@")
	$(hide) mkdir -p $(TARGET_OUT_BOOT)
	$(hide) cp -f $(INSTALLED_KERNEL_TARGET) $(TARGET_OUT_BOOT)/uImage
	$(hide) cp -f $(INSTALLED_RAMDISK_TARGET) $(TARGET_OUT_BOOT)/root.img.gz
	$(hide) cp -f $(recovery_ramdisk) $(TARGET_OUT_BOOT)/ramdisk-recovery.img
	$(hide) $(MAKE_EXT4FS) \
		-l $(BOARD_BOOTIMAGE_PARTITION_SIZE) \
		-a boot \
		-s \
		$@ $(TARGET_OUT_BOOT)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE))
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MAKE_EXT4FS) \
		$(recovery_ramdisk) $(recovery_kernel)
	$(hide) mkdir -p $(TARGET_OUT_RECOVERY)
	$(hide) cp -f $(recovery_kernel) $(TARGET_OUT_RECOVERY)/uImage
	$(hide) cp -f $(recovery_ramdisk) $(TARGET_OUT_RECOVERY)/ramdisk-recovery.img
	$(hide) $(MAKE_EXT4FS) \
		-l $(BOARD_RECOVERYIMAGE_PARTITION_SIZE) \
		-a boot \
		-s \
		$@ $(TARGET_OUT_RECOVERY)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE))
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
