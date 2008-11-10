From: malahal@us.ibm.com
Subject: Re: linux-next: block tree build failure
Date: Sun, 9 Nov 2008 20:13:52 -0800
Message-ID: <20081110041352.GA2935@us.ibm.com>
References: <20081110145442.d60e57b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e5.ny.us.ibm.com ([32.97.182.145]:60527 "EHLO e5.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752620AbYKJENz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 Nov 2008 23:13:55 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id mAA4Dsul016735
	for <linux-next@vger.kernel.org>; Sun, 9 Nov 2008 23:13:54 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mAA4DsW5112278
	for <linux-next@vger.kernel.org>; Sun, 9 Nov 2008 23:13:54 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mAA4DrU5023781
	for <linux-next@vger.kernel.org>; Sun, 9 Nov 2008 23:13:54 -0500
Content-Disposition: inline
In-Reply-To: <20081110145442.d60e57b7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org

The original patch is split into two commits and Jen missed to change
'next_set' to 'next' in the first commit! Just changing the 'next_set'
to 'next' should work. I will send a patch very soon.

--Malahal.

Stephen Rothwell [sfr@canb.auug.org.au] wrote:
> Hi Jens,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> block/blk-timeout.c: In function 'blk_rq_timed_out_timer':
> block/blk-timeout.c:140: error: 'next_set' undeclared (first use in this function)
> 
> Caused by commit 66f067c93b0eefc8613fd7a91cd6853e2bf48806 ("block:
> optimizations in blk_rq_timed_out_timer()").  Clearly not even
> compiled ...
> 
> I have dropped the block tree for today.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
