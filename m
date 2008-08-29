From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block tree build failure
Date: Fri, 29 Aug 2008 11:00:06 +0200
Message-ID: <20080829090006.GP20055@kernel.dk>
References: <20080829150741.713257b2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:48963 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752934AbYH2JAJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Aug 2008 05:00:09 -0400
Content-Disposition: inline
In-Reply-To: <20080829150741.713257b2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Fri, Aug 29 2008, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/scsi/sg.c: In function 'sg_write_xfer':
> drivers/scsi/sg.c:1862: error: 'iovec_count' undeclared (first use in this function)
> drivers/scsi/sg.c: In function 'sg_remove_scat':
> drivers/scsi/sg.c:1877: error: 'page' undeclared (first use in this function)
> 
> Introduced by commit d9b1190ebc3060e3a6ac1dd8cc3121390d7d71cd ("sg:
> convert the indirect IO path to use the block layer").
> 
> I applied the following patch (which is probably not correct).

Noticed that one too, I'll update the guilty patch.

-- 
Jens Axboe
