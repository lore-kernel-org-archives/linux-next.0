From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Fri, 05 Feb 2010 13:02:38 -0200
Message-ID: <4B6C330E.2020301@infradead.org>
References: <20100205165247.bee325be.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:51294 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933178Ab0BEPCp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Feb 2010 10:02:45 -0500
In-Reply-To: <20100205165247.bee325be.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Benesch <twoof7@freenet.de>, Ralph Metzler <rjkm@metzlerbros.de>, Oliver Endriss <o.endriss@gmx.de>

Stephen Rothwell wrote:
> Hi Mauro,
> 
> After merging the scsi-post-merge tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/media/dvb/ngene/ngene-core.c: In function 'ngene_release_buffers':
> drivers/media/dvb/ngene/ngene-core.c:1443: error: implicit declaration of function 'vfree'
> drivers/media/dvb/ngene/ngene-core.c: In function 'ngene_get_buffers':
> drivers/media/dvb/ngene/ngene-core.c:1454: error: implicit declaration of function 'vmalloc'
> drivers/media/dvb/ngene/ngene-core.c:1454: warning: assignment makes pointer from integer without a cast
> drivers/media/dvb/ngene/ngene-core.c:1461: warning: assignment makes pointer from integer without a cast
> drivers/media/dvb/ngene/ngene-core.c:1467: warning: assignment makes pointer from integer without a cast
> drivers/media/dvb/ngene/ngene-core.c: In function 'ngene_probe':
> drivers/media/dvb/ngene/ngene-core.c:1836: warning: assignment makes pointer from integer without a cast
> 
> Caused by commit b54c755d6263efe376f3dfc8c72c8e7b4fb4f4c1 ("V4L/DVB:
> ngene: Initial check-in").
> 
> I added the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 5 Feb 2010 16:46:47 +1100
> Subject: [PATCH] V4L/DVB: using vmalloc requires include linux/vmalloc.h
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/media/dvb/ngene/ngene-core.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/media/dvb/ngene/ngene-core.c b/drivers/media/dvb/ngene/ngene-core.c
> index ea610e4..cb5982e 100644
> --- a/drivers/media/dvb/ngene/ngene-core.c
> +++ b/drivers/media/dvb/ngene/ngene-core.c
> @@ -41,6 +41,7 @@
>  #include <linux/version.h>
>  #include <linux/byteorder/generic.h>
>  #include <linux/firmware.h>
> +#include <linux/vmalloc.h>
>  
>  #include "ngene.h"
>  
Thanks for the patch. It looks sane to me. I'm adding it on my linux-next tree.

Cheers,
Mauro.

-- 

Cheers,
Mauro
