From: Lars Ellenberg <lars.ellenberg-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: block tree build failure
Date: Wed, 23 Sep 2009 13:12:25 +0200
Message-ID: <20090923111225.GC8000@barkeeper1-xen.linbit>
References: <20090923145100.1917fdd8.sfr@canb.auug.org.au>
	<20090923071152.GA8000@barkeeper1-xen.linbit>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090923071152.GA8000-pI6ZZpWkm2Ob3Om96lsyHpni2hclXnRB@public.gmane.org>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>, dr
List-Id: linux-next.vger.kernel.org

On Wed, Sep 23, 2009 at 09:11:52AM +0200, Lars Ellenberg wrote:
> On Wed, Sep 23, 2009 at 02:51:00PM +1000, Stephen Rothwell wrote:
> > Hi Jens,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/block/drbd/drbd_tracing.c:29:26: error: linux/marker.h: No such file or directory
> > 
> > Caused by commit 95eaef1cbc63f73df4ff8559dd66b1d29b462535 ("Replaced our
> > own tracing stuff with Linux's tracepoints") from the block/drbd trees
> > interacting with commit fc5377668c3d808e1d53c4aee152c836f55c3490
> > ("tracing: Remove markers") from Linus' tree.
> > 
> > I have no idea what the correct thing to do is here, so I have reverted
> > the merge of the drbd tree into the block tree and will have to drop the
> > drbd tree for today.
> 
> We'll have a look.

Sorry that it took me so long to have that look.
We can simply drop that include, we don't even use it.

diff --git a/drivers/block/drbd/drbd_tracing.c
b/drivers/block/drbd/drbd_tracing.c
index aefe986..d18d4f7 100644
--- a/drivers/block/drbd/drbd_tracing.c
+++ b/drivers/block/drbd/drbd_tracing.c
@@ -26,7 +26,6 @@
 #include <linux/module.h>
 #include <linux/drbd.h>
 #include <linux/ctype.h>
-#include <linux/marker.h>
 #include "drbd_int.h"
 #include "drbd_tracing.h"
 #include <linux/drbd_tag_magic.h>


Will be visible in our tree shortly.
Thanks,

	Lars
