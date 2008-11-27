From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Thu, 27 Nov 2008 18:41:08 +1030
Message-ID: <200811271841.08825.rusty@rustcorp.com.au>
References: <20081125174554.dbd84cde.sfr@canb.auug.org.au> <200811252217.37125.rusty@rustcorp.com.au> <200811251336.26864.borntraeger@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42972 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752312AbYK0ILN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Nov 2008 03:11:13 -0500
In-Reply-To: <200811251336.26864.borntraeger@de.ibm.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

On Tuesday 25 November 2008 23:06:26 Christian Borntraeger wrote:
> Am Dienstag, 25. November 2008 schrieb Rusty Russell:
> > > Also, the x86_64 allmodconfig build failed like this:
> > >
> > > ERROR: "hvc_resize" [drivers/char/virtio_console.ko] undefined!
> > >
> > > hvc_resize is currently not exported to modules.
> > >
> > > I have dropped the rr tree again.
> >
> > OK, I've dropped Christian's patch for the moment until he fixes this. 
> > I'm travelling to Sydney for the day so I won't get a chance to fix this
> > if it breaks tomorrow :(
>
> Ok. Sorry about that. allmodconfig on s390 and i386 select VIRTIO_CONSOLE
> as (y) and not as (m), therefore my tests did not trigger this problem. I
> will try to get an x86_64 box to test on in the future.

Thanks, applied.

For future reference I've taken to preferring fixup patches, which I can fold 
later.

Cheers,
Rusty.
