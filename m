From: Michal Nazarewicz <m.nazarewicz@samsung.com>
Subject: [PATCH] usb gadget: don't save bind callback in struct
 usb_composite_driver
Date: Thu, 02 Sep 2010 07:33:08 +0200
Message-ID: <fd8a8c411073c30df87c273da283c9b7eebfe872.1283403154.git.mina86@mina86.com>
References: <20100902135450.59d6b96a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:30008 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750739Ab0IBFd4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Sep 2010 01:33:56 -0400
In-reply-to: <20100902135450.59d6b96a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rotwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Michal Nazarewicz <m.nazarewicz@samsung.com>

The bind function is most of the time only called at init time so there
is no need to save a pointer to it in the composite driver structure.

This fixes many section mismatches reported by modpost.

Signed-off-by: Micha=C5=82 Nazarewicz <m.nazarewicz@samsung.com>
Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
---
 drivers/usb/gadget/audio.c        |    3 +--
 drivers/usb/gadget/cdc2.c         |    3 +--
 drivers/usb/gadget/composite.c    |   15 +++++++++++----
 drivers/usb/gadget/ether.c        |    3 +--
 drivers/usb/gadget/g_ffs.c        |    3 +--
 drivers/usb/gadget/hid.c          |    3 +--
 drivers/usb/gadget/mass_storage.c |    3 +--
 drivers/usb/gadget/multi.c        |    3 +--
 drivers/usb/gadget/nokia.c        |    3 +--
 drivers/usb/gadget/serial.c       |    3 +--
 drivers/usb/gadget/webcam.c       |    3 +--
 drivers/usb/gadget/zero.c         |    3 +--
 include/linux/usb/composite.h     |   19 +++++--------------
 13 files changed, 27 insertions(+), 40 deletions(-)

On Thu, 02 Sep 2010 05:54:50 +0200, Stephen Rothwell wrote:
> After merging the usb tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/usb/gadget/nokia.c:244: error: unknown field 'bind' specified=
 in initializer
> drivers/usb/gadget/nokia.c:244: warning: initialization makes integer=
 from pointer without a cast
