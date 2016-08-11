From: Arnd Bergmann <arnd@arndb.de>
Subject: [TESTING] kbuild: link drivers subdirectories separately
Date: Thu, 11 Aug 2016 15:49:03 +0200
Message-ID: <10934898.zRVpW5bs5f@wuerfel>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com> <6327068.NbTmhQA6XD@wuerfel> <20160811231240.4ba73123@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:57230 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752499AbcHKNuK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Aug 2016 09:50:10 -0400
In-Reply-To: <20160811231240.4ba73123@roar.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, Segher Boessenkool <segher@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Fengguang Wu <fengguang.wu@intel.com>, Guenter Roeck <linux@roeck-us.net>, Alan Modra <amodra@gmail.com>

On ARM, relative branches between functions can not span more than 32MB,
which limits the size of an ELF section. In the final link, the linker
will introduce trampolines that perform long calls to avoid the limit,
and during a recursive link, trampolines are added within the section.

However, this does not work for cross-section branches when the source
section is already larger than 32MB because there is no longer space
to put the trampoline.

We are unable to build an allyesconfig kernel on ARM because the
.text section in drivers/built-in.o has that problem.

This patch avoids it by linking drivers/*/built-in.o directly into
vmlinux.o, rather than first linking them into drivers/built-in.o.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This patch gets allyesconfig to work for me on ARM. We have previously
decided that this is too ugly, but you can use it for comparing the
link times.

diff --git a/Makefile b/Makefile
index 2eae4bab0d9b..091ca3a3015b 100644
--- a/Makefile
+++ b/Makefile
@@ -557,13 +557,6 @@ scripts: scripts_basic include/config/auto.conf include/config/tristate.conf \
 	 asm-generic gcc-plugins
 	$(Q)$(MAKE) $(build)=$(@)
 
-# Objects we will link into vmlinux / subdirs we need to visit
-init-y		:= init/
-drivers-y	:= drivers/ sound/ firmware/
-net-y		:= net/
-libs-y		:= lib/
-core-y		:= usr/
-virt-y		:= virt/
 endif # KBUILD_EXTMOD
 
 ifeq ($(dot-config),1)
@@ -584,6 +577,20 @@ $(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;
 # we execute the config step to be sure to catch updated Kconfig files
 include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
 	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
+
+# Objects we will link into vmlinux / subdirs we need to visit
+init-y		:= init/
+net-y		:= net/
+libs-y		:= lib/
+core-y		:= usr/
+virt-y		:= virt/
+
+# split out objects from drivers to avoid recursively linking large .o files
+include drivers/Makefile
+drivers-y	:= $(addprefix drivers/,$(obj-y) $(obj-m))
+drivers-y	+= sound/ firmware/
+obj-y		:=
+
 else
 # external modules needs include/generated/autoconf.h and include/config/auto.conf
 # but do not care if they are up-to-date. Use auto.conf to trigger the test
diff --git a/drivers/Makefile b/drivers/Makefile
index 9cfa547d67ce..38848742db1f 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -95,10 +95,7 @@ obj-$(CONFIG_ATA_OVER_ETH)	+= block/aoe/
 obj-$(CONFIG_PARIDE) 		+= block/paride/
 obj-$(CONFIG_TC)		+= tc/
 obj-$(CONFIG_UWB)		+= uwb/
-obj-$(CONFIG_USB_PHY)		+= usb/
-obj-$(CONFIG_USB)		+= usb/
-obj-$(CONFIG_PCI)		+= usb/
-obj-$(CONFIG_USB_GADGET)	+= usb/
+obj-y				+= usb/
 obj-$(CONFIG_SERIO)		+= input/serio/
 obj-$(CONFIG_GAMEPORT)		+= input/gameport/
 obj-$(CONFIG_INPUT)		+= input/
@@ -137,7 +134,8 @@ obj-$(CONFIG_PPC_PS3)		+= ps3/
 obj-$(CONFIG_OF)		+= of/
 obj-$(CONFIG_SSB)		+= ssb/
 obj-$(CONFIG_BCMA)		+= bcma/
-obj-y				+= vhost/
+obj-$(CONFIG_VHOST_RING)	+= vhost/
+obj-$(CONFIG_VHOST)		+= vhost/
 obj-$(CONFIG_VLYNQ)		+= vlynq/
 obj-$(CONFIG_STAGING)		+= staging/
 obj-y				+= platform/
