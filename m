From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: spinlock lockup with next-20081118 on powerpc
Date: Wed, 19 Nov 2008 15:37:37 +0100
Message-ID: <20081119143736.GJ26308@kernel.dk>
References: <20081119093023.48895b84.sfr@canb.auug.org.au> <20081119091628.GT26308@kernel.dk> <20081119203922.0412c041.sfr@canb.auug.org.au> <20081119094300.GW26308@kernel.dk> <20081119213304.d2d21042.sfr@canb.auug.org.au> <20081119105833.GZ26308@kernel.dk> <20081120003224.8d0f481c.sfr@canb.auug.org.au> <20081119133408.GE26308@kernel.dk> <20081120013552.587f8928.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:38067 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753071AbYKSOjZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 09:39:25 -0500
Content-Disposition: inline
In-Reply-To: <20081120013552.587f8928.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: ppc-dev <linuxppc-dev@ozlabs.org>, linux-next@vger.kernel.org

On Thu, Nov 20 2008, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Wed, 19 Nov 2008 14:34:09 +0100 Jens Axboe <jens.axboe@oracle.com> wrote:
> >
> > Are you removing devices or modules? We have a bug there it seems, does
> > this help?
> 
> This is early in boot (we are waiting for the root device while running
> on the initramfs) so there could well be modules being unloaded.
> 
> That patch makes the problem go away.

Excellent, since it was an apparent but, I already updated the original
patch with this hunk.

Thanks a lot for your bisection work, Stephen!

-- 
Jens Axboe
