From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Tue, 18 May 2010 12:50:00 +0200
Message-ID: <20100518105000.GX25951@kernel.dk>
References: <20100518133710.8b1545dd.sfr@canb.auug.org.au> <20100518085613.GU25951@kernel.dk> <20100518202044.a91d7f64.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0122700014.0.fullrate.dk ([95.166.99.235]:50916 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756380Ab0ERKuD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 May 2010 06:50:03 -0400
Content-Disposition: inline
In-Reply-To: <20100518202044.a91d7f64.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, May 18 2010, Stephen Rothwell wrote:
> On Tue, 18 May 2010 10:56:13 +0200 Jens Axboe <jens.axboe@oracle.com> wrote:
> >
> > Thanks, it looks like a merge/commit error on for-next alone, for-2.6.35
> > is fine. I'll make sure this gets fixed up now.
> 
> So why is for-2.6.35 different from for-next?

Because I had a for-linus branch at one point which was headed for
2.6.34 (which has been merged now) which was changed and merged with
for-2.6.35 to form for-next. But now it should just be a copy.

-- 
Jens Axboe
