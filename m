From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block tree build failure
Date: Sat, 5 Dec 2009 10:20:57 +0100
Message-ID: <20091205092057.GE8742@kernel.dk>
References: <20091204143612.f30db275.sfr@canb.auug.org.au> <20091204074341.GH8742@kernel.dk> <20091204135422.GZ8742@kernel.dk> <20091205094934.eefdddf4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0122700014.0.fullrate.dk ([95.166.99.235]:39959 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753843AbZLEJUw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 5 Dec 2009 04:20:52 -0500
Content-Disposition: inline
In-Reply-To: <20091205094934.eefdddf4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>

On Sat, Dec 05 2009, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Fri, 4 Dec 2009 14:54:22 +0100 Jens Axboe <jens.axboe@oracle.com> wrote:
> >
> > I pushed out the quick fix, just disallowing cfq=m and blk cgroup in
> > Kconfig. So it should work now.
> 
> Great, thanks.

And later on a proper solution was also implemented, that is what is
currently in the tree since last night.

-- 
Jens Axboe
