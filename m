From: Mike Rapoport <mike@compulab.co.il>
Subject: [PATCH] MTD: NAND: make gpio_nand use io{read,write}{8,16}_rep (was:
 Re: linux-next: mtd tree build failure)
Date: Sun, 16 Nov 2008 09:39:06 +0200
Message-ID: <491FCE1A.6040201@compulab.co.il>
References: <20081020163518.b858f3f7.sfr@canb.auug.org.au>	 <1224487490.6770.1509.camel@macbook.infradead.org>	 <48FC4277.2000405@compulab.co.il> <1224492482.6770.1531.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oceanus.site5.com ([67.43.13.2]:40609 "EHLO oceanus.site5.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751169AbYKPHjL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Nov 2008 02:39:11 -0500
In-Reply-To: <1224492482.6770.1531.camel@macbook.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>

David Woodhouse wrote:
> On Mon, 2008-10-20 at 10:33 +0200, Mike Rapoport wrote:
>> You applied the correct version of the patch. It did depend on ARM at the
>> beginning, but after discussion it was decided to make it generic so that other
>> architecture would be able to use it. I just haven't thought that readsw/writesw
>> might be not available on all architectures.
> 
> I've made it depend on ARM again for now. For 2.6.29, let's look at
> making use ioread8_rep().

The below patch makes GPIO NAND use io{read,write}{8,16}_rep to allow
architectures other than ARM use the driver.
I've build-tested it for x86_64 with allmodconfig and for powerpc with
ep8248e_defconfig and manually enabled GPIO NAND driver.

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 drivers/mtd/nand/Kconfig |    2 +-
 drivers/mtd/nand/gpio.c  |   16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 1c2e945..b9eed99 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -58,7 +58,7 @@ config MTD_NAND_H1900

 config MTD_NAND_GPIO
 	tristate "GPIO NAND Flash driver"
-	depends on GENERIC_GPIO && ARM
+	depends on GENERIC_GPIO
 	help
 	  This enables a GPIO based NAND flash driver.

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 8f902e7..c9f26fa 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -87,14 +87,14 @@ static void gpio_nand_writebuf(struct mtd_info *mtd, const
u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;

-	writesb(this->IO_ADDR_W, buf, len);
+	iowrite8_rep(this->IO_ADDR_W, buf, len);
 }

 static void gpio_nand_readbuf(struct mtd_info *mtd, u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;

-	readsb(this->IO_ADDR_R, buf, len);
+	ioread8_rep(this->IO_ADDR_R, buf, len);
 }

 static int gpio_nand_verifybuf(struct mtd_info *mtd, const u_char *buf, int len)
@@ -104,7 +104,7 @@ static int gpio_nand_verifybuf(struct mtd_info *mtd, const
u_char *buf, int len)
 	int i, err = 0;

 	for (i = 0; i < len; i++) {
-		read = readb(this->IO_ADDR_R);
+		read = ioread8(this->IO_ADDR_R);
 		if (read != p[i]) {
 			pr_debug("%s: err at %d (read %04x vs %04x)\n",
 			       __func__, i, read, p[i]);
@@ -120,13 +120,13 @@ static void gpio_nand_writebuf16(struct mtd_info *mtd,
const u_char *buf,
 	struct nand_chip *this = mtd->priv;

 	if (IS_ALIGNED((unsigned long)buf, 2)) {
-		writesw(this->IO_ADDR_W, buf, len>>1);
+		iowrite16_rep(this->IO_ADDR_W, buf, len>>1);
 	} else {
 		int i;
 		unsigned short *ptr = (unsigned short *)buf;

 		for (i = 0; i < len; i += 2, ptr++)
-			writew(*ptr, this->IO_ADDR_W);
+			iowrite16(*ptr, this->IO_ADDR_W);
 	}
 }

@@ -135,13 +135,13 @@ static void gpio_nand_readbuf16(struct mtd_info *mtd,
u_char *buf, int len)
 	struct nand_chip *this = mtd->priv;

 	if (IS_ALIGNED((unsigned long)buf, 2)) {
-		readsw(this->IO_ADDR_R, buf, len>>1);
+		ioread16_rep(this->IO_ADDR_R, buf, len>>1);
 	} else {
 		int i;
 		unsigned short *ptr = (unsigned short *)buf;

 		for (i = 0; i < len; i += 2, ptr++)
-			*ptr = readw(this->IO_ADDR_R);
+			*ptr = ioread16(this->IO_ADDR_R);
 	}
 }

@@ -154,7 +154,7 @@ static int gpio_nand_verifybuf16(struct mtd_info *mtd, const
u_char *buf,
 	len >>= 1;

 	for (i = 0; i < len; i++) {
-		read = readw(this->IO_ADDR_R);
+		read = ioread16(this->IO_ADDR_R);
 		if (read != p[i]) {
 			pr_debug("%s: err at %d (read %04x vs %04x)\n",
 			       __func__, i, read, p[i]);
-- 
1.5.6.4




-- 
Sincerely yours,
Mike.
