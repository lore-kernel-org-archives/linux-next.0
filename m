From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Wed, 29 Apr 2009 07:15:19 -0700
Message-ID: <20090429141519.GA3112@kroah.com>
References: <20090429171752.f70c7de1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:36086 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751816AbZD2OWr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 10:22:47 -0400
Content-Disposition: inline
In-Reply-To: <20090429171752.f70c7de1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Sarah Sharp <sarah.a.sharp@linux.intel.com>

On Wed, Apr 29, 2009 at 05:17:52PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/usb/built-in.o: In function `.handle_event':
> (.text+0x67dd0): multiple definition of `.handle_event'
> drivers/pcmcia/built-in.o:(.text+0xcfcc): first defined here
> drivers/usb/built-in.o: In function `handle_event':
> (.opd+0x5bc8): multiple definition of `handle_event'
> drivers/pcmcia/built-in.o:(.opd+0xed0): first defined here
> 
> Caused by commit 787747a731389c767e6d437f5f94bdc8169ec968 ("USB: xhci:
> No-op command queueing and irq handler").  handle_event is a bit generic
> for a global symbol (pcmcia should probably be fixed as well).
> 
> [Also, the handle_event routine is tail recursive?]
> [Also, there a a few other global routines in there that may want less
> generic names.]
> [Also, I can't find this large series of patches posted on lkml? Maybe
> more exposure would be good.]

They were all posted on the linux-usb mailing list, as they are a new
USB controller (for USB 3.0), so they didn't need to be sent to lkml.

But yes, the code does still need work, that is known, but a build
failure wasn't known :)

I'll go fix this up, thanks.

greg k-h
