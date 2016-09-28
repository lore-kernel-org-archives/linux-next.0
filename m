From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Wed, 28 Sep 2016 17:23:39 +0200
Message-ID: <20160928152339.GA1098@kroah.com>
References: <20160927112334.3615159e@canb.auug.org.au>
 <20160928114348.2832fe46@canb.auug.org.au>
 <57EBDAFB.9060204@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47399 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932591AbcI1PXg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Sep 2016 11:23:36 -0400
Content-Disposition: inline
In-Reply-To: <57EBDAFB.9060204@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Oleg Drokin <oleg.drokin@intel.com>, Andreas Dilger <andreas.dilger@intel.com>

On Wed, Sep 28, 2016 at 11:00:11AM -0400, Doug Ledford wrote:
> On 9/27/16 9:43 PM, Stephen Rothwell wrote:
> > Hi Stephen,
> > 
> > On Tue, 27 Sep 2016 11:23:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> Hi Doug,
> >>
> >> After merging the rdma tree, today's linux-next build (x86_64
> >> allmodconfig) failed like this:
> >>
> >> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kiblnd_hdev_setup_mrs':
> >> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2317:7: error: implicit declaration of function 'ib_get_dma_mr' [-Werror=implicit-function-declaration]
> >>   mr = ib_get_dma_mr(hdev->ibh_pd, acflags);
> >>        ^
> >> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2317:5: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
> >>   mr = ib_get_dma_mr(hdev->ibh_pd, acflags);
> >>      ^
> >>
> >> Caused by commit
> >>
> >>   5ef990f06bd7 ("IB/core: remove ib_get_dma_mr")
> >>
> >> I have used the rdma tree from next-20160923 for today.
> > 
> > As pointed out by Christoph, I should have just disabled the driver in
> > staging, so today I just applied the patch below.  Doug, that should
> > probably be applied to the rdma tree so that you don't break Linus'
> > tree when it gets merged.
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 28 Sep 2016 11:35:28 +1000
> > Subject: [PATCH] starging/lustre: disable LNET infiniband support
> > 
> > Commit 5ef990f06bd7 ("IB/core: remove ib_get_dma_mr") broke the
> > lustre LNET infiniband support.  Since this is in drivers/staging,
> > lets just disable it for now until ti can be fixed properly.
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/staging/lustre/lnet/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/staging/lustre/lnet/Kconfig b/drivers/staging/lustre/lnet/Kconfig
> > index 2b5930150cda..13b43278a38d 100644
> > --- a/drivers/staging/lustre/lnet/Kconfig
> > +++ b/drivers/staging/lustre/lnet/Kconfig
> > @@ -35,6 +35,7 @@ config LNET_SELFTEST
> >  config LNET_XPRT_IB
> >  	tristate "LNET infiniband support"
> >  	depends on LNET && INFINIBAND && INFINIBAND_ADDR_TRANS
> > +	depends on BROKEN
> >  	default LNET && INFINIBAND
> >  	help
> >  	  This option allows the LNET users to use infiniband as an
> > 
> 
> That doesn't seem like a particularly good thing to put in.  Wouldn't
> you end up just reverting it later when they fix lustre?  And are you
> going to revert the revert when it breaks again and revert the revert of
> the revert when it's fixed again?

Yup :)

Well, in reality just keep adding and removing the line without dealing
with reverts, much simpler...

> That just seems a lot of churn.  I
> thought it was generally accepted that things in staging might or might
> not work and if they don't, we don't care?  Am I wrong on that?

Nope, you are not wrong, but it is nice to not break some people's
builds if it's possible.

thanks,

greg k-h
