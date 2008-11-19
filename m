From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Tue, 18 Nov 2008 22:26:44 -0800
Message-ID: <20081119062644.GB4444@kroah.com>
References: <20081119113031.28e2ae68.sfr@canb.auug.org.au> <20081119164317.9bfff78d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:39984 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751181AbYKSGgg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 01:36:36 -0500
Content-Disposition: inline
In-Reply-To: <20081119164317.9bfff78d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Wed, Nov 19, 2008 at 04:43:17PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Wed, 19 Nov 2008 11:30:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I have dropped the driver-core tree (and the usb tree that depends on it)
> > from linux-next for today.
> 
> I had to drop the staging tree as well (since it depends on the usb
> tree), of course.

Right now there is no such dependancy (USB should build and apply just
fine without driver core, and staging depends on neither of these from
what I can see.)

But that's ok, I'll fix up the driver-core tree right now.

thanks,

greg k-h
