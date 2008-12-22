From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mtd tree
Date: Mon, 22 Dec 2008 17:12:01 +1100
Message-ID: <20081222171201.4a3680ae.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42323 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751244AbYLVGMI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 01:12:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>

Hi David,

Today's linux-next merge of the mtd tree got a conflict in
drivers/mtd/devices/m25p80.c drivers/mtd/devices/mtd_dataflash.c between
commit 0e02ed3e44ef541e4d684348d9e684ab3bdd9399 ("mtd: struct device -
replace bus_id with dev_name(), dev_set_name()") from the driver-core
tree and commits 5b7f3a500cd097d673a6283fbb748c1e4f87bac6 ("[MTD] fix
dataflash 64-bit divisions") and d85316ac459f1cdd14ea1828eebeac1f1028e167
("[MTD] fix m25p80 64-bit divisions") from the mtd tree.

I fixed it up (see below) and can carry the fix as necessary.  However, I
suggest that you apply the patch from the driver-core tree as its
prerequisites are upstream and you were cc'd on it.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/mtd/devices/m25p80.c
index 5733f06,9be0229..0000000
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@@ -169,9 -170,9 +170,9 @@@ static int wait_till_ready(struct m25p 
   */
  static int erase_chip(struct m25p *flash)
  {
- 	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %dKiB\n",
+ 	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %lldKiB\n",
 -			flash->spi->dev.bus_id, __func__,
 +			dev_name(&flash->spi->dev), __func__,
- 			flash->mtd.size / 1024);
+ 			(long long)(flash->mtd.size >> 10));
  
  	/* Wait until finished previous write command. */
  	if (wait_till_ready(flash))
@@@ -232,10 -233,11 +233,11 @@@ static int m25p80_erase(struct mtd_inf
  {
  	struct m25p *flash = mtd_to_m25p(mtd);
  	u32 addr,len;
+ 	uint32_t rem;
  
- 	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %d\n",
+ 	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%llx, len %lld\n",
 -			flash->spi->dev.bus_id, __func__, "at",
 +			dev_name(&flash->spi->dev), __func__, "at",
- 			(u32)instr->addr, instr->len);
+ 			(long long)instr->addr, (long long)instr->len);
  
  	/* sanity checks */
  	if (instr->addr + instr->len > flash->mtd.size)
diff --cc drivers/mtd/devices/mtd_dataflash.c
index 65126cd,6806897..0000000
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@@ -152,15 -153,20 +153,20 @@@ static int dataflash_erase(struct mtd_i
  	struct spi_message	msg;
  	unsigned		blocksize = priv->page_size << 3;
  	uint8_t			*command;
+ 	uint32_t		rem;
  
- 	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=0x%x len 0x%x\n",
- 			dev_name(&spi->dev),
- 			instr->addr, instr->len);
+ 	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=0x%llx len 0x%llx\n",
 -			spi->dev.bus_id, (long long)instr->addr,
++			dev_name(&spi->dev), (long long)instr->addr,
+ 			(long long)instr->len);
  
  	/* Sanity checks */
- 	if ((instr->addr + instr->len) > mtd->size
- 			|| (instr->len % priv->page_size) != 0
- 			|| (instr->addr % priv->page_size) != 0)
+ 	if (instr->addr + instr->len > mtd->size)
+ 		return -EINVAL;
+ 	div_u64_rem(instr->len, priv->page_size, &rem);
+ 	if (rem)
+ 		return -EINVAL;
+ 	div_u64_rem(instr->addr, priv->page_size, &rem);
+ 	if (rem)
  		return -EINVAL;
  
  	spi_message_init(&msg);
