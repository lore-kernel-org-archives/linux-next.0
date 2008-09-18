From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block tree build failure
Date: Thu, 18 Sep 2008 06:31:44 +0200
Message-ID: <20080918043143.GH20055@kernel.dk>
References: <20080918130417.261387af.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:52893 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750918AbYIREbq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Sep 2008 00:31:46 -0400
Content-Disposition: inline
In-Reply-To: <20080918130417.261387af.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thu, Sep 18 2008, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> fs/bio-integrity.c: At top level:
> fs/bio-integrity.c:211: error: conflicting types for 'bdev_get_integrity'
> fs/bio-integrity.c:155: error: previous implicit declaration of 'bdev_get_integrity' was here
> 
> Introduced by commit 1fd75f9b2e1c273ab145c9bf3e7a8afcbd8be87a ("block:
> cleanup some of the integrity stuff in blkdev.h").  I applied the
> following patch.

Woops, sorry about that. I'll update the patch, thanks.

-- 
Jens Axboe
