From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Mon, 1 Mar 2010 10:42:55 +0100
Message-ID: <20100301094254.GT5768@kernel.dk>
References: <20100301203453.938e4136.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0122700014.0.fullrate.dk ([95.166.99.235]:49118 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751174Ab0CAJm4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Mar 2010 04:42:56 -0500
Content-Disposition: inline
In-Reply-To: <20100301203453.938e4136.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>

On Mon, Mar 01 2010, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/block/ps3vram.c: In function 'ps3vram_probe':
> drivers/block/ps3vram.c:754: error: 'BLK_MAX_HW_SEGMENTS' undeclared (first use in this function)
> 
> Caused by commit 8a78362c4eefc1deddbefe2c7f38aabbc2429d6b ("block:
> Consolidate phys_segment and hw_segment limits") from the block tree.
> 
> I have applied the following patch for today.

Oops, thanks, applied.

-- 
Jens Axboe
