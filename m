From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: usb tree build failure
Date: Mon, 22 Dec 2008 07:45:42 +0100
Message-ID: <20081222064542.GA24252@uranus.ravnborg.org>
References: <20081222113335.667c2d01.sfr@canb.auug.org.au> <20081222013110.GA28196@kroah.com> <20081222134221.6961bcf6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:45506 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751897AbYLVGoO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Dec 2008 01:44:14 -0500
Content-Disposition: inline
In-Reply-To: <20081222134221.6961bcf6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky@linux.intel.com>

On Mon, Dec 22, 2008 at 01:42:21PM +1100, Stephen Rothwell wrote:
> (Just cc'ing Sam)
> 
> On Sun, 21 Dec 2008 17:31:10 -0800 Greg KH <greg@kroah.com> wrote:
> >
> > On Mon, Dec 22, 2008 at 11:33:35AM +1100, Stephen Rothwell wrote:
> > > Hi Greg,
> > > 
> > > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > > 
> > > x86_64-linux-ld: drivers/net/wimax/built-in.o: No such file: No such file or directory
> > > 
> > > I reverted commit 66aa675719ab82a03a66b75210fd40be6541f8fb ("wimax:
> > > Makefile, Kconfig and docbook linkage for the stack") just to make the
> > > build work.
> > 
> > Inaky, any ideas?  This really looks like a build system error that I
> > ran into with the staging tree in the past.  I had to add a "dummy" file
> > to the empty directory to get it to build properly.
> > 
> > I tried to duplicate the problem with a sample patch, but never could :(

Incidentally I sent some review comments to said patch yesterday
but missed this one.

We have:
diff --git a/drivers/net/wimax/Makefile b/drivers/net/wimax/Makefile
new file mode 100644
index 0000000..bda9430
--- /dev/null
+++ b/drivers/net/wimax/Makefile
@@ -0,0 +1,2 @@
+
+obj-$(CONFIG_WIMAX_I2400M)	+= i2400m/



But the problem here is that because we do not even pretend to
build some files in this dir thus kbuild does not create build-in.o

The fix is a bit ugly but simple. Add a dummy statement to
the drivers/net/wimax/Makefile like this:

# force kbuild to create built-in.o
obj- := dummy.o

	Sam
