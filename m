From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block tree build failure
Date: Tue, 14 Apr 2009 08:21:31 +0200
Message-ID: <20090414062131.GC5178@kernel.dk>
References: <20090409133716.12af28e6.sfr@canb.auug.org.au> <20090414123502.766da661.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:57092 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752169AbZDNGVd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2009 02:21:33 -0400
Content-Disposition: inline
In-Reply-To: <20090414123502.766da661.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, Apr 14 2009, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Thu, 9 Apr 2009 13:37:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > usr/include/linux/fs.h:11: included file 'linux/rwtypes.h' is not exported
> > make[4]: *** [usr/include/linux/.check] Error 1
> > 
> > Caused by commit 93fe0305df9344f57edfa0444f8764b34ea74f9b ("Document and
> > move the various READ/WRITE types") which I have reverted for today.
> 
> This is still there, so today I have used the block tree from
> next-20090408.

Sorry about that, was a 5-day easter weekend here. It's fixed up now,
I've updated for-next and for-akpm accordingly.

-- 
Jens Axboe
