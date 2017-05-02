From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the tip tree
Date: Tue, 2 May 2017 15:37:20 +1000
Message-ID: <20170502153720.75ed868e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  drivers/nvdimm/pmem.c

between commit:

  71389703839e ("mm, zone_device: Replace {get, put}_zone_device_page() with a single reference to fix pmem crash")

from the tip tree and commit:

  c1d6e828a35d ("pmem: add dax_operations support")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/nvdimm/pmem.c
index fbc640bf06b0,58db813e7b7b..000000000000
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@@ -232,15 -243,14 +244,19 @@@ static void pmem_release_queue(void *q
  	blk_cleanup_queue(q);
  }
  
 +static void pmem_freeze_queue(void *q)
 +{
 +	blk_freeze_queue_start(q);
 +}
 +
- static void pmem_release_disk(void *disk)
+ static void pmem_release_disk(void *__pmem)
  {
- 	del_gendisk(disk);
- 	put_disk(disk);
+ 	struct pmem_device *pmem = __pmem;
+ 
+ 	kill_dax(pmem->dax_dev);
+ 	put_dax(pmem->dax_dev);
+ 	del_gendisk(pmem->disk);
+ 	put_disk(pmem->disk);
  }
  
  static int pmem_attach_disk(struct device *dev,
