From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Sat, 9 May 2009 06:51:35 -0700
Message-ID: <20090509135135.GA17349@kroah.com>
References: <20090504162542.41b1cb57.sfr@canb.auug.org.au> <20090509211611.35504c97.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:32824 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753722AbZEINzO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 9 May 2009 09:55:14 -0400
Content-Disposition: inline
In-Reply-To: <20090509211611.35504c97.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Sat, May 09, 2009 at 09:16:11PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 4 May 2009 16:25:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > drivers/hid/usbhid/hiddev.c:965: error: unknown field 'nodename' specified in initializer
> > drivers/hid/usbhid/hiddev.c:965: warning: initialization from incompatible pointer type
> > 
> > Caused by commit 5b1e3a40a98ad5a822cb527439cd57dc60a41db9 ("Driver Core:
> > devtmpfs - driver core maintained /dev tmpfs").  As far as I can see the
> > version of this patch in your quilt series currently has never been
> > posted anywhere public ... The diff summaries for the previous and
> > current version of this patch are:
> > 
> > - 18 files changed, 484 insertions(+), 5 deletions(-)
> > + 38 files changed, 599 insertions(+), 11 deletions(-)
> > 
> > Which is a pretty big change for something in linux-next.  So, can we
> > please remove this patch until it has proper review, been tested and has
> > settled down a bit.
> 
> OK, so now I have another new version of this patch (split up as many
> patches) in the driver-core tree (destined for linux-next) which has also
> not been posted to LKML (which is where I assumed it would be posted).  I
> think people would like the opportunity to review this stuff.

Yes, it will be sent there, I thought it more important to get my tree
working again and out there, thinking you were not going to be doing a
linux-next release over the weekend.

Was I incorrect in that assumption?

I'll be sending it in a few hours.

thanks,

greg k-h
