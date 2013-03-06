From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Thu, 7 Mar 2013 06:11:19 +0800
Message-ID: <20130306221118.GC1138@kroah.com>
References: <20130306113508.9c868be103b6b140295c548f@canb.auug.org.au>
 <20130306004341.GA28426@kroah.com>
 <20130306135654.GA10760@phenom.dumpdata.com>
 <20130306200444.GA13744@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41700 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753350Ab3CFWKt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Mar 2013 17:10:49 -0500
Content-Disposition: inline
In-Reply-To: <20130306200444.GA13744@phenom.dumpdata.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 06, 2013 at 03:04:44PM -0500, Konrad Rzeszutek Wilk wrote:
> On Wed, Mar 06, 2013 at 08:56:54AM -0500, Konrad Rzeszutek Wilk wrote:
> > On Wed, Mar 06, 2013 at 08:43:41AM +0800, Greg KH wrote:
> > > On Wed, Mar 06, 2013 at 11:35:08AM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > After merging the final tree, today's linux-next build (powerpc
> > > > allyesconfig) failed like this:
> > > > 
> > > > In file included from drivers/staging/zcache/debug.c:2:0:
> > > > drivers/staging/zcache/debug.h: In function 'dec_zcache_obj_count':
> > > > drivers/staging/zcache/debug.h:16:2: error: implicit declaration of function 'BUG_ON' [-Werror=implicit-function-declaration]
> > > > 
> > > > Caused by commit 95bdaee2140e ("zcache: Move debugfs code out of
> > > > zcache-main.c file").
> > > > 
> > > > I applied this patch for today:
> > > > 
> > > > From 24b03cf426007c4e94c6bed81560e436afcc136c Mon Sep 17 00:00:00 2001
> > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Date: Wed, 6 Mar 2013 11:31:06 +1100
> > > > Subject: [PATCH] disable ZCACHE_DEBUG due to build error
> > > > 
> > > > In file included from drivers/staging/zcache/debug.c:2:0:
> > > > drivers/staging/zcache/debug.h: In function 'dec_zcache_obj_count':
> > > > drivers/staging/zcache/debug.h:16:2: error: implicit declaration of function 'BUG_ON' [-Werror=implicit-function-declaration]
> > > > 
> > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > ---
> > > >  drivers/staging/zcache/Kconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > 
> > > Ick, sorry about that, I've applied your patch to my tree.
> > 
> > Wait, there is no BUG_ON on PPC? Or is the definition for it hidden in layers
> > of #include files? Would this also solve it:
> 
> I got the cross-compiler up and the patch below does indeed solve the problem.
> Greg, could you apply the patch below please?

What patch?  I don't see a proper Subject:, Signed-off-by: or anything
else I can use.

> > diff --git a/drivers/staging/zcache/debug.h b/drivers/staging/zcache/debug.h
> > index eef67db..494cea02 100644
> > --- a/drivers/staging/zcache/debug.h
> > +++ b/drivers/staging/zcache/debug.h
> > @@ -1,5 +1,7 @@
> >  #ifdef CONFIG_ZCACHE_DEBUG
> >  
> > +#include <asm/bug.h>

Never include an asm .h file, you know better than that :)

greg k-h
