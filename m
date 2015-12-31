From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: linux-next: manual merge of the vhost tree with the tip tree
Date: Thu, 31 Dec 2015 12:25:00 +0200
Message-ID: <20151231121547-mutt-send-email-mst@redhat.com>
References: <20151231202347.3090c74b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47423 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751250AbbLaKZF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2015 05:25:05 -0500
Content-Disposition: inline
In-Reply-To: <20151231202347.3090c74b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>

On Thu, Dec 31, 2015 at 08:23:47PM +1100, Stephen Rothwell wrote:
> Hi Michael,
> 
> Today's linux-next merge of the vhost tree got conflicts in:
> 
>   arch/ia64/include/asm/barrier.h
>   arch/powerpc/include/asm/barrier.h
>   arch/s390/include/asm/barrier.h
>   include/asm-generic/barrier.h
> 
> between commit:
> 
>   d5a73cadf3fd ("lcoking/barriers, arch: Use smp barriers in smp_store_release()")
> 
> from the tip tree and commit:
> 
>   2683de3a1732 ("ia64: reuse asm-generic/barrier.h")
>   d78113bef3e0 ("powerpc: reuse asm-generic/barrier.h")
>   25bc870c914b ("s390: reuse asm-generic/barrier.h")
>   24888a057e97 ("asm-generic: add __smp_XXX wrappers")
> 
> from the vhost tree.

Thanks for letting me know.

I should probably cherry-pick d5a73cadf3fd - this will
make it appear twice in git history, but seems cleaner
than rebasing all of vhost on top of tip.

Is everyone fine with this?

Alternatively, I could submit the virt barriers + virtio patches for
inclusion in tip.

> I fixed it up (in each case taking the vhost tree version) and can
> carry the fix as necessary (no action is required).
> 
> However, given the ongoing review and discussion, I do wonder if these
> vhost tree commits should be in linux-next yet.

So far I got comments from David Miller about the API naming, and I'd
like to get more feedback  - at least from Peter Zijlstra who gave me
the idea.  Otherwise this seems rather like a safe bet, and
this kind of integration issue seems like exactly the kind of thing
linux-next helps figure out.

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
