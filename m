From: Cornelia Huck <cornelia.huck@de.ibm.com>
Subject: [PATCH] s390: bus_id -> dev_set_name() changes
Date: Mon, 23 Jun 2008 17:23:29 +0200
Message-ID: <20080623172329.13e24d0a@gondolin.boeblingen.de.ibm.com>
References: <20080620135257.102f024c.sfr@canb.auug.org.au>
	<20080620095843.271c20e8@gondolin.boeblingen.de.ibm.com>
	<20080623172226.08baece9@gondolin.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate7.de.ibm.com ([195.212.29.156]:9366 "EHLO
	mtagate7.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756598AbYFWPZI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Jun 2008 11:25:08 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate7.de.ibm.com (8.13.8/8.13.8) with ESMTP id m5NFNUra640704
	for <linux-next@vger.kernel.org>; Mon, 23 Jun 2008 15:23:30 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com [9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m5NFNUCf3149920
	for <linux-next@vger.kernel.org>; Mon, 23 Jun 2008 17:23:30 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m5NFNTBL032473
	for <linux-next@vger.kernel.org>; Mon, 23 Jun 2008 17:23:30 +0200
In-Reply-To: <20080623172226.08baece9@gondolin.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

From: Cornelia Huck <cornelia.huck@de.ibm.com>

Convert most s390 users setting bus_id to dev_set_name().
css and ccw busses are deferred since they need some special
treatment.

Signed-off-by: Cornelia Huck <cornelia.huck@de.ibm.com>

---
 drivers/s390/block/dcssblk.c |    2 +-
 drivers/s390/char/vmlogrdr.c |    3 +--
 drivers/s390/cio/ccwgroup.c  |    3 +--
 drivers/s390/cio/chp.c       |    3 +--
 drivers/s390/cio/css.c       |    4 ++--
 drivers/s390/crypto/ap_bus.c |    4 ++--
 drivers/s390/net/netiucv.c   |    2 +-
 drivers/s390/s390_rdev.c     |    2 +-
 drivers/s390/scsi/zfcp_aux.c |   23 ++++++++---------------
 9 files changed, 18 insertions(+), 28 deletions(-)

Index: linux-2.6/drivers/s390/block/dcssblk.c
===================================================================
--- linux-2.6.orig/drivers/s390/block/dcssblk.c
+++ linux-2.6/drivers/s390/block/dcssblk.c
@@ -349,7 +349,7 @@ dcssblk_add_store(struct device *dev, st
 	}
 
 	strcpy(dev_info->segment_name, local_buf);
-	strlcpy(dev_info->dev.bus_id, local_buf, BUS_ID_SIZE);
+	dev_set_name(&dev_info->dev, local_buf);
 	dev_info->dev.release = dcssblk_release_segment;
 	INIT_LIST_HEAD(&dev_info->lh);
 
Index: linux-2.6/drivers/s390/char/vmlogrdr.c
===================================================================
--- linux-2.6.orig/drivers/s390/char/vmlogrdr.c
+++ linux-2.6/drivers/s390/char/vmlogrdr.c
@@ -738,8 +738,7 @@ static int vmlogrdr_register_device(stru
 
 	dev = kzalloc(sizeof(struct device), GFP_KERNEL);
 	if (dev) {
-		snprintf(dev->bus_id, BUS_ID_SIZE, "%s",
-			 priv->internal_name);
+		dev_set_name(dev, priv->internal_name);
 		dev->bus = &iucv_bus;
 		dev->parent = iucv_root;
 		dev->driver = &vmlogrdr_driver;
Index: linux-2.6/drivers/s390/cio/ccwgroup.c
===================================================================
--- linux-2.6.orig/drivers/s390/cio/ccwgroup.c
+++ linux-2.6/drivers/s390/cio/ccwgroup.c
@@ -264,8 +264,7 @@ int ccwgroup_create_from_string(struct d
 	gdev->dev.parent = root;
 	gdev->dev.release = ccwgroup_release;
 
-	snprintf (gdev->dev.bus_id, BUS_ID_SIZE, "%s",
-			dev_name(&gdev->cdev[0]->dev));
+	dev_set_name(&gdev->dev, "%s", dev_name(&gdev->cdev[0]->dev));
 
 	rc = device_register(&gdev->dev);
 	if (rc)
Index: linux-2.6/drivers/s390/cio/chp.c
===================================================================
--- linux-2.6.orig/drivers/s390/cio/chp.c
+++ linux-2.6/drivers/s390/cio/chp.c
@@ -401,8 +401,7 @@ int chp_new(struct chp_id chpid)
 	chp->state = 1;
 	chp->dev.parent = &channel_subsystems[chpid.cssid]->device;
 	chp->dev.release = chp_release;
-	snprintf(chp->dev.bus_id, BUS_ID_SIZE, "chp%x.%02x", chpid.cssid,
-		 chpid.id);
+	dev_set_name(&chp->dev, "chp%x.%02x", chpid.cssid, chpid.id);
 
 	/* Obtain channel path description and fill it in. */
 	ret = chsc_determine_channel_path_description(chpid, &chp->desc);
Index: linux-2.6/drivers/s390/cio/css.c
===================================================================
--- linux-2.6.orig/drivers/s390/cio/css.c
+++ linux-2.6/drivers/s390/cio/css.c
@@ -741,7 +741,7 @@ static int __init setup_css(int nr)
 		return -ENOMEM;
 	css->pseudo_subchannel->dev.parent = &css->device;
 	css->pseudo_subchannel->dev.release = css_subchannel_release;
-	sprintf(css->pseudo_subchannel->dev.bus_id, "defunct");
+	dev_set_name(&css->pseudo_subchannel->dev, "defunct");
 	ret = cio_create_sch_lock(css->pseudo_subchannel);
 	if (ret) {
 		kfree(css->pseudo_subchannel);
@@ -750,7 +750,7 @@ static int __init setup_css(int nr)
 	mutex_init(&css->mutex);
 	css->valid = 1;
 	css->cssid = nr;
-	sprintf(css->device.bus_id, "css%x", nr);
+	dev_set_name(&css->device, "css%x", nr);
 	css->device.release = channel_subsystem_release;
 	tod_high = (u32) (get_clock() >> 32);
 	css_generate_pgid(css, tod_high);
Index: linux-2.6/drivers/s390/crypto/ap_bus.c
===================================================================
--- linux-2.6.orig/drivers/s390/crypto/ap_bus.c
+++ linux-2.6/drivers/s390/crypto/ap_bus.c
@@ -859,8 +859,8 @@ static void ap_scan_bus(struct work_stru
 
 		ap_dev->device.bus = &ap_bus_type;
 		ap_dev->device.parent = ap_root_device;
-		snprintf(ap_dev->device.bus_id, BUS_ID_SIZE, "card%02x",
-			 AP_QID_DEVICE(ap_dev->qid));
+		dev_set_name(&ap_dev->device, "card%02x",
+			     AP_QID_DEVICE(ap_dev->qid));
 		ap_dev->device.release = ap_device_release;
 		rc = device_register(&ap_dev->device);
 		if (rc) {
Index: linux-2.6/drivers/s390/net/netiucv.c
===================================================================
--- linux-2.6.orig/drivers/s390/net/netiucv.c
+++ linux-2.6/drivers/s390/net/netiucv.c
@@ -1757,7 +1757,7 @@ static int netiucv_register_device(struc
 	IUCV_DBF_TEXT(trace, 3, __func__);
 
 	if (dev) {
-		snprintf(dev->bus_id, BUS_ID_SIZE, "net%s", ndev->name);
+		dev_set_name(dev, "net%s", ndev->name);
 		dev->bus = &iucv_bus;
 		dev->parent = iucv_root;
 		/*
Index: linux-2.6/drivers/s390/s390_rdev.c
===================================================================
--- linux-2.6.orig/drivers/s390/s390_rdev.c
+++ linux-2.6/drivers/s390/s390_rdev.c
@@ -30,7 +30,7 @@ s390_root_dev_register(const char *name)
 	dev = kzalloc(sizeof(struct device), GFP_KERNEL);
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
-	strncpy(dev->bus_id, name, min(strlen(name), (size_t)BUS_ID_SIZE));
+	dev_set_name(dev, name);
 	dev->release = s390_root_dev_release;
 	ret = device_register(dev);
 	if (ret) {
Index: linux-2.6/drivers/s390/scsi/zfcp_aux.c
===================================================================
--- linux-2.6.orig/drivers/s390/scsi/zfcp_aux.c
+++ linux-2.6/drivers/s390/scsi/zfcp_aux.c
@@ -839,7 +839,7 @@ zfcp_unit_enqueue(struct zfcp_port *port
 	unit->fcp_lun = fcp_lun;
 
 	/* setup for sysfs registration */
-	snprintf(unit->sysfs_device.bus_id, BUS_ID_SIZE, "0x%016llx", fcp_lun);
+	dev_set_name(&unit->sysfs_device, "0x%016llx", fcp_lun);
 	unit->sysfs_device.parent = &port->sysfs_device;
 	unit->sysfs_device.release = zfcp_sysfs_unit_release;
 	dev_set_drvdata(&unit->sysfs_device, unit);
@@ -1066,8 +1066,7 @@ zfcp_adapter_enqueue(struct ccw_device *
 
 	adapter->generic_services.parent = &adapter->ccw_device->dev;
 	adapter->generic_services.release = zfcp_dummy_release;
-	snprintf(adapter->generic_services.bus_id, BUS_ID_SIZE,
-		 "generic_services");
+	dev_set_name(&adapter->generic_services, "generic_services");
 
 	if (device_register(&adapter->generic_services))
 		goto generic_services_failed;
@@ -1218,24 +1217,19 @@ zfcp_port_enqueue(struct zfcp_adapter *a
 	if (status & ZFCP_STATUS_PORT_WKA) {
 		switch (d_id) {
 		case ZFCP_DID_DIRECTORY_SERVICE:
-			snprintf(port->sysfs_device.bus_id, BUS_ID_SIZE,
-				 "directory");
+			dev_set_name(&port->sysfs_device, "directory");
 			break;
 		case ZFCP_DID_MANAGEMENT_SERVICE:
-			snprintf(port->sysfs_device.bus_id, BUS_ID_SIZE,
-				 "management");
+			dev_set_name(&port->sysfs_device, "management");
 			break;
 		case ZFCP_DID_KEY_DISTRIBUTION_SERVICE:
-			snprintf(port->sysfs_device.bus_id, BUS_ID_SIZE,
-				 "key_distribution");
+			dev_set_name(&port->sysfs_device, "key_distribution");
 			break;
 		case ZFCP_DID_ALIAS_SERVICE:
-			snprintf(port->sysfs_device.bus_id, BUS_ID_SIZE,
-				 "alias");
+			dev_set_name(&port->sysfs_device, "alias");
 			break;
 		case ZFCP_DID_TIME_SERVICE:
-			snprintf(port->sysfs_device.bus_id, BUS_ID_SIZE,
-				 "time");
+			dev_set_name(&port->sysfs_device, "time");
 			break;
 		default:
 			kfree(port);
@@ -1244,8 +1238,7 @@ zfcp_port_enqueue(struct zfcp_adapter *a
 		port->d_id = d_id;
 		port->sysfs_device.parent = &adapter->generic_services;
 	} else {
-		snprintf(port->sysfs_device.bus_id,
-			 BUS_ID_SIZE, "0x%016llx", wwpn);
+		dev_set_name(&port->sysfs_device, "0x%016llx", wwpn);
 		port->sysfs_device.parent = &adapter->ccw_device->dev;
 	}
 	port->sysfs_device.release = zfcp_sysfs_port_release;
