From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/wireless: don't build when NET etc. are not
 enabled
Date: Fri, 06 Nov 2009 15:35:15 -0800
Message-ID: <4AF4B2B3.8020109@oracle.com>
References: <20091106181330.80bca052.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760523AbZKFWez@vger.kernel.org>
In-Reply-To: <20091106181330.80bca052.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

These wireless drivers in staging could be built when
CONFIG_NET=n, CONFIG_NETDEVICES=n, causing this build error:

net/wireless/wext-priv.c: In function 'ioctl_private_call':
net/wireless/wext-priv.c:206: error: implicit declaration of function 'call_commit_handler'

due to faulty selects.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
---
 drivers/staging/arlan/Kconfig   |    2 +-
 drivers/staging/netwave/Kconfig |    2 +-
 drivers/staging/wavelan/Kconfig |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20091106.orig/drivers/staging/arlan/Kconfig
+++ linux-next-20091106/drivers/staging/arlan/Kconfig
@@ -1,6 +1,6 @@
 config ARLAN
 	tristate "Aironet Arlan 655 & IC2200 DS support"
-	depends on ISA && !64BIT
+	depends on ISA && !64BIT && WLAN
 	select WIRELESS_EXT
 	---help---
 	  Aironet makes Arlan, a class of wireless LAN adapters. These use the
--- linux-next-20091106.orig/drivers/staging/netwave/Kconfig
+++ linux-next-20091106/drivers/staging/netwave/Kconfig
@@ -1,6 +1,6 @@
 config PCMCIA_NETWAVE
 	tristate "Xircom Netwave AirSurfer Pcmcia wireless support"
-	depends on PCMCIA
+	depends on PCMCIA && WLAN
 	select WIRELESS_EXT
 	select WEXT_PRIV
 	help
--- linux-next-20091106.orig/drivers/staging/wavelan/Kconfig
+++ linux-next-20091106/drivers/staging/wavelan/Kconfig
@@ -1,6 +1,6 @@
 config WAVELAN
 	tristate "AT&T/Lucent old WaveLAN & DEC RoamAbout DS ISA support"
-	depends on ISA
+	depends on ISA && WLAN
 	select WIRELESS_EXT
 	select WEXT_SPY
 	select WEXT_PRIV
@@ -25,7 +25,7 @@ config WAVELAN
 
 config PCMCIA_WAVELAN
 	tristate "AT&T/Lucent old WaveLAN Pcmcia wireless support"
-	depends on PCMCIA
+	depends on PCMCIA && WLAN
 	select WIRELESS_EXT
 	select WEXT_SPY
 	select WEXT_PRIV
