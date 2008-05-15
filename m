From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: i2c build failure
Date: Thu, 15 May 2008 10:22:15 +0200
Message-ID: <20080515102215.62378c4f@hyperion.delvare>
References: <20080515121241.1ede11be.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:35590 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752981AbYEOIW2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 May 2008 04:22:28 -0400
In-Reply-To: <20080515121241.1ede11be.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>

Hi Stephen,

On Thu, 15 May 2008 12:12:41 +1000, Stephen Rothwell wrote:
> Today's linux-next build (powerpc ppc64_defconfig) fails like this:
> 
> arch/powerpc/platforms/pasemi/misc.c: In function 'find_i2c_driver':
> arch/powerpc/platforms/pasemi/misc.c:43: error: 'struct i2c_board_info' has no member named 'driver_name'
> arch/powerpc/platforms/pasemi/misc.c:44: error: 'struct i2c_board_info' has no member named 'driver_name'
> arch/powerpc/platforms/pasemi/misc.c:44: error: 'struct i2c_board_info' has no member named 'driver_name'
> 
> So I reverted commit f625810ef235a8b238427df3129792f89187c085 ("i2c: Kill
> the old driver matching scheme").  Obviously not the correct fix, but it
> makes the build work.

Thanks for the notification and sorry for the trouble. I thought that I
knew about all users of struct i2c_board_info and that they were all
converted by now but obviously not. I didn't know that fsl_soc.c had
been partly forked for the pasemi platform.

Here's a fix, it's the same that was applied to fsl_soc.c:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blobdiff;f=arch/powerpc/sysdev/fsl_soc.c;h=324c01b70dddfc14701210dc1547c3dfd9a65fab;hp=7b45670c7af387c34d670018dcc76108958d45fb;hb=3760f736716f74bdc62a4ba5406934338da93eb2;hpb=d2653e92732bd3911feff6bee5e23dbf959381db

---
 arch/powerpc/platforms/pasemi/misc.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- linux-2.6.26-rc2.orig/arch/powerpc/platforms/pasemi/misc.c	2008-04-17 04:49:44.000000000 +0200
+++ linux-2.6.26-rc2/arch/powerpc/platforms/pasemi/misc.c	2008-05-15 10:15:32.000000000 +0200
@@ -24,12 +24,11 @@
  */
 struct i2c_driver_device {
 	char    *of_device;
-	char    *i2c_driver;
 	char    *i2c_type;
 };
 
 static struct i2c_driver_device i2c_devices[] __initdata = {
-	{"dallas,ds1338",  "rtc-ds1307",  "ds1338"},
+	{"dallas,ds1338",  "ds1338"},
 };
 
 static int __init find_i2c_driver(struct device_node *node,
@@ -40,9 +39,7 @@ static int __init find_i2c_driver(struct
 	for (i = 0; i < ARRAY_SIZE(i2c_devices); i++) {
 		if (!of_device_is_compatible(node, i2c_devices[i].of_device))
 			continue;
-		if (strlcpy(info->driver_name, i2c_devices[i].i2c_driver,
-			    KOBJ_NAME_LEN) >= KOBJ_NAME_LEN ||
-		    strlcpy(info->type, i2c_devices[i].i2c_type,
+		if (strlcpy(info->type, i2c_devices[i].i2c_type,
 			    I2C_NAME_SIZE) >= I2C_NAME_SIZE)
 			return -ENOMEM;
 		return 0;


Olof, please test it if you can. I will push this patch to Linux
quickly.

Stephen, I'm updating my i2c tree now and you'll get this patch under
the name i2c-02-switch-pasemi-to-module-aliases.patch. Note that this
will cause one more conflict with Greg KH driver tree, which you can
solve the same way you solved the other ones.

Thanks,
-- 
Jean Delvare
