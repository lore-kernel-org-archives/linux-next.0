From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 29 Apr 2010 09:31:04 +0200
Message-ID: <20100429073104.GE27497@kernel.dk>
References: <20100429135211.3ef89aa3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0122700014.0.fullrate.dk ([95.166.99.235]:35489 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758056Ab0D3Qz2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 Apr 2010 12:55:28 -0400
Content-Disposition: inline
In-Reply-To: <20100429135211.3ef89aa3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Monakhov <dmonakhov@openvz.org>, Jiro SEKIBA <jir@unicus.jp>, Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>

On Thu, Apr 29 2010, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (powerpc ppc64_defconfig)
> failed like this:
> 
> fs/nilfs2/the_nilfs.c: In function 'nilfs_discard_segments':
> fs/nilfs2/the_nilfs.c:673: error: 'DISCARD_FL_BARRIER' undeclared (first use in this function)
> 
> Caused by commit fbd9b09a177a481eda256447c881f014f29034fe ("blkdev:
> generalize flags for blkdev_issue_fn functions") interacting with commit
> e902ec9906e844f4613fa6190c6fa65f162dc86e ("nilfs2: issue discard request
> after cleaning segments") (which netered Linus' tree on about March 4 -
> before v2.6.34-rc1).
> 
> I applied the following patch for today (but have no way to test it).

It's correct, I'll merge this.

-- 
Jens Axboe
