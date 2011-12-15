From: Sean MacLennan <seanm@seanm.ca>
Subject: [PATCH] linux-next: Tree for Dec 12 (staging/rtl8192e)
Date: Wed, 14 Dec 2011 20:18:44 -0500
Message-ID: <20111214201844.60cf5fe5@opus.seanm.ca>
References: <20111212161444.22a11535656c6bfbd884d9ec@canb.auug.org.au>
	<4EE63A9C.1090503@xenotime.net>
	<20111213233939.572235ff@opus.seanm.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111213233939.572235ff@opus.seanm.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean MacLennan <seanm@seanm.ca>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

The rtllib and rtllib_crypt drivers are both required for a fully
functional rtllib. Make sure both are always available by having
rtllib select rtllib_crypt.

Signed-off-by: Sean MacLennan <seanm@seanm.ca>
---
This patch is against linux-next.

 drivers/staging/rtl8192e/Kconfig |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/Kconfig b/drivers/staging/rtl8192e/Kconfig
index a24305d..878f384 100644
--- a/drivers/staging/rtl8192e/Kconfig
+++ b/drivers/staging/rtl8192e/Kconfig
@@ -2,6 +2,7 @@ config RTLLIB
 	tristate "Support for rtllib wireless devices"
 	depends on WLAN && m
 	default n
+	select RTLLIB_CRYPTO
 	---help---
 	  If you have a wireless card that uses rtllib, say
 	  Y. Currently the only card is the rtl8192e.
@@ -12,16 +13,12 @@ if RTLLIB
 
 config RTLLIB_CRYPTO
 	tristate "Support for rtllib crypto support"
-	depends on RTLLIB
-	default y
 	---help---
-	  CCMP crypto driver for rtllib.
-
-	  If you enabled RTLLIB, you want this.
+	  Base crypto driver for rtllib.
 
 config RTLLIB_CRYPTO_CCMP
 	tristate "Support for rtllib CCMP crypto"
-	depends on RTLLIB && RTLLIB_CRYPTO
+	depends on RTLLIB_CRYPTO
 	default y
 	---help---
 	  CCMP crypto driver for rtllib.
@@ -30,7 +27,7 @@ config RTLLIB_CRYPTO_CCMP
 
 config RTLLIB_CRYPTO_TKIP
 	tristate "Support for rtllib TKIP crypto"
-	depends on RTLLIB && RTLLIB_CRYPTO
+	depends on RTLLIB_CRYPTO
 	default y
 	---help---
 	  TKIP crypto driver for rtllib.
@@ -39,7 +36,7 @@ config RTLLIB_CRYPTO_TKIP
 
 config RTLLIB_CRYPTO_WEP
 	tristate "Support for rtllib WEP crypto"
-	depends on RTLLIB && RTLLIB_CRYPTO
+	depends on RTLLIB_CRYPTO
 	default y
 	---help---
 	  TKIP crypto driver for rtllib.
