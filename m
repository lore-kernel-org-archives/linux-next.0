From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the block tree
Date: Tue, 4 Oct 2011 08:25:43 -0700
Message-ID: <20111004152543.GB29994@kroah.com>
References: <20111004171415.db52e4eb5c913afeba0a3bee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111004171415.db52e4eb5c913afeba0a3bee@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Jens Axboe <jaxboe@fusionio.com>, Jerome Marchand <jmarchan@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 04, 2011 at 05:14:15PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/zram/zram_drv.c between commit 5a7bbad27a41 ("block:
> remove support for bio remapping from ->make_request") from the block
> tree and commit 0900beae178a ("staging: zram: fix zram locking") from the
> staging tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.

That looks correct to me, thanks for doing this.

greg k-h
