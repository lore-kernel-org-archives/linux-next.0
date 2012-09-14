From: David Fries <david@fries.net>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 tree related)
Date: Thu, 13 Sep 2012 23:20:24 -0500
Message-ID: <20120914042024.GA2608@spacedout.fries.net>
References: <20120913181127.862265ddb9a08758ada8405c@canb.auug.org.au>
 <20120913132408.GZ2608@spacedout.fries.net>
 <20120913233429.27668296c459915dc11222f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from SpacedOut.fries.net ([67.64.210.234]:33708 "EHLO
	SpacedOut.fries.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702Ab2INEUg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Sep 2012 00:20:36 -0400
Content-Disposition: inline
In-Reply-To: <20120913233429.27668296c459915dc11222f5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 13, 2012 at 11:34:29PM +1000, Stephen Rothwell wrote:
> Hi David,
>=20
> On Thu, 13 Sep 2012 08:24:08 -0500 David Fries <david@fries.net> wrot=
e:
> >
> > On Thu, Sep 13, 2012 at 06:11:27PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >=20
> > > After merging the final tree, today's linux-next build (sparc64 d=
efconfig)
> > > failed like this:
> > >=20
> > > drivers/built-in.o: In function `rtc_hctosys':
> > > hctosys.c:(.init.text+0x4a98): undefined reference to `rtc_hctosy=
s_ret'
> > > hctosys.c:(.init.text+0x4b54): undefined reference to `rtc_hctosy=
s_ret'
> > > hctosys.c:(.init.text+0x4b58): undefined reference to `rtc_hctosy=
s_ret'
> >=20
> > Can you post your .config?  `grep RTC .config`
> > It would seem to me that drivers/rtc/hctosys.c is being compiled
> > without drivers/rtc/class.c which now holds the global variable, bu=
t
> > Kconfig says that RTC_HCTOSYS 'depends on RTC_CLASS =3D y'.
>=20
> Did you read the bit you quoted below?

Oops, sorry, I had just got out of bed and was trying to hurry to
work.  The following version defines rtc_hctosys_ret in
CONFIG_RTC_HCTOSYS_DEVICE and CONFIG_PM is checked later.

> CONFIG_PM is not set, so that the
> part of class.c that contains the definition of rtc_hctosys_ret is no=
t
> compiled ...
>=20
> > > Caused by commit "rtc_sysfs_show_hctosys(): display 0 if resume f=
ailed"
> > > from the akpm tree.  rtc_hctosys_ret was moved into class.c but p=
rotected
> > > by defined(CONFIG_PM) && defined(CONFIG_RTC_HCTOSYS_DEVICE) and t=
his
> > > build does not have CONFIG_PM set.



=46rom 7c5aac626f9f64b9a4cc8c1cca1e4cb7cfefb819 Mon Sep 17 00:00:00 200=
1
=46rom: David Fries <David@Fries.net>
Date: Sat, 25 Aug 2012 13:48:08 -0500
Subject: [PATCH] rtc_sysfs_show_hctosys(): display 0 if resume failed
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Without this patch /sys/class/rtc/$CONFIG_RTC_HCTOSYS_DEVICE/hctosys
contains a 1 (meaning "This rtc was used to initialize the system
clock") even if setting the time by do_settimeofday() at bootup failed.
The RTC can also be used to set the clock on resume, if it did 1,
otherwise 0.  Previously there was no indication if the RTC was used
to set the clock in resume.

This uses only CONFIG_RTC_HCTOSYS_DEVICE for conditional compilation
instead of it and CONFIG_RTC_HCTOSYS to be more consistent.
rtc_hctosys_ret was moved to class.c so class.c no longer depends on
hctosys.c.

Signed-off-by: David Fries <David@Fries.net>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 drivers/rtc/class.c     |    8 +++++++-
 drivers/rtc/hctosys.c   |    4 +---
 drivers/rtc/rtc-sysfs.c |    6 ++++++
 include/linux/rtc.h     |    2 +-
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index dc4c274..a022b1c 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -31,8 +31,11 @@ static void rtc_device_release(struct device *dev)
 	kfree(rtc);
 }
=20
-#if defined(CONFIG_PM) && defined(CONFIG_RTC_HCTOSYS_DEVICE)
+#ifdef CONFIG_RTC_HCTOSYS_DEVICE
+/* Result of the last RTC to system clock attempt. */
+int rtc_hctosys_ret =3D -ENODEV;
=20
+#ifdef CONFIG_PM
 /*
  * On suspend(), measure the delta between one RTC and the
  * system's wall clock; restore it on resume().
@@ -84,6 +87,7 @@ static int rtc_resume(struct device *dev)
 	struct timespec		new_system, new_rtc;
 	struct timespec		sleep_time;
=20
+	rtc_hctosys_ret =3D -ENODEV;
 	if (strcmp(dev_name(&rtc->dev), CONFIG_RTC_HCTOSYS_DEVICE) !=3D 0)
 		return 0;
=20
@@ -117,6 +121,7 @@ static int rtc_resume(struct device *dev)
=20
 	if (sleep_time.tv_sec >=3D 0)
 		timekeeping_inject_sleeptime(&sleep_time);
+	rtc_hctosys_ret =3D 0;
 	return 0;
 }
=20
@@ -124,6 +129,7 @@ static int rtc_resume(struct device *dev)
 #define rtc_suspend	NULL
 #define rtc_resume	NULL
 #endif
+#endif
=20
=20
 /**
diff --git a/drivers/rtc/hctosys.c b/drivers/rtc/hctosys.c
index bc90b09..4aa60d7 100644
--- a/drivers/rtc/hctosys.c
+++ b/drivers/rtc/hctosys.c
@@ -22,8 +22,6 @@
  * the best guess is to add 0.5s.
  */
=20
-int rtc_hctosys_ret =3D -ENODEV;
-
 static int __init rtc_hctosys(void)
 {
 	int err =3D -ENODEV;
@@ -56,7 +54,7 @@ static int __init rtc_hctosys(void)
=20
 	rtc_tm_to_time(&tm, &tv.tv_sec);
=20
-	do_settimeofday(&tv);
+	err =3D do_settimeofday(&tv);
=20
 	dev_info(rtc->dev.parent,
 		"setting system clock to "
diff --git a/drivers/rtc/rtc-sysfs.c b/drivers/rtc/rtc-sysfs.c
index 380083c..b70e2bb 100644
--- a/drivers/rtc/rtc-sysfs.c
+++ b/drivers/rtc/rtc-sysfs.c
@@ -102,6 +102,12 @@ rtc_sysfs_set_max_user_freq(struct device *dev, st=
ruct device_attribute *attr,
 	return n;
 }
=20
+/**
+ * rtc_sysfs_show_hctosys - indicate if the given RTC set the system t=
ime
+ *
+ * Returns 1 if the system clock was set by this RTC at the last
+ * boot or resume event.
+ */
 static ssize_t
 rtc_sysfs_show_hctosys(struct device *dev, struct device_attribute *at=
tr,
 		char *buf)
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index f071b39..20ec4d3 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -276,7 +276,7 @@ static inline bool is_leap_year(unsigned int year)
 	return (!(year % 4) && (year % 100)) || !(year % 400);
 }
=20
-#ifdef CONFIG_RTC_HCTOSYS
+#ifdef CONFIG_RTC_HCTOSYS_DEVICE
 extern int rtc_hctosys_ret;
 #else
 #define rtc_hctosys_ret -ENODEV
--=20
1.7.2.5
