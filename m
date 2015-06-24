From: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Date: Wed, 24 Jun 2015 02:25:12 +0100 (IST)
Message-ID: <alpine.DEB.2.00.1506240224190.13786@skynet.skynet.ie>
References: <20150623115245.2142288e@canb.auug.org.au> <20150624110122.2dcbc338@canb.auug.org.au> <558A0610.7070405@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gir.skynet.ie ([193.1.99.77]:56509 "EHLO gir.skynet.ie"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751871AbbFXBZP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2015 21:25:15 -0400
In-Reply-To: <558A0610.7070405@samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hyungwon Hwang <human.hwang@samsung.com>, Rob Herring <robh+dt@kernel.org>


> > Hi Dave,
> > 
> > On Tue, 23 Jun 2015 11:52:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> After merging the drm-exynos tree, today's linux-next build (x86_64
> >> allmodconfig) failed like this:
> >>
> >> drivers/media/i2c/adv7604.o: In function `of_graph_get_endpoint_by_regs':
> >> adv7604.c:(.text+0x586c): multiple definition of `of_graph_get_endpoint_by_regs'
> >> drivers/media/i2c/adv7343.o:adv7343.c:(.text+0xa13): first defined here
> >> drivers/media/platform/soc_camera/atmel-isi.o: In function `of_graph_get_endpoint_by_regs':
> >> atmel-isi.c:(.text+0x1ec9): multiple definition of `of_graph_get_endpoint_by_regs'
> >> drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0x2ce3): first defined here
> >> drivers/media/platform/soc_camera/rcar_vin.o: In function `of_graph_get_endpoint_by_regs':
> >> rcar_vin.c:(.text+0x307c): multiple definition of `of_graph_get_endpoint_by_regs'
> >> drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0x2ce3): first defined here
> >>
> >> Caused by commit:
> >>
> >>   a0f7001c18ca ("of: add helper for getting endpoint node of specific identifiers")
> > 
> > This failure is now in the drm tree (where above patch is commit
> > 8ccd0d0ca041).  I have used the patch from Inki for today.
> 
> As you know, I posted below patch which fixes the build error,
> 	[PATCH] of: fix a build error to f_graph_get_endpoint_by_regs function
> 
> However, I think we need Acked-by from device tree maintainer to merge
> it to drm-next.
> 

In times like this I usually go with forgivness rather than permission,
also previous Ack's are good enough for me to cover build problems.

I've pushed the fix to drm-next.

Dave.
