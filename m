From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH -next] s390/dasd: hold request queue sysfs lock when
 calling elevator_init()
Date: Thu, 31 Oct 2013 08:14:12 -0600
Message-ID: <20131031141412.GF10091@kernel.dk>
References: <20131031132152.GD5551@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:43424 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754202Ab3JaOOQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2013 10:14:16 -0400
Content-Disposition: inline
In-Reply-To: <20131031132152.GD5551@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Tomoki Sekiyama <tomoki.sekiyama@hds.com>, Stefan Weinhuber <wein@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org

On Thu, Oct 31 2013, Heiko Carstens wrote:
> Hi Tomoki and Jens,
> 
> due to a change in linux-next the patch below is needed for s390 as well.
> It looks to me as if the easiest way to get this patch upstream during
> the next merge would be via the s390 tree.
> Even though I'd much more like if we could get rid of the elevator_init()
> call from the dasd driver, but Stefan is still reluctant ;)

I'll queue it up in the drivers branch of the 3.13 queue, that'll keep
it closer to the breakage. And yes, that hack should die a horrible
death.

-- 
Jens Axboe
