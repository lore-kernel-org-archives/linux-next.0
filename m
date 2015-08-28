From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with Linus' tree
Date: Fri, 28 Aug 2015 16:15:58 +1000
Message-ID: <20150828161558.29184e3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51626 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751005AbbH1GP7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 28 Aug 2015 02:15:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ross Zwisler <ross.zwisler@linux.intel.com>

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  drivers/acpi/nfit.c

between commit:

  de4a196c02a2 ("nfit, nd_blk: BLK status register is only 32 bits")

from Linus' tree and commit:

  67a3e8fe9015 ("nd_blk: change aperture mapping from WC to WB")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/acpi/nfit.c
index bb29e56276bd,82d07e8fda00..000000000000
--- a/drivers/acpi/nfit.c
+++ b/drivers/acpi/nfit.c
@@@ -1032,7 -1017,7 +1017,7 @@@ static u32 read_blk_stat(struct nfit_bl
  	if (mmio->num_lines)
  		offset = to_interleave_offset(offset, mmio);
  
- 	return readl(mmio->base + offset);
 -	return readq(mmio->addr.base + offset);
++	return readl(mmio->addr.base + offset);
  }
  
  static void write_blk_ctl(struct nfit_blk *nfit_blk, unsigned int bw,
