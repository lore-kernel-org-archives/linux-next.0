From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Mon, 22 Dec 2008 20:29:32 -0800
Message-ID: <20081223042932.GD1928@kroah.com>
References: <20081222235936.5971ad15.sfr@canb.auug.org.au> <1229957446.19474.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:44933 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755502AbYLWEtg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 23:49:36 -0500
Content-Disposition: inline
In-Reply-To: <1229957446.19474.19.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark McLoughlin <markmc@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Mon, Dec 22, 2008 at 02:50:46PM +0000, Mark McLoughlin wrote:
> On Mon, 2008-12-22 at 23:59 +1100, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next build (powerpc allnoconfig) failed like this:
> > 
> > drivers/base/core.c: In function '__root_device_register':
> > drivers/base/core.c:1277: error: dereferencing pointer to incomplete type
> > 
> > Caused by bf86dbd2451d1012c2c968a960470e485b869f5b ("driver core: add
> > root_device_register()").  This needs to cope with !CONFIG_MODULES (where
> > struct module is not defined).
> 
> Ouch, my bad.
> 
> > I applied the following patch but only for today because it is too hard
> > to revert the above patch ...
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > http://www.canb.auug.org.au/~sfr/
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 22 Dec 2008 23:50:56 +1100
> > Subject: [PATCH] driver core: fix root_device_register for not CONFIG_MODULES
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/base/core.c |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 6fbdd8b..aa93980 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -1273,6 +1273,7 @@ struct device *__root_device_register(const char *name, struct module *owner)
> >  		return ERR_PTR(err);
> >  	}
> >  
> > +#ifdef CONFIG_MODULE
> >  	if (owner) {
> >  		struct module_kobject *mk = &owner->mkobj;
> >  
> > @@ -1283,6 +1284,7 @@ struct device *__root_device_register(const char *name, struct module *owner)
> >  		}
> >  		root->owner = owner;
> >  	}
> > +#endif
> 
> Yep, looks correct to me ...

Ick, I hate ifdefs...  I'll go fix this up.

thanks,

greg k-h
