From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [PATCH -next] block: blk-iopoll sysctl iff CONFIG_BLOCK
Date: Fri, 7 Aug 2009 21:21:44 +0200
Message-ID: <20090807192144.GZ12579@kernel.dk>
References: <20090807183118.e71b4db2.sfr@canb.auug.org.au> <20090807111659.3d8da27f.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:33834 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933046AbZHGTVn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Aug 2009 15:21:43 -0400
Content-Disposition: inline
In-Reply-To: <20090807111659.3d8da27f.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Aug 07 2009, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> New block-iopoll sysctl should be surrounded by CONFIG_BLOCK to
> prevent build error:
> 
> kernel/built-in.o:(.data+0x2990): undefined reference to `blk_iopoll_enabled'

Thanks, I'll just kill off this sysctl, it should be driver controller
anyway. Was just easier for testing :-)

-- 
Jens Axboe
