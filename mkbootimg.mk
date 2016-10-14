TARGET_OUT_BOOT := $(PRODUCT_OUT)/boot

$(INSTALLED_BOOTIMAGE_TARGET): $(MAKE_EXT4FS) \
		$(INTERNAL_BOOTIMAGE_FILES) \
		$(BOOTIMAGE_EXTRA_DEPS)
	$(call pretty,"Target boot ext4fs image: $@")
	$(hide) mkdir -p $(TARGET_OUT_BOOT)
	$(hide) cp -f $(INSTALLED_KERNEL_TARGET) $(TARGET_OUT_BOOT)/uImage
	$(hide) cp -f $(INSTALLED_RAMDISK_TARGET) $(TARGET_OUT_BOOT)/root.img.gz
	$(hide) $(MAKE_EXT4FS) \
		-l $(BOARD_BOOTIMAGE_PARTITION_SIZE) \
		-a boot \
		-s \
		$@ $(TARGET_OUT_BOOT)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE))
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}
