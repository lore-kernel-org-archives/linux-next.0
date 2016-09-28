From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Wed, 28 Sep 2016 11:43:48 +1000
Message-ID: <20160928114348.2832fe46@canb.auug.org.au>
References: <20160927112334.3615159e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54137 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933675AbcI1Bnv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Sep 2016 21:43:51 -0400
In-Reply-To: <20160927112334.3615159e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, Oleg Drokin <oleg.drokin@intel.com>, Andreas Dilger <andreas.dilger@intel.com>

Hi Stephen,

On Tue, 27 Sep 2016 11:23:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Doug,
> 
> After merging the rdma tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kiblnd_hdev_setup_mrs':
> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2317:7: error: implicit declaration of function 'ib_get_dma_mr' [-Werror=implicit-function-declaration]
>   mr = ib_get_dma_mr(hdev->ibh_pd, acflags);
>        ^
> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2317:5: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>   mr = ib_get_dma_mr(hdev->ibh_pd, acflags);
>      ^
> 
> Caused by commit
> 
>   5ef990f06bd7 ("IB/core: remove ib_get_dma_mr")
> 
> I have used the rdma tree from next-20160923 for today.

As pointed out by Christoph, I should have just disabled the driver in
staging, so today I just applied the patch below.  Doug, that should
probably be applied to the rdma tree so that you don't break Linus'
tree when it gets merged.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 28 Sep 2016 11:35:28 +1000
Subject: [PATCH] starging/lustre: disable LNET infiniband support

Commit 5ef990f06bd7 ("IB/core: remove ib_get_dma_mr") broke the
lustre LNET infiniband support.  Since this is in drivers/staging,
lets just disable it for now until ti can be fixed properly.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/lustre/lnet/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/lustre/lnet/Kconfig b/drivers/staging/lustre/lnet/Kconfig
index 2b5930150cda..13b43278a38d 100644
--- a/drivers/staging/lustre/lnet/Kconfig
+++ b/drivers/staging/lustre/lnet/Kconfig
@@ -35,6 +35,7 @@ config LNET_SELFTEST
 config LNET_XPRT_IB
 	tristate "LNET infiniband support"
 	depends on LNET && INFINIBAND && INFINIBAND_ADDR_TRANS
+	depends on BROKEN
 	default LNET && INFINIBAND
 	help
 	  This option allows the LNET users to use infiniband as an
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
