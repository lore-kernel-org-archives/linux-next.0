From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: drbd tree build failure
Date: Tue, 18 Aug 2009 02:01:58 -0400
Message-ID: <yq1hbw5hd7t.fsf@sermon.lab.mkp.net>
References: <20090729152938.791a81c3.sfr@canb.auug.org.au>
	<yq1prbk59bv.fsf@sermon.lab.mkp.net>
	<20090818153250.5ce293b5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:56071 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750945AbZHRGCN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Aug 2009 02:02:13 -0400
In-Reply-To: <20090818153250.5ce293b5.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Tue, 18 Aug 2009 15:32:50 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Reisner <philipp.reisner@linbit.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>

>>>>> "Stephen" == Stephen Rothwell <sfr@canb.auug.org.au> writes:

>> We've decided to keep blk_queue_stack_limits as a wrapper to ease the
>> transition.  I sent Jens a patch earlier today that does this.

Stephen> I am still getting this error (3 weeks later) ...  :-(

Jens applied it to for-linus and it's been upstream for a while.  But it
looks like the block for-next tree has stale bits...

Jens?

-- 
Martin K. Petersen	Oracle Linux Engineering
