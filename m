From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the l2-mtd tree with the mtd tree
Date: Tue, 5 Jan 2016 13:05:18 +1100
Message-ID: <20160105130518.2c06c514@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35438 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753791AbcAECFT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Jan 2016 21:05:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Brian,

Today's linux-next merge of the l2-mtd tree got a conflict in:

  drivers/mtd/mtdcore.c

between commit:

  472b444eef93 ("mtd: fix cmdlinepart parser, early naming for auto-filled MTD")

from the mtd tree and commit:

  07fd2f871c5e ("mtd: partitions: pass around 'mtd_partitions' wrapper struct")

from the l2-mtd tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/mtd/mtdcore.c
index ffa288474820,89d811e7b04a..000000000000
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@@ -590,22 -589,20 +595,22 @@@ int mtd_device_parse_register(struct mt
  			      const struct mtd_partition *parts,
  			      int nr_parts)
  {
+ 	struct mtd_partitions parsed;
  	int ret;
- 	struct mtd_partition *real_parts = NULL;
  
 +	mtd_set_dev_defaults(mtd);
 +
- 	ret = parse_mtd_partitions(mtd, types, &real_parts, parser_data);
- 	if (ret <= 0 && nr_parts && parts) {
- 		real_parts = kmemdup(parts, sizeof(*parts) * nr_parts,
- 				     GFP_KERNEL);
- 		if (!real_parts)
- 			ret = -ENOMEM;
- 		else
- 			ret = nr_parts;
- 	}
- 	/* Didn't come up with either parsed OR fallback partitions */
- 	if (ret < 0) {
+ 	memset(&parsed, 0, sizeof(parsed));
+ 
+ 	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
+ 	if ((ret < 0 || parsed.nr_parts == 0) && parts && nr_parts) {
+ 		/* Fall back to driver-provided partitions */
+ 		parsed = (struct mtd_partitions){
+ 			.parts		= parts,
+ 			.nr_parts	= nr_parts,
+ 		};
+ 	} else if (ret < 0) {
+ 		/* Didn't come up with parsed OR fallback partitions */
  		pr_info("mtd: failed to find partitions; one or more parsers reports errors (%d)\n",
  			ret);
  		/* Don't abort on errors; we can still use unpartitioned MTD */
