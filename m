From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the i2c tree
Date: Fri, 15 Jul 2016 12:17:23 +1000
Message-ID: <20160715121723.0f21f148@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56269 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751444AbcGOCR1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Jul 2016 22:17:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  drivers/i2c/i2c-core.c

between commit:

  a7003b65801e ("i2c: core: Cleanup I2C ACPI namespace")
  55d38d060e99 ("i2c: core: Add function for finding the bus speed from ACPI")

from the i2c tree and commit:

  525e6fabeae2 ("i2c / ACPI: add support for ACPI reconfigure notifications")

from the pm tree.

I fixed it up (I think, but it needs more work - see below) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/i2c/i2c-core.c
index 77ce28f2dd4c,74e5aeaf84f9..000000000000
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@@ -103,20 -101,17 +103,19 @@@ struct gsb_buffer 
  	};
  } __packed;
  
 -struct acpi_i2c_lookup {
 +struct i2c_acpi_lookup {
  	struct i2c_board_info *info;
 +	struct i2c_adapter *adapter; /* set only when registering slaves */
  	acpi_handle adapter_handle;
  	acpi_handle device_handle;
 +	u32 min_speed;
  };
  
 -static int acpi_i2c_fill_info(struct acpi_resource *ares, void *data)
 +static int i2c_acpi_find_resource(struct acpi_resource *ares, void *data)
  {
 -	struct acpi_i2c_lookup *lookup = data;
 +	struct i2c_acpi_lookup *lookup = data;
  	struct i2c_board_info *info = lookup->info;
  	struct acpi_resource_i2c_serialbus *sb;
- 	acpi_handle adapter_handle;
  	acpi_status status;
  
  	if (info->addr || ares->type != ACPI_RESOURCE_TYPE_SERIAL_BUS)
@@@ -126,97 -121,110 +125,181 @@@
  	if (sb->type != ACPI_RESOURCE_SERIAL_TYPE_I2C)
  		return 1;
  
- 	/*
- 	 * Extract the ResourceSource and make sure that the handle matches
- 	 * with the I2C adapter handle.
- 	 */
  	status = acpi_get_handle(lookup->device_handle,
  				 sb->resource_source.string_ptr,
- 				 &adapter_handle);
- 	if (ACPI_SUCCESS(status) && adapter_handle == lookup->adapter_handle) {
- 		info->addr = sb->slave_address;
- 		if (sb->access_mode == ACPI_I2C_10BIT_MODE)
- 			info->flags |= I2C_CLIENT_TEN;
- 		/* Save speed of the slowest device */
- 		if (sb->connection_speed < lookup->min_speed)
- 			lookup->min_speed = sb->connection_speed;
- 	}
+ 				 &lookup->adapter_handle);
+ 	if (!ACPI_SUCCESS(status))
+ 		return 1;
+ 
+ 	info->addr = sb->slave_address;
+ 	if (sb->access_mode == ACPI_I2C_10BIT_MODE)
+ 		info->flags |= I2C_CLIENT_TEN;
++	/* Save speed of the slowest device */
++	if (sb->connection_speed < lookup->min_speed)
++		lookup->min_speed = sb->connection_speed;
  
  	return 1;
  }
  
 -static int acpi_i2c_get_info(struct acpi_device *adev,
 +static acpi_status i2c_acpi_slave_lookup(acpi_handle handle, u32 level,
 +					 void *data, void **return_value)
 +{
 +	struct i2c_acpi_lookup *lookup = data;
 +	struct i2c_adapter *adapter = lookup->adapter;
 +	struct list_head resource_list;
 +	struct resource_entry *entry;
 +	struct i2c_board_info info;
 +	struct acpi_device *adev;
 +	int ret;
 +
 +	if (acpi_bus_get_device(handle, &adev))
 +		return AE_OK;
 +	if (acpi_bus_get_status(adev) || !adev->status.present)
 +		return AE_OK;
 +
 +	memset(&info, 0, sizeof(info));
 +	info.fwnode = acpi_fwnode_handle(adev);
 +
 +	lookup->device_handle = handle;
 +	lookup->info = &info;
 +
 +	/*
 +	 * Look up for I2cSerialBus resource with ResourceSource that
 +	 * matches with this adapter.
 +	 */
 +	INIT_LIST_HEAD(&resource_list);
 +	ret = acpi_dev_get_resources(adev, &resource_list,
 +				     i2c_acpi_find_resource, lookup);
 +	acpi_dev_free_resource_list(&resource_list);
 +
 +	if (ret < 0 || !info.addr || !lookup->adapter)
 +		return AE_OK;
 +
 +	/* Then fill IRQ number if any */
 +	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
 +	if (ret < 0)
 +		return AE_OK;
 +
 +	resource_list_for_each_entry(entry, &resource_list) {
 +		if (resource_type(entry->res) == IORESOURCE_IRQ) {
 +			info.irq = entry->res->start;
 +			break;
 +		}
 +	}
 +
 +	acpi_dev_free_resource_list(&resource_list);
 +
 +	adev->power.flags.ignore_parent = true;
 +	strlcpy(info.type, dev_name(&adev->dev), sizeof(info.type));
 +	if (!i2c_new_device(adapter, &info)) {
 +		adev->power.flags.ignore_parent = false;
 +		dev_err(&adapter->dev,
 +			"failed to add I2C device %s from ACPI\n",
 +			dev_name(&adev->dev));
 +	}
 +
 +	return AE_OK;
 +}
 +
++static int i2c_acpi_get_info(struct acpi_device *adev,
+ 			     struct i2c_board_info *info,
+ 			     acpi_handle *adapter_handle)
+ {
+ 	struct list_head resource_list;
+ 	struct resource_entry *entry;
 -	struct acpi_i2c_lookup lookup;
++	struct i2c_acpi_lookup lookup;
+ 	int ret;
+ 
+ 	if (acpi_bus_get_status(adev) || !adev->status.present ||
+ 	    acpi_device_enumerated(adev))
+ 		return -EINVAL;
+ 
+ 	memset(info, 0, sizeof(*info));
+ 	info->fwnode = acpi_fwnode_handle(adev);
+ 
+ 	memset(&lookup, 0, sizeof(lookup));
+ 	lookup.device_handle = acpi_device_handle(adev);
+ 	lookup.info = info;
+ 
+ 	/* Look up for I2cSerialBus resource */
+ 	INIT_LIST_HEAD(&resource_list);
+ 	ret = acpi_dev_get_resources(adev, &resource_list,
 -				     acpi_i2c_fill_info, &lookup);
++				     i2c_acpi_find_resource, &lookup);
+ 	acpi_dev_free_resource_list(&resource_list);
+ 
+ 	if (ret < 0 || !info->addr)
+ 		return -EINVAL;
+ 
+ 	*adapter_handle = lookup.adapter_handle;
+ 
+ 	/* Then fill IRQ number if any */
+ 	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
+ 	if (ret < 0)
+ 		return -EINVAL;
+ 
+ 	resource_list_for_each_entry(entry, &resource_list) {
+ 		if (resource_type(entry->res) == IORESOURCE_IRQ) {
+ 			info->irq = entry->res->start;
+ 			break;
+ 		}
+ 	}
+ 
+ 	acpi_dev_free_resource_list(&resource_list);
+ 
+ 	strlcpy(info->type, dev_name(&adev->dev), sizeof(info->type));
+ 
+ 	return 0;
+ }
+ 
 -static void acpi_i2c_register_device(struct i2c_adapter *adapter,
++static void i2c_acpi_register_device(struct i2c_adapter *adapter,
+ 				     struct acpi_device *adev,
+ 				     struct i2c_board_info *info)
+ {
+ 	adev->power.flags.ignore_parent = true;
+ 	acpi_device_set_enumerated(adev);
+ 
+ 	if (!i2c_new_device(adapter, info)) {
+ 		adev->power.flags.ignore_parent = false;
+ 		dev_err(&adapter->dev,
+ 			"failed to add I2C device %s from ACPI\n",
+ 			dev_name(&adev->dev));
+ 	}
+ }
+ 
 -static acpi_status acpi_i2c_add_device(acpi_handle handle, u32 level,
++static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 level,
+ 				       void *data, void **return_value)
+ {
+ 	struct i2c_adapter *adapter = data;
+ 	struct acpi_device *adev;
+ 	acpi_handle adapter_handle;
+ 	struct i2c_board_info info;
+ 
+ 	if (acpi_bus_get_device(handle, &adev))
+ 		return AE_OK;
+ 
 -	if (acpi_i2c_get_info(adev, &info, &adapter_handle))
++	if (i2c_acpi_get_info(adev, &info, &adapter_handle))
+ 		return AE_OK;
+ 
+ 	if (adapter_handle != ACPI_HANDLE(&adapter->dev))
+ 		return AE_OK;
+ 
 -	acpi_i2c_register_device(adapter, adev, &info);
++	i2c_acpi_register_device(adapter, adev, &info);
+ 
+ 	return AE_OK;
+ }
+ 
 -#define ACPI_I2C_MAX_SCAN_DEPTH 32
 +#define I2C_ACPI_MAX_SCAN_DEPTH 32
 +
 +static acpi_status i2c_acpi_walk(struct i2c_acpi_lookup *lookup)
 +{
 +	return acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
 +				   I2C_ACPI_MAX_SCAN_DEPTH,
 +				   i2c_acpi_slave_lookup, NULL,
 +				   lookup, NULL);
 +}
  
  /**
 - * acpi_i2c_register_devices - enumerate I2C slave devices behind adapter
 + * i2c_acpi_register_devices - enumerate I2C slave devices behind adapter
   * @adap: pointer to adapter
   *
   * Enumerate all I2C slave devices behind this adapter by walking the ACPI
@@@ -240,39 -246,80 +323,111 @@@ static void i2c_acpi_register_devices(s
  		dev_warn(&adap->dev, "failed to enumerate I2C slaves\n");
  }
  
 -static int acpi_i2c_match_adapter(struct device *dev, void *data)
 +/**
 + * i2c_acpi_find_bus_speed - find I2C bus speed from ACPI
 + * @dev: The device owning the bus
 + *
 + * Find the I2C bus speed by walking the ACPI namespace for all I2C slaves
 + * devices connected to this bus and use the speed of slowest device.
 + *
 + * Returns the speed in Hz or zero
 + */
 +u32 i2c_acpi_find_bus_speed(struct device *dev)
 +{
 +	struct i2c_acpi_lookup lookup;
 +	acpi_status status;
 +
 +	if (!has_acpi_companion(dev))
 +		return 0;
 +
 +	memset(&lookup, 0, sizeof(lookup));
 +	lookup.adapter_handle = ACPI_HANDLE(dev);
 +	lookup.min_speed = UINT_MAX;
 +
 +	status = i2c_acpi_walk(&lookup);
 +	if (ACPI_FAILURE(status)) {
 +		dev_warn(dev, "unable to find I2C bus speed from ACPI\n");
 +		return 0;
 +	}
 +
 +	return lookup.min_speed != UINT_MAX ? lookup.min_speed : 0;
 +}
 +EXPORT_SYMBOL_GPL(i2c_acpi_find_bus_speed);
 +
