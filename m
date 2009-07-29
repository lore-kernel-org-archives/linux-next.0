From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: drbd tree build failure
Date: Wed, 29 Jul 2009 01:47:48 -0400
Message-ID: <yq1prbk59bv.fsf@sermon.lab.mkp.net>
References: <20090729152938.791a81c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:48044 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751343AbZG2FsI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2009 01:48:08 -0400
In-Reply-To: <20090729152938.791a81c3.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Wed, 29 Jul 2009 15:29:38 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <jens.axboe@oracle.com>

>>>>> "Stephen" == Stephen Rothwell <sfr@canb.auug.org.au> writes:

Stephen> drivers/block/drbd/drbd_nl.c: In function
Stephen> 'drbd_setup_queue_param': drivers/block/drbd/drbd_nl.c:707:
Stephen> error: implicit declaration of function
Stephen> 'blk_queue_stack_limits'

We've decided to keep blk_queue_stack_limits as a wrapper to ease the
transition.  I sent Jens a patch earlier today that does this.

-- 
Martin K. Petersen	Oracle Linux Engineering
