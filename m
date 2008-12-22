From: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Subject: Re: linux-next: usb tree build failure
Date: Mon, 22 Dec 2008 15:37:16 -0800
Message-ID: <200812221537.17363.inaky@linux.intel.com>
References: <20081222113335.667c2d01.sfr@canb.auug.org.au> <200812220926.43784.inaky@linux.intel.com> <20081222175336.GA22701@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:45283 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754442AbYLVXjj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 18:39:39 -0500
In-Reply-To: <20081222175336.GA22701@uranus.ravnborg.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

On Monday 22 December 2008, Sam Ravnborg wrote:
> On Mon, Dec 22, 2008 at 09:26:43AM -0800, Inaky Perez-Gonzalez wrote:
> > On Sunday 21 December 2008, Sam Ravnborg wrote:
> > > On Mon, Dec 22, 2008 at 01:42:21PM +1100, Stephen Rothwell wrote:
> > > > (Just cc'ing Sam)
> > > >
> > > > On Sun, 21 Dec 2008 17:31:10 -0800 Greg KH <greg@kroah.com> wrote:
> > > > > On Mon, Dec 22, 2008 at 11:33:35AM +1100, Stephen Rothwell wrote:
> > > > > > Hi Greg,
> > > > > >
> > > > > > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > > > > >
> > > > > > x86_64-linux-ld: drivers/net/wimax/built-in.o: No such file: No
> > > > > > such file or directory
> > > > > >
....
> > > diff --git a/drivers/net/wimax/Makefile b/drivers/net/wimax/Makefile
> > > new file mode 100644
> > > index 0000000..bda9430
> > > --- /dev/null
> > > +++ b/drivers/net/wimax/Makefile
> > > @@ -0,0 +1,2 @@
> > > +
> > > +obj-$(CONFIG_WIMAX_I2400M)	+= i2400m/
> > >
> > >
> > >
> > > But the problem here is that because we do not even pretend to
> > > build some files in this dir thus kbuild does not create build-in.o
> > >
> > > The fix is a bit ugly but simple. Add a dummy statement to
> > > the drivers/net/wimax/Makefile like this:
> > >
> > > # force kbuild to create built-in.o
> > > obj- := dummy.o
> >
> > ops -- ok, I will. I guess I have to add this in all the similar ones,
> > right?
>
> You need this in all cases where you have a Makefile that
> only specify sub directories. I assume thilinux-wimax.git/s is the only 
Makefile
> where you have this.

It is -- I've been trying to reproduce it in the current tree I had and I 
can't get to do it. In any case, I'll leave the workaround in.

Thanks,

-- 
Inaky