++static int i2c_acpi_match_adapter(struct device *dev, void *data)
+ {
+ 	struct i2c_adapter *adapter = i2c_verify_adapter(dev);
+ 
+ 	if (!adapter)
+ 		return 0;
+ 
+ 	return ACPI_HANDLE(dev) == (acpi_handle)data;
+ }
+ 
 -static int acpi_i2c_match_device(struct device *dev, void *data)
++static int i2c_acpi_match_device(struct device *dev, void *data)
+ {
+ 	return ACPI_COMPANION(dev) == data;
+ }
+ 
 -static struct i2c_adapter *acpi_i2c_find_adapter_by_handle(acpi_handle handle)
++static struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
+ {
+ 	struct device *dev;
+ 
+ 	dev = bus_find_device(&i2c_bus_type, NULL, handle,
 -			      acpi_i2c_match_adapter);
++			      i2c_acpi_match_adapter);
+ 	return dev ? i2c_verify_adapter(dev) : NULL;
+ }
+ 
 -static struct i2c_client *acpi_i2c_find_client_by_adev(struct acpi_device *adev)
++static struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
+ {
+ 	struct device *dev;
+ 
 -	dev = bus_find_device(&i2c_bus_type, NULL, adev, acpi_i2c_match_device);
++	dev = bus_find_device(&i2c_bus_type, NULL, adev, i2c_acpi_match_device);
+ 	return dev ? i2c_verify_client(dev) : NULL;
+ }
+ 
 -static int acpi_i2c_notify(struct notifier_block *nb, unsigned long value,
++static int i2c_acpi_notify(struct notifier_block *nb, unsigned long value,
+ 			   void *arg)
+ {
+ 	struct acpi_device *adev = arg;
+ 	struct i2c_board_info info;
+ 	acpi_handle adapter_handle;
+ 	struct i2c_adapter *adapter;
+ 	struct i2c_client *client;
+ 
+ 	switch (value) {
+ 	case ACPI_RECONFIG_DEVICE_ADD:
 -		if (acpi_i2c_get_info(adev, &info, &adapter_handle))
++		if (i2c_acpi_get_info(adev, &info, &adapter_handle))
+ 			break;
+ 
 -		adapter = acpi_i2c_find_adapter_by_handle(adapter_handle);
++		adapter = i2c_acpi_find_adapter_by_handle(adapter_handle);
+ 		if (!adapter)
+ 			break;
+ 
 -		acpi_i2c_register_device(adapter, adev, &info);
++		i2c_acpi_register_device(adapter, adev, &info);
+ 		break;
+ 	case ACPI_RECONFIG_DEVICE_REMOVE:
+ 		if (!acpi_device_enumerated(adev))
+ 			break;
+ 
 -		client = acpi_i2c_find_client_by_adev(adev);
++		client = i2c_acpi_find_client_by_adev(adev);
+ 		if (!client)
+ 			break;
+ 
+ 		i2c_unregister_device(client);
+ 		put_device(&client->dev);
+ 		break;
+ 	}
+ 
+ 	return NOTIFY_OK;
+ }
+ 
+ static struct notifier_block i2c_acpi_notifier = {
 -	.notifier_call = acpi_i2c_notify,
++	.notifier_call = i2c_acpi_notify,
+ };
  #else /* CONFIG_ACPI */
 -static inline void acpi_i2c_register_devices(struct i2c_adapter *adap) { }
 +static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
+ extern struct notifier_block i2c_acpi_notifier;
  #endif /* CONFIG_ACPI */
  
  #ifdef CONFIG_ACPI_I2C_OPREGION
