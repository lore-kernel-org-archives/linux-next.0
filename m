From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Mon, 19 Sep 2016 15:48:03 +0200
Message-ID: <20160919134803.GA28585@lst.de>
References: <20160919161834.08302d33@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:44090 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758341AbcISNsG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Sep 2016 09:48:06 -0400
Content-Disposition: inline
In-Reply-To: <20160919161834.08302d33@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Thanks Stephen,

the fix looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>


I had actually seen the error earlier, but for the setups I got builbot
results moving the code to this new pci-dependent file fixed it.  I guess
that didn't went far enough.
