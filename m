From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: next: Build failure in drivers/s390/block/dcssblk.c due to 'dax:
 enable dax ...'
Date: Wed, 18 May 2016 15:11:55 -0700
Message-ID: <20160518221155.GA1759@roeck-us.net>
References: <573C6E68.4060209@roeck-us.net>
 <20160518183256.GB24738@omniknight.lm.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48909 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751142AbcERWMO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 May 2016 18:12:14 -0400
Content-Disposition: inline
In-Reply-To: <20160518183256.GB24738@omniknight.lm.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Dan Williams <dan.j.williams@intel.com>

On Wed, May 18, 2016 at 12:32:56PM -0600, Vishal Verma wrote:
> On Wed, May 18, 2016 at 06:30:16AM -0700, Guenter Roeck wrote:
> > drivers/s390/block/dcssblk.c:43:2: warning: initialization from incompatible pointer type [enabled by default]
> > drivers/s390/block/dcssblk.c:43:2: warning: (near initialization for 'dcssblk_devops.direct_access') [enabled by default]
> > drivers/s390/block/dcssblk.c:886:1: error: conflicting types for 'dcssblk_direct_access'
> > drivers/s390/block/dcssblk.c:33:13: note: previous declaration of 'dcssblk_direct_access' was here
> > drivers/s390/block/dcssblk.c:33:13: warning: 'dcssblk_direct_access' used but never defined [enabled by default]
> > drivers/s390/block/dcssblk.c:886:1: warning: 'dcssblk_direct_access' defined but not used [-Wunused-function]
> > scripts/Makefile.build:295: recipe for target 'drivers/s390/block/dcssblk.o' failed
> > make[2]: *** [drivers/s390/block/dcssblk.o] Error 1
> > 
> > Bisect points to commit 2b954df309078 ("dax: enable dax in the presence of known media errors (badblocks)".
> > Bisect log is attached.
> > 
> > Guenter
> > 
> Hi Guenter,
> 
> Thanks for the report.
> The following incremental patch should fix the problem. I'll fold it in

Yes, it does.

Guenter

> to dax-misc (to prevent the bisect regression), and it should get picked
> by -next in the next build.
> 	-Vishal
> 
> 
> 8<-----
> 
> From 56f2a2a270b853263704d5b8fa6a6a898fe313ca Mon Sep 17 00:00:00 2001
> From: Vishal Verma <vishal.l.verma@intel.com>
> Date: Wed, 18 May 2016 12:12:23 -0600
> Subject: [PATCH] dcssblk: fix the direct_access prototype to add 'size'
> 
> Fixes 2b954df309078 dax: enable dax in the presence of known media
> errors (badblocks)
> 
> When 'size' was added to the direct_access arguments, I neglected to
> update the prototype declaration for dcssblk.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/s390/block/dcssblk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
> index c45d538..bed53c4 100644
> --- a/drivers/s390/block/dcssblk.c
> +++ b/drivers/s390/block/dcssblk.c
> @@ -31,7 +31,7 @@ static void dcssblk_release(struct gendisk *disk, fmode_t mode);
>  static blk_qc_t dcssblk_make_request(struct request_queue *q,
>  						struct bio *bio);
>  static long dcssblk_direct_access(struct block_device *bdev, sector_t secnum,
> -			 void __pmem **kaddr, pfn_t *pfn);
> +			 void __pmem **kaddr, pfn_t *pfn, long size);
>  
>  static char dcssblk_segments[DCSSBLK_PARM_LEN] = "\0";
>  
> -- 
> 2.5.5
> 
