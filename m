From: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Subject: Re: linux-next: usb tree build failure
Date: Tue, 23 Dec 2008 17:07:25 -0800
Message-ID: <200812231707.25796.inaky@linux.intel.com>
References: <20081222113335.667c2d01.sfr@canb.auug.org.au> <200812230226.29519.inaky@linux.intel.com> <20081223171726.GB4043@kroah.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_NtYUJnlFTX+soE6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga10.intel.com ([192.55.52.92]:16293 "EHLO
	fmsmga102.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751361AbYLXBPt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Dec 2008 20:15:49 -0500
In-Reply-To: <20081223171726.GB4043@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

--Boundary-00=_NtYUJnlFTX+soE6
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 23 December 2008, Greg KH wrote:
> On Tue, Dec 23, 2008 at 02:26:28AM -0800, Inaky Perez-Gonzalez wrote:
> > On Monday 22 December 2008, Greg KH wrote:
> > > On Mon, Dec 22, 2008 at 09:26:43AM -0800, Inaky Perez-Gonzalez wrote:
> > > > On Sunday 21 December 2008, Sam Ravnborg wrote:
> > > >
> > > > ops -- ok, I will. I guess I have to add this in all the similar
> > > > ones, right?
> > > >
> > > > Greg, do you want a new patch series or just another patch on top?
> > >
> > > Just a single replacement patch for when we add this makefile is fine
> > > with me.
> >
> > Hmmm, there was more feedback Sam gave me on Kconfig and Makefiles I
> > added, so at the end the patch touches more files than just this one.
> > Maybe a whole new series will be the way to go.
>
> Ick, I really don't want that.  But feel free to respin them yourself,
> and then just send the different patches?  It's easy to just replace a
> few individual ones than to drop the whole series and redo it (well on
> my end at least...)
>
> Heck, tell me what to edit and I can edit individual patches quite
> easily as well, I'd rather do that as well :)

:) -- find them attached, it's just a couple of them that need a respin
(#10 and #27).

-- 
Inaky

--Boundary-00=_NtYUJnlFTX+soE6
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="0010-wimax-Makefile-Kconfig-and-docbook-linkage-for-the.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0010-wimax-Makefile-Kconfig-and-docbook-linkage-for-the.patch"

=46rom 52ee3acf71f4f8079482f803ce3e510d05214145 Mon Sep 17 00:00:00 2001
Message-Id: <52ee3acf71f4f8079482f803ce3e510d05214145.1230078072.git.inaky@=
linux.intel.com>
In-Reply-To: <cover.1230078071.git.inaky@linux.intel.com>
References: <cover.1230078071.git.inaky@linux.intel.com>
=46rom: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Date: Tue, 23 Dec 2008 16:18:24 -0800
Subject: [PATCH 10/29] wimax: Makefile, Kconfig and docbook linkage for the=
 stack

This patch provides Makefile and KConfig for the WiMAX stack,
integrating them into the networking stack's Makefile, Kconfig and
doc-book templates.

Signed-off-by: Inaky Perez-Gonzalez <inaky@linux.intel.com>
=2D--
 Documentation/DocBook/networking.tmpl |    8 +++++++
 net/Kconfig                           |    2 +
 net/Makefile                          |    1 +
 net/wimax/Kconfig                     |   38 +++++++++++++++++++++++++++++=
++++
 net/wimax/Makefile                    |   13 +++++++++++
 5 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 net/wimax/Kconfig
 create mode 100644 net/wimax/Makefile

diff --git a/Documentation/DocBook/networking.tmpl b/Documentation/DocBook/=
networking.tmpl
index f24f9e8..7053c1c 100644
=2D-- a/Documentation/DocBook/networking.tmpl
+++ b/Documentation/DocBook/networking.tmpl
@@ -101,6 +101,14 @@ X!Enet/core/wireless.c
      <sect1><title>Synchronous PPP</title>
 !Edrivers/net/wan/syncppp.c
      </sect1>
+     <sect1><title>WiMAX</title>
+!Enet/wimax/op-msg.c
+!Enet/wimax/op-reset.c
+!Enet/wimax/op-rfkill.c
+!Enet/wimax/stack.c
+!Iinclude/net/wimax.h
+!Iinclude/linux/wimax.h
+     </sect1>
   </chapter>
=20
 </book>
diff --git a/net/Kconfig b/net/Kconfig
index d789d79..3bff221 100644
=2D-- a/net/Kconfig
+++ b/net/Kconfig
@@ -251,6 +251,8 @@ source "net/ieee80211/Kconfig"
=20
 endif # WIRELESS
=20
+source "net/wimax/Kconfig"
+
 source "net/rfkill/Kconfig"
 source "net/9p/Kconfig"
=20
diff --git a/net/Makefile b/net/Makefile
index 27d1f10..620a505 100644
=2D-- a/net/Makefile
+++ b/net/Makefile
@@ -61,3 +61,4 @@ obj-$(CONFIG_NET_9P)		+=3D 9p/
 ifeq ($(CONFIG_NET),y)
 obj-$(CONFIG_SYSCTL)		+=3D sysctl_net.o
 endif
+obj-$(CONFIG_WIMAX)		+=3D wimax/
diff --git a/net/wimax/Kconfig b/net/wimax/Kconfig
new file mode 100644
index 0000000..0bdbb69
=2D-- /dev/null
+++ b/net/wimax/Kconfig
@@ -0,0 +1,38 @@
+#
+# WiMAX LAN device configuration
+#
+
+menuconfig WIMAX
+	tristate "WiMAX Wireless Broadband support"
+	help
+
+	  Select to configure support for devices that provide
+	  wireless broadband connectivity using the WiMAX protocol
+	  (IEEE 802.16).
+
+	  Please note that most of these devices require signing up
+	  for a service plan with a provider.
+
+	  The different WiMAX drivers can be enabled in the menu entry
+
+	  Device Drivers > Network device support > WiMAX Wireless
+	  Broadband devices
+
+	  If unsure, it is safe to select M (module).
+
+config WIMAX_DEBUG_LEVEL
+	int "WiMAX debug level"
+	depends on WIMAX
+	default 8
+	help
+
+	  Select the maximum debug verbosity level to be compiled into
+	  the WiMAX stack code.
+
+	  By default, debug messages are disabled at runtime and can
+	  be selectively enabled for different parts of the code using
+	  the sysfs debug-levels file.
+
+	  If set at zero, this will compile out all the debug code.
+
+	  It is recommended that it is left at 8.
diff --git a/net/wimax/Makefile b/net/wimax/Makefile
new file mode 100644
index 0000000..5b80b94
=2D-- /dev/null
+++ b/net/wimax/Makefile
@@ -0,0 +1,13 @@
+
+obj-$(CONFIG_WIMAX)		+=3D wimax.o
+
+wimax-y :=3D		\
+	id-table.o	\
+	op-msg.o	\
+	op-reset.o	\
+	op-rfkill.o	\
+	stack.o
+
+wimax-$(CONFIG_DEBUG_FS) +=3D debugfs.o
+
+
=2D-=20
1.5.6.5


--Boundary-00=_NtYUJnlFTX+soE6
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="0027-i2400m-Makefile-and-Kconfig.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0027-i2400m-Makefile-and-Kconfig.patch"

=46rom 4d704321da4020a0c11396ca6785be2d948fe728 Mon Sep 17 00:00:00 2001
Message-Id: <4d704321da4020a0c11396ca6785be2d948fe728.1230078072.git.inaky@=
linux.intel.com>
In-Reply-To: <cover.1230078071.git.inaky@linux.intel.com>
References: <cover.1230078071.git.inaky@linux.intel.com>
=46rom: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Date: Tue, 23 Dec 2008 16:18:48 -0800
Subject: [PATCH 27/29] i2400m: Makefile and Kconfig

Integrate the i2400m driver into the kernel's build and Kconfig.

Signed-off-by: Inaky Perez-Gonzalez <inaky@linux.intel.com>
=2D--
 drivers/net/Kconfig               |    2 +
 drivers/net/Makefile              |    1 +
 drivers/net/wimax/Kconfig         |   17 +++++++++++++
 drivers/net/wimax/Makefile        |    5 ++++
 drivers/net/wimax/i2400m/Kconfig  |   49 +++++++++++++++++++++++++++++++++=
++++
 drivers/net/wimax/i2400m/Makefile |   29 ++++++++++++++++++++++
 6 files changed, 103 insertions(+), 0 deletions(-)
 create mode 100644 drivers/net/wimax/Kconfig
 create mode 100644 drivers/net/wimax/Makefile
 create mode 100644 drivers/net/wimax/i2400m/Kconfig
 create mode 100644 drivers/net/wimax/i2400m/Makefile

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 231eeaf..6255b79 100644
=2D-- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -2585,6 +2585,8 @@ source "drivers/net/tokenring/Kconfig"
=20
 source "drivers/net/wireless/Kconfig"
=20
+source "drivers/net/wimax/Kconfig"
+
 source "drivers/net/usb/Kconfig"
=20
 source "drivers/net/pcmcia/Kconfig"
diff --git a/drivers/net/Makefile b/drivers/net/Makefile
index 017383a..32fe7af 100644
=2D-- a/drivers/net/Makefile
+++ b/drivers/net/Makefile
@@ -262,3 +262,4 @@ obj-$(CONFIG_NIU) +=3D niu.o
 obj-$(CONFIG_VIRTIO_NET) +=3D virtio_net.o
 obj-$(CONFIG_SFC) +=3D sfc/
=20
+obj-$(CONFIG_WIMAX) +=3D wimax/
diff --git a/drivers/net/wimax/Kconfig b/drivers/net/wimax/Kconfig
new file mode 100644
index 0000000..565018e
=2D-- /dev/null
+++ b/drivers/net/wimax/Kconfig
@@ -0,0 +1,17 @@
+#
+# WiMAX LAN device drivers configuration
+#
+
+
+comment "Enable WiMAX (Networking options) to see the WiMAX drivers"
+	depends on WIMAX =3D n
+
+if WIMAX
+
+menu "WiMAX Wireless Broadband devices"
+
+source "drivers/net/wimax/i2400m/Kconfig"
+
+endmenu
+
+endif
diff --git a/drivers/net/wimax/Makefile b/drivers/net/wimax/Makefile
new file mode 100644
index 0000000..992bc02
=2D-- /dev/null
+++ b/drivers/net/wimax/Makefile
@@ -0,0 +1,5 @@
+
+obj-$(CONFIG_WIMAX_I2400M)	+=3D i2400m/
+
+# (from Sam Ravnborg) force kbuild to create built-in.o
+obj- :=3D dummy.o
diff --git a/drivers/net/wimax/i2400m/Kconfig b/drivers/net/wimax/i2400m/Kc=
onfig
new file mode 100644
index 0000000..d623b3d
=2D-- /dev/null
+++ b/drivers/net/wimax/i2400m/Kconfig
@@ -0,0 +1,49 @@
+
+config WIMAX_I2400M
+	tristate
+	depends on WIMAX
+	select FW_LOADER
+
+comment "Enable USB support to see WiMAX USB drivers"
+	depends on USB =3D n
+
+comment "Enable MMC support to see WiMAX SDIO drivers"
+	depends on MMC =3D n
+
+config WIMAX_I2400M_USB
+	tristate "Intel Wireless WiMAX Connection 2400 over USB (including 5x50)"
+	depends on WIMAX && USB
+	select WIMAX_I2400M
+	help
+	  Select if you have a device based on the Intel WiMAX
+	  Connection 2400 over USB (like any of the Intel Wireless
+	  WiMAX/WiFi Link 5x50 series).
+
+	  If unsure, it is safe to select M (module).
+
+config WIMAX_I2400M_SDIO
+	tristate "Intel Wireless WiMAX Connection 2400 over SDIO"
+	depends on WIMAX && MMC
+	select WIMAX_I2400M
+	help
+	  Select if you have a device based on the Intel WiMAX
+	  Connection 2400 over SDIO.
+
+	  If unsure, it is safe to select M (module).
+
+config WIMAX_I2400M_DEBUG_LEVEL
+	int "WiMAX i2400m debug level"
+	depends on WIMAX_I2400M
+	default 8
+	help
+
+	  Select the maximum debug verbosity level to be compiled into
+	  the WiMAX i2400m driver code.
+
+	  By default, this is disabled at runtime and can be
+	  selectively enabled at runtime for different parts of the
+	  code using the sysfs debug-levels file.
+
+	  If set at zero, this will compile out all the debug code.
+
+	  It is recommended that it is left at 8.
diff --git a/drivers/net/wimax/i2400m/Makefile b/drivers/net/wimax/i2400m/M=
akefile
new file mode 100644
index 0000000..1696e93
=2D-- /dev/null
+++ b/drivers/net/wimax/i2400m/Makefile
@@ -0,0 +1,29 @@
+
+obj-$(CONFIG_WIMAX_I2400M) +=3D i2400m.o
+obj-$(CONFIG_WIMAX_I2400M_USB) +=3D i2400m-usb.o
+obj-$(CONFIG_WIMAX_I2400M_SDIO) +=3D i2400m-sdio.o
+
+i2400m-y :=3D		\
+	control.o	\
+	driver.o	\
+	fw.o		\
+	op-rfkill.o	\
+	netdev.o	\
+	tx.o		\
+	rx.o
+
+i2400m-$(CONFIG_DEBUG_FS) +=3D debugfs.o
+
+i2400m-usb-y :=3D			\
+	usb-fw.o		\
+	usb-notif.o		\
+	usb-tx.o		\
+	usb-rx.o		\
+	usb.o
+
+
+i2400m-sdio-y :=3D 		\
+	sdio.o      		\
+	sdio-tx.o   		\
+	sdio-fw.o	 	\
+	sdio-rx.o
=2D-=20
1.5.6.5


--Boundary-00=_NtYUJnlFTX+soE6--
