From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the char-misc tree
Date: Mon, 20 Mar 2017 13:44:14 +1100
Message-ID: <20170320134414.25f2e3d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46409 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751966AbdCTCok (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Mar 2017 22:44:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cyril Bur <cyrilbur@gmail.com>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/misc/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_mmap':
drivers/misc/aspeed-lpc-ctrl.c:51:9: error: implicit declaration of function 'pgprot_dmacoherent' [-Werror=implicit-function-declaration]
  prot = pgprot_dmacoherent(prot);
         ^
drivers/misc/aspeed-lpc-ctrl.c:51:7: error: incompatible types when assigning to type 'pgprot_t {aka struct pgprot}' from type 'int'
  prot = pgprot_dmacoherent(prot);
       ^
In file included from include/linux/miscdevice.h:6:0,
                 from drivers/misc/aspeed-lpc-ctrl.c:11:
drivers/misc/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_probe':
drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'phys_addr_t {aka long long unsigned int}' [-Wformat=]
   dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
                 ^
include/linux/device.h:1317:51: note: in definition of macro 'dev_info'
 #define dev_info(dev, fmt, arg...) _dev_info(dev, fmt, ##arg)
                                                   ^
drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]
   dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
                 ^
include/linux/device.h:1317:51: note: in definition of macro 'dev_info'
 #define dev_info(dev, fmt, arg...) _dev_info(dev, fmt, ##arg)
                                                   ^

Caused by commit

  6c4e97678501 ("drivers/misc: Add Aspeed LPC control driver")

Clearly this will only build on arm :-(  You can only use COMPILE_TEST
if you can reasonably expect the build to work on all architectures
and platforms.

I have added the following patch for today (the warnings should be fixed as well):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 20 Mar 2017 13:38:10 +1100
Subject: [PATCH] drivers/misc: Aspeed LPC control driver will only build on arm

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/misc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index fb933b0b9297..52a46b129214 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -773,7 +773,7 @@ config PANEL_BOOT_MESSAGE
 endif # PANEL
 
 config ASPEED_LPC_CTRL
-	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
+	depends on ARCH_ASPEED && REGMAP && MFD_SYSCON
 	tristate "Aspeed ast2400/2500 HOST LPC to BMC bridge control"
 	---help---
 	  Control Aspeed ast2400/2500 HOST LPC to BMC mappings through
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
