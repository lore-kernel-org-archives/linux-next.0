From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the mmc tree with the block tree
Date: Tue, 29 Nov 2016 10:16:32 +0100
Message-ID: <20161129091632.GA6527@lst.de>
References: <20161128131211.55f096b8@canb.auug.org.au> <CAPDyKFrRFOhaQPedRO_2BSinA=cWTza2tHAnP7oPFGKzW5E2Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:58878 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756513AbcK2JQe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Nov 2016 04:16:34 -0500
Content-Disposition: inline
In-Reply-To: <CAPDyKFrRFOhaQPedRO_2BSinA=cWTza2tHAnP7oPFGKzW5E2Wg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@fb.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Tue, Nov 29, 2016 at 10:13:59AM +0100, Ulf Hansson wrote:
> Jens, Christoph, I believe I said this before; could you please make
> sure patches for mmc also becomes cc:ed to me?
> Don't get me wrong, I have no problem you carrying changes for mmc,
> especially clean-ups like this one, but it just be nice to be aware of
> what goes on.

I'm not going to Cc every driver maintainer on trivial tree-wide
cleanups.  As the maintainer of a block driver you should be subscribed
to the linux-block mailing list where every block patch is discussed.
