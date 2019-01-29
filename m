From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: Fixes tag needs some work in the xfs tree
Date: Wed, 30 Jan 2019 09:08:02 +1100
Message-ID: <20190129220802.GC4205@dastard>
References: <20190130075647.53e86078@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190130075647.53e86078@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 30, 2019 at 07:56:47AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   4ea899ead278 ("iomap: fix a use after free in iomap_dio_rw")
> 
> Fixes tag
> 
>   Fixes: ff6a9292e6 ("iomap: implement direct I/O")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long

Might be worth adding this to the boiler plate code:

	This can be fixed by adding the following to your ~/.gitconfig file:

	[core]
		abbrev = 12

Thanks!

-Dave.
-- 
Dave Chinner
david@fromorbit.com
