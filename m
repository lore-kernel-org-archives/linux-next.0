From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: md tree build failure
Date: Thu, 04 Jun 2009 00:17:04 -0400
Message-ID: <yq1ws7sljjz.fsf@sermon.lab.mkp.net>
References: <20090525153346.758483fc.sfr@canb.auug.org.au>
	<20090525061552.GH11363@kernel.dk>
	<20090601144218.26810ec8.sfr@canb.auug.org.au>
	<yq163fga654.fsf@sermon.lab.mkp.net>
	<39efa6d3788eec04b0bc86b02d988c8f.squirrel@neil.brown.name>
	<yq1prdm6jn1.fsf@sermon.lab.mkp.net>
	<18983.18515.445191.401600@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:25754 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750724AbZFDER1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2009 00:17:27 -0400
In-Reply-To: <18983.18515.445191.401600@notabene.brown> (Neil Brown's message
	of "Thu, 4 Jun 2009 14:06:43 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>

>>>>> "Neil" == Neil Brown <neilb@suse.de> writes:

Neil> OK, I've just rebased my for-next tree against Jens' for-next, and
Neil> fixed the compile error with this incremental patch

Excellent - thanks for doing this!


Neil> - if (mddev->chunk_size % mddev->queue->hardsect_size) {
Neil> + if (mddev->chunk_size % queue_logical_block_size(mddev->queue))

Neil> I assume that is the preferred usage?

Yup.

-- 
Martin K. Petersen	Oracle Linux Engineering
