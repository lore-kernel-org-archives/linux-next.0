From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Tue, 18 Nov 2008 22:36:53 -0800
Message-ID: <20081119063653.GA4620@kroah.com>
References: <20081119113031.28e2ae68.sfr@canb.auug.org.au> <ac3eb2510811181640r6c864c7en28a097d3e7c1ab75@mail.gmail.com> <20081119132214.681066b4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:51997 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751309AbYKSGnc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 01:43:32 -0500
Content-Disposition: inline
In-Reply-To: <20081119132214.681066b4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kay Sievers <kay.sievers@vrfy.org>, linux-next@vger.kernel.org

On Wed, Nov 19, 2008 at 01:22:14PM +1100, Stephen Rothwell wrote:
> Hi Kay,
> 
> [Firstly, let me say that I appreciate all the work you are doing ...]
> 
> On Wed, 19 Nov 2008 01:40:42 +0100 "Kay Sievers" <kay.sievers@vrfy.org> wrote:
> >
> > Is this the only one, or only the first failure you've seen with the
> > driver-core tree? Some of the patches we've been unable to test, and
> > unfortunately the maintainers didn't respond for weeks now.
> 
> It is the first since that series of patches was added to the
> driver-core tree yesterday, but I have only built for powerpc and x86_64
> so far.
> 
> The patch had a CC for Paul Mackerras but not for the list associated
> with the PowerPC archiecture (in MAINTAINERS - linuxppc-dev@ozlabs.org).
> Some maintainers are very busy and cannot (or don't) test every single
> patch sent to them but the patches would probably would receive more
> attention if CC'd to the associated list.  [I am on the particular list
> and didn't see that patch posted.]
> 
> [And the Acked-by: Geoff Levand would really only cover the ps3 part of
> the patch.]
> 
> In any case, I assume it will be fixed tomorrow in Greg's tree.

Now fixed.

thanks,

greg k-h
