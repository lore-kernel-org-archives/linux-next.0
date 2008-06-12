From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block merge conflicts
Date: Thu, 12 Jun 2008 15:26:07 +0200
Message-ID: <20080612132606.GM20851@kernel.dk>
References: <20080611184729.978d62d2.sfr@canb.auug.org.au> <20080611195604.GE20851@kernel.dk> <20080612110808.d0815065.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([87.55.233.238]:5476 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758172AbYFLN0J (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 09:26:09 -0400
Content-Disposition: inline
In-Reply-To: <20080612110808.d0815065.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thu, Jun 12 2008, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Wed, 11 Jun 2008 21:56:06 +0200 Jens Axboe <jens.axboe@oracle.com> wrote:
> >
> > No worries, I'll make sure to compile test everything again and send you
> > a note. I had half-expected the move of the arch defines from
> > linux/smp.h to asm/smp.h to cause a problem or two, I'll double check
> > everything.
> > 
> > I'll send you a note tomorrow when things are going.
> 
> OK, thanks.

Should be better now, I didn't find anything besides the ppc screwup.

-- 
Jens Axboe

