From: David Woodhouse <david.woodhouse@intel.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 17 Mar 2011 10:36:10 +0000
Message-ID: <1300358170.2589.50.camel@macbook.infradead.org>
References: <20110314161919.15e6d983.sfr@canb.auug.org.au>
	 <20110317103218.ca7f63bf.sfr@canb.auug.org.au> <4D81E010.1090808@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:4406 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752614Ab1CQKgO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Mar 2011 06:36:14 -0400
In-Reply-To: <4D81E010.1090808@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jarkko Lavinen <jarkko.lavinen@nokia.com>

On Thu, 2011-03-17 at 10:18 +0000, Jens Axboe wrote:
> 
> Can you point me at the commit in question? Generally,
> elv_queue_empty()
> can be replaced by blk_peek_request(). 

The interesting commit is this one:
http://git.infradead.org/mtd-2.6.git/commitdiff/c7519dbf6

The point of it is to enable this
http://git.infradead.org/mtd-2.6.git/commitdiff/a32159024

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
