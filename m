From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Thu, 1 Jan 2009 23:26:46 -0800
Message-ID: <20090102072646.GA3569@kroah.com>
References: <20081222235936.5971ad15.sfr@canb.auug.org.au> <1229957446.19474.19.camel@localhost.localdomain> <20081223042932.GD1928@kroah.com> <20081229173444.f6309a51.sfr@canb.auug.org.au> <20081231022803.49de507e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:50091 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751426AbZABH16 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Jan 2009 02:27:58 -0500
Content-Disposition: inline
In-Reply-To: <20081231022803.49de507e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark McLoughlin <markmc@redhat.com>, linux-next@vger.kernel.org

On Wed, Dec 31, 2008 at 02:28:03AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 29 Dec 2008 17:34:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 22 Dec 2008 20:29:32 -0800 Greg KH <greg@kroah.com> wrote:
> > >
> > > On Mon, Dec 22, 2008 at 02:50:46PM +0000, Mark McLoughlin wrote:
> > > > On Mon, 2008-12-22 at 23:59 +1100, Stephen Rothwell wrote:
> > > > > Hi Greg,
> > > > > 
> > > > > Today's linux-next build (powerpc allnoconfig) failed like this:
> > > > > 
> > > > > drivers/base/core.c: In function '__root_device_register':
> > > > > drivers/base/core.c:1277: error: dereferencing pointer to incomplete type
> > > > > 
> > > > > Caused by bf86dbd2451d1012c2c968a960470e485b869f5b ("driver core: add
> > > > > root_device_register()").  This needs to cope with !CONFIG_MODULES (where
> > > > > struct module is not defined).
> > > > 
> > > > Ouch, my bad.
> > > > 
> > > > > I applied the following patch but only for today because it is too hard
> > > > > to revert the above patch ...
> > > > > 
> > > 
> > > Ick, I hate ifdefs...  I'll go fix this up.
> > 
> > Its still there today.  Lucky for you I didn't notice early enough to
> > drop the driver-core tree :-).  I will reapply my patch.
> 
> Today I dropped the driver-core tree (and the usb and staging trees that
> depend on it).

Ugh, very sorry about this, I forgot to push the changes up to the
kernel.org servers after I made them.

Should be there now, thanks for your patience,

greg k-h
