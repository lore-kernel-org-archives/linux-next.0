From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block tree build failure
Date: Mon, 15 Sep 2008 15:18:39 +0200
Message-ID: <20080915131837.GP20055@kernel.dk>
References: <20080915151844.16569141.sfr@canb.auug.org.au> <278380.30002.qm@web37604.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:55482 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753334AbYIONSm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Sep 2008 09:18:42 -0400
Content-Disposition: inline
In-Reply-To: <278380.30002.qm@web37604.mail.mud.yahoo.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alex Dubov <oakad@yahoo.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Sun, Sep 14 2008, Alex Dubov wrote:
> 
> 
> 
> --- On Sun, 9/14/08, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Subject: linux-next: block tree build failure
> > To: "Jens Axboe" <jens.axboe@oracle.com>
> > Cc: linux-next@vger.kernel.org, "Alex Dubov" <oakad@yahoo.com>, "Tejun Heo" <tj@kernel.org>
> > Date: Sunday, September 14, 2008, 10:18 PM
> > Hi Jens,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed
> > like this:
> > 
> > drivers/memstick/core/mspro_block.c: In function
> > 'mspro_block_disk_release':
> > drivers/memstick/core/mspro_block.c:200: error:
> > 'MEMSTICK_PART_SHIFT' undeclared (first use in this
> > function)
> > 
> 
> That's funny. My last patch replaced all occurrences of this macro.

Doh it's me, fixed up the git merge conflict wrong. Thanks for the
report.

-- 
Jens Axboe
