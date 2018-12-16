From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
Date: Sun, 16 Dec 2018 11:18:16 +0100
Message-ID: <20181216101816.GA31756@lst.de>
References: <20181216172649.5278d8e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181216172649.5278d8e6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Sun, Dec 16, 2018 at 05:26:49PM +1100, Stephen Rothwell wrote:
> Hi Jens,
> 
> Commit
> 
>   6f7ceaa0559b ("block: remove the bioset_integrity_free export")
> 
> is missing a Signed-off-by from its author.

Ooops.  Jens, in case you still feel ok ammending the tree:

Signed-off-by: Christoph Hellwig <hch@lst.de>
