From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: manual merge of the block tree with the ext4 tree
Date: Wed, 26 Nov 2014 23:38:26 -0800
Message-ID: <20141127073826.GA4578@infradead.org>
References: <20141127145347.0083c0bc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141127145347.0083c0bc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Nov 27, 2014 at 02:53:47PM +1100, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> fs/fs-writeback.c between commit ef7fdf5e8c87 ("vfs: add support for a
> lazytime mount option")

Mergign that into a branch for linux-next must surely have been a
mistake, as the code isn't anywhere near ready.

I also think it very much should go into through the vfs tree.
