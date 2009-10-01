From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next:  tree build failure
Date: Thu, 1 Oct 2009 09:58:38 +0200
Message-ID: <20091001075838.GL14918@kernel.dk>
References: <20091001131923.83e6836c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:60481 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755719AbZJAH6f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Oct 2009 03:58:35 -0400
Content-Disposition: inline
In-Reply-To: <20091001131923.83e6836c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zdenek Kabelac <zdenek.kabelac@gmail.com>, Li Zefan <lizf@cn.fujitsu.com>

On Thu, Oct 01 2009, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next build (powerpc allnoconfig) failed like this:
> 
> include/linux/blktrace_api.h:215:40: error: macro parameters must be comma-separated
> 
> Caused by commit 1e03edf3b5b16f7f30fa1e397cc9a130305fa8d3 ("Add missing
> blk_trace_remove_sysfs to be in pair with blk_trace_init_sysfs") from the
> block tree.  Half way between a static inline and a macro ...

Sorry Stephen, fixed up.

-- 
Jens Axboe
