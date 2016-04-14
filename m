From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the leds tree with the nand tree
Date: Thu, 14 Apr 2016 12:44:27 +1000
Message-ID: <20160414124427.26e4e6ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50019 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752218AbcDNCoa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Apr 2016 22:44:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Hi Jacek,

Today's linux-next merge of the leds tree got a conflict in:

  drivers/mtd/nand/nand_base.c

between commit:

  4d66dc858ec9 ("mtd: nand: implement the default mtd_ooblayout_ops")

from the nand tree and commit:

  4c7e054f0882 ("mtd: nand: Remove the "nand-disk" LED trigger")

from the leds tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/mtd/nand/nand_base.c
index 46c46642c24b,8d6287ef3926..000000000000
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@@ -48,102 -47,54 +47,96 @@@
  #include <linux/mtd/partitions.h>
  #include <linux/of_mtd.h>
  
 +static int nand_get_device(struct mtd_info *mtd, int new_state);
 +
 +static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 +			     struct mtd_oob_ops *ops);
 +
- /*
-  * For devices which display every fart in the system on a separate LED. Is
-  * compiled away when LED support is disabled.
-  */
- DEFINE_LED_TRIGGER(nand_led_trigger);
- 
  /* Define default oob placement schemes for large and small page devices */
 -static struct nand_ecclayout nand_oob_8 = {
 -	.eccbytes = 3,
 -	.eccpos = {0, 1, 2},
 -	.oobfree = {
 -		{.offset = 3,
 -		 .length = 2},
 -		{.offset = 6,
 -		 .length = 2} }
 -};
 +static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
 +				 struct mtd_oob_region *oobregion)
 +{
 +	struct nand_chip *chip = mtd_to_nand(mtd);
 +	struct nand_ecc_ctrl *ecc = &chip->ecc;
  
 -static struct nand_ecclayout nand_oob_16 = {
 -	.eccbytes = 6,
 -	.eccpos = {0, 1, 2, 3, 6, 7},
 -	.oobfree = {
 -		{.offset = 8,
 -		 . length = 8} }
 -};
 +	if (section > 1)
 +		return -ERANGE;
  
 -static struct nand_ecclayout nand_oob_64 = {
 -	.eccbytes = 24,
 -	.eccpos = {
 -		   40, 41, 42, 43, 44, 45, 46, 47,
 -		   48, 49, 50, 51, 52, 53, 54, 55,
 -		   56, 57, 58, 59, 60, 61, 62, 63},
 -	.oobfree = {
 -		{.offset = 2,
 -		 .length = 38} }
 -};
 +	if (!section) {
 +		oobregion->offset = 0;
 +		oobregion->length = 4;
 +	} else {
 +		oobregion->offset = 6;
 +		oobregion->length = ecc->total - 4;
 +	}
 +
 +	return 0;
 +}
 +
 +static int nand_ooblayout_free_sp(struct mtd_info *mtd, int section,
 +				  struct mtd_oob_region *oobregion)
 +{
 +	if (section > 1)
 +		return -ERANGE;
  
 -static struct nand_ecclayout nand_oob_128 = {
 -	.eccbytes = 48,
 -	.eccpos = {
 -		   80, 81, 82, 83, 84, 85, 86, 87,
 -		   88, 89, 90, 91, 92, 93, 94, 95,
 -		   96, 97, 98, 99, 100, 101, 102, 103,
 -		   104, 105, 106, 107, 108, 109, 110, 111,
 -		   112, 113, 114, 115, 116, 117, 118, 119,
 -		   120, 121, 122, 123, 124, 125, 126, 127},
 -	.oobfree = {
 -		{.offset = 2,
 -		 .length = 78} }
 +	if (mtd->oobsize == 16) {
 +		if (section)
 +			return -ERANGE;
 +
 +		oobregion->length = 8;
 +		oobregion->offset = 8;
 +	} else {
 +		oobregion->length = 2;
 +		if (!section)
 +			oobregion->offset = 3;
 +		else
 +			oobregion->offset = 6;
 +	}
 +
 +	return 0;
 +}
 +
 +const struct mtd_ooblayout_ops nand_ooblayout_sp_ops = {
 +	.ecc = nand_ooblayout_ecc_sp,
 +	.free = nand_ooblayout_free_sp,
  };
 +EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
  
 -static int nand_get_device(struct mtd_info *mtd, int new_state);
 +static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
 +				 struct mtd_oob_region *oobregion)
 +{
 +	struct nand_chip *chip = mtd_to_nand(mtd);
 +	struct nand_ecc_ctrl *ecc = &chip->ecc;
  
 -static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 -			     struct mtd_oob_ops *ops);
 +	if (section)
 +		return -ERANGE;
 +
 +	oobregion->length = ecc->total;
 +	oobregion->offset = mtd->oobsize - oobregion->length;
 +
 +	return 0;
 +}
 +
 +static int nand_ooblayout_free_lp(struct mtd_info *mtd, int section,
 +				  struct mtd_oob_region *oobregion)
 +{
 +	struct nand_chip *chip = mtd_to_nand(mtd);
 +	struct nand_ecc_ctrl *ecc = &chip->ecc;
 +
 +	if (section)
 +		return -ERANGE;
 +
 +	oobregion->length = mtd->oobsize - ecc->total - 2;
 +	oobregion->offset = 2;
 +
 +	return 0;
 +}
 +
 +const struct mtd_ooblayout_ops nand_ooblayout_lp_ops = {
 +	.ecc = nand_ooblayout_ecc_lp,
 +	.free = nand_ooblayout_free_lp,
 +};
 +EXPORT_SYMBOL_GPL(nand_ooblayout_lp_ops);
  
  static int check_offs_len(struct mtd_info *mtd,
  					loff_t ofs, uint64_t len)