> drivers/usb/gadget/nokia.c:244: error: initializer element is not com=
putable at load time
> drivers/usb/gadget/nokia.c:244: error: (near initialization for 'noki=
a_driver.needs_serial')
> drivers/usb/gadget/nokia.c: In function 'nokia_init':
> drivers/usb/gadget/nokia.c:250: error: implicit declaration of functi=
on 'usb_composite_register'
>
> Caused by commit cc604fa9db859b7d6899de807d6bd8df80fc0a1a ("usb gadge=
t:
> don't save bind callback in struct usb_configuration").  The 'bind' a=
nd
> 'usb_composite_register' references above were added before 2.6.34-rc=
1
> but missed in this patch.

Sorry about that.  Nokia composite gadget requires Phonet and that's
why I failed to catch this error.  (Truly, grep would probably work
better).

Attached is an updated patch that takes nokia.c into consideration as
well. Greg, please replace the non-working version of the patch in
your tree with this one.

diff --git a/drivers/usb/gadget/audio.c b/drivers/usb/gadget/audio.c
index a62af7b..5a65fbb 100644
--- a/drivers/usb/gadget/audio.c
+++ b/drivers/usb/gadget/audio.c
@@ -166,13 +166,12 @@ static struct usb_composite_driver audio_driver =3D=
 {
 	.name		=3D "g_audio",
 	.dev		=3D &device_desc,
 	.strings	=3D audio_strings,
-	.bind		=3D audio_bind,
 	.unbind		=3D __exit_p(audio_unbind),
 };
=20
 static int __init init(void)
 {
-	return usb_composite_register(&audio_driver);
+	return usb_composite_probe(&audio_driver, audio_bind);
 }
 module_init(init);
=20
diff --git a/drivers/usb/gadget/cdc2.c b/drivers/usb/gadget/cdc2.c
index 928137d..1f2a9b1 100644
--- a/drivers/usb/gadget/cdc2.c
+++ b/drivers/usb/gadget/cdc2.c
@@ -245,7 +245,6 @@ static struct usb_composite_driver cdc_driver =3D {
 	.name		=3D "g_cdc",
 	.dev		=3D &device_desc,
 	.strings	=3D dev_strings,
-	.bind		=3D cdc_bind,
 	.unbind		=3D __exit_p(cdc_unbind),
 };
=20
@@ -255,7 +254,7 @@ MODULE_LICENSE("GPL");
=20
 static int __init init(void)
 {
-	return usb_composite_register(&cdc_driver);
+	return usb_composite_probe(&cdc_driver, cdc_bind);
 }
 module_init(init);
=20
diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/compos=
ite.c
index 717de39..3c84002 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -40,6 +40,7 @@
 #define USB_BUFSIZ	1024
=20
 static struct usb_composite_driver *composite;
+static int (*composite_gadget_bind)(struct usb_composite_dev *cdev);
=20
 /* Some systems will need runtime overrides for the  product identifer=
s
  * published in the device descriptor, either numbers or strings or bo=
th.
@@ -1115,7 +1116,7 @@ static int composite_bind(struct usb_gadget *gadg=
et)
 	 * serial number), register function drivers, potentially update
 	 * power state and consumption, etc
 	 */
-	status =3D composite->bind(cdev);
+	status =3D composite_gadget_bind(cdev);
 	if (status < 0)
 		goto fail;
=20
@@ -1228,8 +1229,12 @@ static struct usb_gadget_driver composite_driver=
 =3D {
 };
=20
 /**
- * usb_composite_register() - register a composite driver
+ * usb_composite_probe() - register a composite driver
  * @driver: the driver to register
+ * @bind: the callback used to allocate resources that are shared acro=
ss the
+ *	whole device, such as string IDs, and add its configurations using
+ *	@usb_add_config().  This may fail by returning a negative errno
+ *	value; it should return zero on successful initialization.
  * Context: single threaded during gadget setup
  *
  * This function is used to register drivers using the composite drive=
r
@@ -1242,9 +1247,10 @@ static struct usb_gadget_driver composite_driver=
 =3D {
  * while it was binding.  That would usually be done in order to wait =
for
  * some userspace participation.
  */
-int usb_composite_register(struct usb_composite_driver *driver)
+extern int usb_composite_probe(struct usb_composite_driver *driver,
+			       int (*bind)(struct usb_composite_dev *cdev))
 {
-	if (!driver || !driver->dev || !driver->bind || composite)
+	if (!driver || !driver->dev || !bind || composite)
 		return -EINVAL;
=20
 	if (!driver->iProduct)
@@ -1254,6 +1260,7 @@ int usb_composite_register(struct usb_composite_d=
river *driver)
 	composite_driver.function =3D  (char *) driver->name;
 	composite_driver.driver.name =3D driver->name;
 	composite =3D driver;
+	composite_gadget_bind =3D bind;
=20
 	return usb_gadget_register_driver(&composite_driver);
 }
diff --git a/drivers/usb/gadget/ether.c b/drivers/usb/gadget/ether.c
index 400f803..33076bc 100644
--- a/drivers/usb/gadget/ether.c
+++ b/drivers/usb/gadget/ether.c
@@ -402,7 +402,6 @@ static struct usb_composite_driver eth_driver =3D {
 	.name		=3D "g_ether",
 	.dev		=3D &device_desc,
 	.strings	=3D dev_strings,
-	.bind		=3D eth_bind,
 	.unbind		=3D __exit_p(eth_unbind),
 };
=20
@@ -412,7 +411,7 @@ MODULE_LICENSE("GPL");
=20
 static int __init init(void)
 {
-	return usb_composite_register(&eth_driver);
+	return usb_composite_probe(&eth_driver, eth_bind);
 }
 module_init(init);
=20
diff --git a/drivers/usb/gadget/g_ffs.c b/drivers/usb/gadget/g_ffs.c
index 52fd3fa..9fcb158 100644
--- a/drivers/usb/gadget/g_ffs.c
+++ b/drivers/usb/gadget/g_ffs.c
@@ -147,7 +147,6 @@ static struct usb_composite_driver gfs_driver =3D {
 	.name		=3D DRIVER_NAME,
 	.dev		=3D &gfs_dev_desc,
 	.strings	=3D gfs_dev_strings,
-	.bind		=3D gfs_bind,
 	.unbind		=3D gfs_unbind,
 	.iProduct	=3D DRIVER_DESC,
 };
@@ -187,7 +186,7 @@ static int functionfs_ready_callback(struct ffs_dat=
a *ffs)
 		return -EBUSY;
=20
 	gfs_ffs_data =3D ffs;
-	ret =3D usb_composite_register(&gfs_driver);
+	ret =3D usb_composite_probe(&gfs_driver, gfs_bind);
 	if (unlikely(ret < 0))
 		clear_bit(0, &gfs_registered);
 	return ret;
diff --git a/drivers/usb/gadget/hid.c b/drivers/usb/gadget/hid.c
index 7757226..77f4952 100644
--- a/drivers/usb/gadget/hid.c
+++ b/drivers/usb/gadget/hid.c
@@ -256,7 +256,6 @@ static struct usb_composite_driver hidg_driver =3D =
{
 	.name		=3D "g_hid",
 	.dev		=3D &device_desc,
 	.strings	=3D dev_strings,
-	.bind		=3D hid_bind,
 	.unbind		=3D __exit_p(hid_unbind),
 };
=20
@@ -282,7 +281,7 @@ static int __init hidg_init(void)
 	if (status < 0)
 		return status;
=20
-	status =3D usb_composite_register(&hidg_driver);
+	status =3D usb_composite_probe(&hidg_driver, hid_bind);
 	if (status < 0)
 		platform_driver_unregister(&hidg_plat_driver);
=20
diff --git a/drivers/usb/gadget/mass_storage.c b/drivers/usb/gadget/mas=
s_storage.c
index 05e9bd3..a5e4a77 100644
--- a/drivers/usb/gadget/mass_storage.c
+++ b/drivers/usb/gadget/mass_storage.c
@@ -169,7 +169,6 @@ static int __init msg_bind(struct usb_composite_dev=
 *cdev)
 static struct usb_composite_driver msg_driver =3D {
 	.name		=3D "g_mass_storage",
 	.dev		=3D &msg_device_desc,
-	.bind		=3D msg_bind,
 	.iProduct	=3D DRIVER_DESC,
 	.needs_serial	=3D 1,
 };
@@ -180,7 +179,7 @@ MODULE_LICENSE("GPL");
=20
 static int __init msg_init(void)
 {
-	return usb_composite_register(&msg_driver);
+	return usb_composite_probe(&msg_driver, msg_bind);
 }
 module_init(msg_init);
=20
diff --git a/drivers/usb/gadget/multi.c b/drivers/usb/gadget/multi.c
index ca51661..91170a0 100644
--- a/drivers/usb/gadget/multi.c
+++ b/drivers/usb/gadget/multi.c
@@ -353,7 +353,6 @@ static struct usb_composite_driver multi_driver =3D=
 {
 	.name		=3D "g_multi",
 	.dev		=3D &device_desc,
 	.strings	=3D dev_strings,
-	.bind		=3D multi_bind,
 	.unbind		=3D __exit_p(multi_unbind),
 	.iProduct	=3D DRIVER_DESC,
 	.needs_serial	=3D 1,
@@ -362,7 +361,7 @@ static struct usb_composite_driver multi_driver =3D=
 {
=20
 static int __init multi_init(void)
 {
-	return usb_composite_register(&multi_driver);
+	return usb_composite_probe(&multi_driver, multi_bind);
 }
 module_init(multi_init);
=20
diff --git a/drivers/usb/gadget/nokia.c b/drivers/usb/gadget/nokia.c
index 7d6b66a..8aec728 100644
--- a/drivers/usb/gadget/nokia.c
+++ b/drivers/usb/gadget/nokia.c
@@ -241,13 +241,12 @@ static struct usb_composite_driver nokia_driver =3D=
 {
 	.name		=3D "g_nokia",
 	.dev		=3D &device_desc,
 	.strings	=3D dev_strings,
-	.bind		=3D nokia_bind,
 	.unbind		=3D __exit_p(nokia_unbind),
 };
=20
 static int __init nokia_init(void)
 {
-	return usb_composite_register(&nokia_driver);
+	return usb_composite_probe(&nokia_driver, nokia_bind);
 }
 module_init(nokia_init);
=20
diff --git a/drivers/usb/gadget/serial.c b/drivers/usb/gadget/serial.c
index f46a609..0b81d7b 100644
--- a/drivers/usb/gadget/serial.c
+++ b/drivers/usb/gadget/serial.c
@@ -242,7 +242,6 @@ static struct usb_composite_driver gserial_driver =3D=
 {
 	.name		=3D "g_serial",
 	.dev		=3D &device_desc,
 	.strings	=3D dev_strings,
-	.bind		=3D gs_bind,
 };
=20
 static int __init init(void)
@@ -271,7 +270,7 @@ static int __init init(void)
 	}
 	strings_dev[STRING_DESCRIPTION_IDX].s =3D serial_config_driver.label;
=20
-	return usb_composite_register(&gserial_driver);
+	return usb_composite_probe(&gserial_driver, gs_bind);
 }
 module_init(init);
=20
diff --git a/drivers/usb/gadget/webcam.c b/drivers/usb/gadget/webcam.c
index 288d211..de65b80 100644
--- a/drivers/usb/gadget/webcam.c
+++ b/drivers/usb/gadget/webcam.c
@@ -373,14 +373,13 @@ static struct usb_composite_driver webcam_driver =
=3D {
 	.name		=3D "g_webcam",
 	.dev		=3D &webcam_device_descriptor,
 	.strings	=3D webcam_device_strings,
-	.bind		=3D webcam_bind,
 	.unbind		=3D webcam_unbind,
 };
=20
 static int __init
 webcam_init(void)
 {
-	return usb_composite_register(&webcam_driver);
+	return usb_composite_probe(&webcam_driver, webcam_bind);
 }
=20
 static void __exit
diff --git a/drivers/usb/gadget/zero.c b/drivers/usb/gadget/zero.c
index 807280d..6d16db9 100644
--- a/drivers/usb/gadget/zero.c
+++ b/drivers/usb/gadget/zero.c
@@ -340,7 +340,6 @@ static struct usb_composite_driver zero_driver =3D =
{
 	.name		=3D "zero",
 	.dev		=3D &device_desc,
 	.strings	=3D dev_strings,
-	.bind		=3D zero_bind,
 	.unbind		=3D zero_unbind,
 	.suspend	=3D zero_suspend,
 	.resume		=3D zero_resume,
@@ -351,7 +350,7 @@ MODULE_LICENSE("GPL");
=20
 static int __init init(void)
 {
-	return usb_composite_register(&zero_driver);
+	return usb_composite_probe(&zero_driver, zero_bind);
 }
 module_init(init);
=20
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composit=
e.h
index a78e813..e28b662 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -248,11 +248,7 @@ int usb_add_config(struct usb_composite_dev *,
  *	and language IDs provided in control requests
  * @needs_serial: set to 1 if the gadget needs userspace to provide
  * 	a serial number.  If one is not provided, warning will be printed.
- * @bind: (REQUIRED) Used to allocate resources that are shared across=
 the
- *	whole device, such as string IDs, and add its configurations using
- *	@usb_add_config().  This may fail by returning a negative errno
- *	value; it should return zero on successful initialization.
- * @unbind: Reverses @bind(); called as a side effect of unregistering
+ * @unbind: Reverses bind; called as a side effect of unregistering
  *	this driver.
  * @disconnect: optional driver disconnect method
  * @suspend: Notifies when the host stops sending USB traffic,
@@ -263,7 +259,7 @@ int usb_add_config(struct usb_composite_dev *,
  * Devices default to reporting self powered operation.  Devices which=
 rely
  * on bus powered operation should report this in their @bind() method=
=2E
  *
- * Before returning from @bind, various fields in the template descrip=
tor
+ * Before returning from bind, various fields in the template descript=
or
  * may be overridden.  These include the idVendor/idProduct/bcdDevice =
values
  * normally to bind the appropriate host side driver, and the three st=
rings
  * (iManufacturer, iProduct, iSerialNumber) normally used to provide u=
ser
@@ -279,12 +275,6 @@ struct usb_composite_driver {
 	struct usb_gadget_strings		**strings;
 	unsigned		needs_serial:1;
=20
-	/* REVISIT:  bind() functions can be marked __init, which
-	 * makes trouble for section mismatch analysis.  See if
-	 * we can't restructure things to avoid mismatching...
-	 */
-
-	int			(*bind)(struct usb_composite_dev *);
 	int			(*unbind)(struct usb_composite_dev *);
=20
 	void			(*disconnect)(struct usb_composite_dev *);
@@ -294,8 +284,9 @@ struct usb_composite_driver {
 	void			(*resume)(struct usb_composite_dev *);
 };
=20
-extern int usb_composite_register(struct usb_composite_driver *);
-extern void usb_composite_unregister(struct usb_composite_driver *);
+extern int usb_composite_probe(struct usb_composite_driver *driver,
+			       int (*bind)(struct usb_composite_dev *cdev));
+extern void usb_composite_unregister(struct usb_composite_driver *driv=
er);
=20
=20
 /**
--=20
1.7.1
