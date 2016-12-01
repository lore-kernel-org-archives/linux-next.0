From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 1 Dec 2016 14:02:43 +1100
Message-ID: <20161201140243.2554a006@canb.auug.org.au>
References: <20161201135517.273c9a4d@canb.auug.org.au>
        <be0dd730-037a-2f42-489a-2a1fc90c8932@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <be0dd730-037a-2f42-489a-2a1fc90c8932@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: David Chinner <david@fromorbit.com>, xfs@oss.sgi.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Jens,

On Wed, 30 Nov 2016 20:00:36 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 11/30/2016 07:55 PM, Stephen Rothwell wrote:
> > 
> > I love APIs changing :-(  
> 
> It's a necessary evil...

Yeah

> This could have been avoided with the XFS tree pulling in the block
> changes, but that obviously has other implications. Something to watch
> for when the XFS tree is sent in for the merge window, however.

Indeed.  Or the block tree, which ever comes last.

> > I have applied the following merge fix patch for today.  
> 
> The fix is correct.

Thanks.

-- 
Cheers,
Stephen Rothwell
