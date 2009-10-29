From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: next-20091029: fs/aio.c build failure
Date: Thu, 29 Oct 2009 14:01:36 +0100
Message-ID: <20091029130135.GL10727@kernel.dk>
References: <a4423d670910290540x21ab0692p90ebd04b5c3d62e@mail.gmail.com> <20091029125606.GK10727@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:39495 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752946AbZJ2NBb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Oct 2009 09:01:31 -0400
Content-Disposition: inline
In-Reply-To: <20091029125606.GK10727@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, jmoyer@redhat.com

On Thu, Oct 29 2009, Jens Axboe wrote:
> On Thu, Oct 29 2009, Alexander Beregalov wrote:
> > Hi
> > 
> > fs/aio.c:1575: error: implicit declaration of function 'blk_run_address_space'
> > 
> > CONFIG_BLOCK is not set.
> 
> Not the first time this has happened, I think we should just pull the
> bdi/mapping unplug functions out of CONFIG_BLOCK protection. They work
> on the backing_dev, so they aren't inherently tied to just block IO.

I committed this:

http://git.kernel.dk/?p=linux-2.6-block.git;a=commit;h=b9d128f1088ea5245109dfc9bbceb128b6371a77

Same as the posted version, but adds the backing-dev.h include to
fs/aio.c to make it visible as well. Passes compile/link testing here,
for both CONFIG_BLOCk and !CONFIG_BLOCK.

-- 
Jens Axboe
