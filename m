From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] w1: fix ds28e04 build, select CRC16
Date: Wed, 18 Apr 2012 08:06:33 -0700
Message-ID: <4F8ED879.9090606@xenotime.net>
References: <20120418150056.0c6057320a29b3b482a63cc7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120418150056.0c6057320a29b3b482a63cc7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Evgeniy Polyakov <zbr@ioremap.net>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix build error by selecting CRC16:

ERROR: "crc16" [drivers/w1/slaves/w1_ds28e04.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	Evgeniy Polyakov <zbr@ioremap.net>
---
 drivers/w1/slaves/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20120418.orig/drivers/w1/slaves/Kconfig
+++ linux-next-20120418/drivers/w1/slaves/Kconfig
@@ -97,6 +97,7 @@ config W1_SLAVE_DS2781
 config W1_SLAVE_DS28E04
 	tristate "4096-Bit Addressable 1-Wire EEPROM with PIO (DS28E04-100)"
 	depends on W1
+	select CRC16
 	help
 	  Say Y here if you want to use a 1-wire
 	  4kb EEPROM with PIO family device (DS28E04).
