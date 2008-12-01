From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree
Date: Mon, 1 Dec 2008 11:15:52 +1100
Message-ID: <20081201111552.8b1cbf9b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40434 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752627AbYLAAQL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 30 Nov 2008 19:16:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Russell King <rmk@arm.linux.org.uk>, Kay Sievers <kay.sievers@vrfy.org>, David Woodhouse <dwmw2@infradead.org>

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/mtd/maps/integrator-flash.c between commit
ffc86cf850dcd0e181a69c6fa0217d6c7ddf9c85 ("Add armflash support for
multiple blocks of flash") from the arm tree and commit
0b1ea7e6450b3cc2e87d1c7295439483d007bb6e ("mtd: struct device - replace
bus_id with dev_name(), dev_set_name()") from the driver-core tree.

I fixed it up (see below).  Maybe you, Russell and David Woodhouse could
sort out who should coordinate these updates.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/mtd/maps/integrator-flash.c
index 5a773a3,d2ec262..0000000
--- a/drivers/mtd/maps/integrator-flash.c
+++ b/drivers/mtd/maps/integrator-flash.c
@@@ -112,112 -121,7 +112,112 @@@ static int armflash_subdev_probe(struc
  		goto no_device;
  	}
  
 -	info->mtd->owner = THIS_MODULE;
 +	subdev->mtd->owner = THIS_MODULE;
 +
 +	/* Successful? */
 +	if (err == 0)
 +		return err;
 +
 +	if (subdev->mtd)
 +		map_destroy(subdev->mtd);
 + no_device:
 +	iounmap(base);
 + no_mem:
 +	release_mem_region(res->start, size);
 + out:
 +	return err;
 +}
 +
 +static void armflash_subdev_remove(struct armflash_subdev_info *subdev)
 +{
 +	if (subdev->mtd)
 +		map_destroy(subdev->mtd);
 +	if (subdev->map.virt)
 +		iounmap(subdev->map.virt);
 +	release_mem_region(subdev->map.phys, subdev->map.size);
 +}
 +
 +static int armflash_probe(struct platform_device *dev)
 +{
 +	struct flash_platform_data *plat = dev->dev.platform_data;
 +	unsigned int size;
 +	struct armflash_info *info;
 +	int i, nr, err;
 +
 +	/* Count the number of devices */
 +	for (nr = 0; ; nr++)
 +		if (!platform_get_resource(dev, IORESOURCE_MEM, nr))
 +			break;
 +	if (nr == 0) {
 +		err = -ENODEV;
 +		goto out;
 +	}
 +
 +	size = sizeof(struct armflash_info) +
 +		sizeof(struct armflash_subdev_info) * nr;
 +	info = kzalloc(size, GFP_KERNEL);
 +	if (!info) {
 +		err = -ENOMEM;
 +		goto out;
 +	}
 +
 +	if (plat && plat->init) {
 +		err = plat->init();
 +		if (err)
 +			goto no_resource;
 +	}
 +
 +	for (i = 0; i < nr; i++) {
 +		struct armflash_subdev_info *subdev = &info->subdev[i];
 +		struct resource *res;
 +
 +		res = platform_get_resource(dev, IORESOURCE_MEM, i);
 +		if (!res)
 +			break;
 +
 +		if (nr == 1)
 +			/* No MTD concatenation, just use the default name */
 +			snprintf(subdev->name, SUBDEV_NAME_SIZE, "%s",
- 				 dev->dev.bus_id);
++				 dev_name(&dev->dev));
 +		else
 +			snprintf(subdev->name, SUBDEV_NAME_SIZE, "%s-%d",
- 				 dev->dev.bus_id, i);
++				 dev_name(&dev->dev), i);
 +		subdev->plat = plat;
 +
 +		err = armflash_subdev_probe(subdev, res);
 +		if (err)
 +			break;
 +	}
 +	info->nr_subdev = i;
 +
 +	if (err)
 +		goto subdev_err;
 +
 +	if (info->nr_subdev == 1)
 +		info->mtd = info->subdev[0].mtd;
 +	else if (info->nr_subdev > 1) {
 +#ifdef CONFIG_MTD_CONCAT
 +		struct mtd_info *cdev[info->nr_subdev];
 +
 +		/*
 +		 * We detected multiple devices.  Concatenate them together.
 +		 */
 +		for (i = 0; i < info->nr_subdev; i++)
 +			cdev[i] = info->subdev[i].mtd;
 +
 +		info->mtd = mtd_concat_create(cdev, info->nr_subdev,
- 					      dev->dev.bus_id);
++					      dev_name(&dev->dev));
 +		if (info->mtd == NULL)
 +			err = -ENXIO;
 +#else
 +		printk(KERN_ERR "armflash: multiple devices found but "
 +		       "MTD concat support disabled.\n");
 +		err = -ENXIO;
 +#endif
 +	}
 +
 +	if (err < 0)
 +		goto cleanup;
  
  	err = parse_mtd_partitions(info->mtd, probes, &info->parts, 0);
  	if (err > 0) {
