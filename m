From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Fri, 7 Nov 2008 21:08:53 -0800
Message-ID: <20081108050853.GA10926@kroah.com>
References: <20081107143046.7b2b171a.sfr@canb.auug.org.au> <1226079837.11596.19.camel@brick> <20081108095950.259305aa.sfr@canb.auug.org.au> <20081108030535.GA14802@uranus.ravnborg.org> <20081108043816.GB10465@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:47947 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750916AbYKHFQL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 8 Nov 2008 00:16:11 -0500
Content-Disposition: inline
In-Reply-To: <20081108043816.GB10465@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Harvey Harrison <harvey.harrison@gmail.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>

On Fri, Nov 07, 2008 at 08:38:16PM -0800, Greg KH wrote:
> On Sat, Nov 08, 2008 at 04:05:35AM +0100, Sam Ravnborg wrote:
> > On Sat, Nov 08, 2008 at 09:59:50AM +1100, Stephen Rothwell wrote:
> > > Hi Harvey,
> > > 
> > > On Fri, 07 Nov 2008 09:43:57 -0800 Harvey Harrison <harvey.harrison@gmail.com> wrote:
> > > >
> > > > Is it really fair to drop the v4l tree when it was -staging that broke?  I'd humbly
> > > > suggest that staging be weighted somewhat lower than the other trees.
> > > 
> > > There is no staging tree in linux-next, that driver is in Linus' tree.  I
> > > agree that if there was a staging tree, it would be much lower priority.
> > > 
> > > Maybe we need some way to exclude the staging directory from
> > > all{yes,mod}config builds ...
> > 
> > That is simple to do. Something like:
> > 
> > config STAGING_EXCLUDE_BUILD
> > 	bool "Exclude Staging from the build"
> > 
> > 
> > And test for this in the Staging Makefile
> > 
> > When this is set to 'y' then we will not build
> > the staging tree.
> 
> While that would work, it does seem odd to be asked two things:
>   "Staging drivers (y/N)"
> if Y is chosen, they then get asked:
>   "Exclude Staging from the build? (Y/n)"
> 
> It's like, "are you sure you really want to build this part of the
> tree?"  If that would make people's lives easier, I have no objection to
> it, it's just kind of funny :)
> 
> Stephen, what do you think?

In thinking about it a bit more, I kind of like it.  So here's the patch
I just added to the staging tree:

---
 drivers/staging/Kconfig |   20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -21,7 +21,23 @@ menuconfig STAGING
 
 	  If in doubt, say N here.
 
-if STAGING
+
+config STAGING_EXCLUDE_BUILD
+	bool "Exclude Staging drivers from being built"
+	default y
+	---help---
+	  Are you sure you really want to build the staging drivers?
+	  They taint your kernel, don't live up to the normal Linux
+	  kernel quality standards, are a bit crufty around the edges,
+	  and might go off and kick your dog when you aren't paying
+	  attention.
+
+	  Say N here to be able to select and build the Staging drivers.
+	  This option is primarily here to prevent them from being built
+	  when selecting 'make allyesconfg' and 'make allmodconfig' so
+	  don't be all that put off, your dog will be just fine.
+
+if !STAGING_EXCLUDE_BUILD
 
 source "drivers/staging/et131x/Kconfig"
 
@@ -59,4 +75,4 @@ source "drivers/staging/comedi/Kconfig"
 
 source "drivers/staging/asus_oled/Kconfig"
 
-endif # STAGING
+endif # !STAGING_EXCLUDE_BUILD
