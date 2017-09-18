From: Christoph Hellwig <hch@lst.de>
Subject: Re: [linux-next][XFS][trinity] WARNING: CPU: 32 PID: 31369 at
        fs/iomap.c:993
Date: Mon, 18 Sep 2017 17:27:06 +0200
Message-ID: <20170918152706.GA11482@lst.de>
References: <1505746565.6990.18.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505746565.6990.18.camel@abdul.in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-xfs <linux-xfs@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@fb.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, chandan <chandan@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Mon, Sep 18, 2017 at 08:26:05PM +0530, Abdul Haleem wrote:
> Hi,
> 
> A warning is triggered from:
> 
> file fs/iomap.c in function iomap_dio_rw
> 
>     if (ret)
>         goto out_free_dio;
> 
>     ret = invalidate_inode_pages2_range(mapping,
>             start >> PAGE_SHIFT, end >> PAGE_SHIFT);
> >>  WARN_ON_ONCE(ret);
>     ret = 0;
> 
>     inode_dio_begin(inode);

This is expected and an indication of a problematic workload - which
may be triggered by a fuzzer.
