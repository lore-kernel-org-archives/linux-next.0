From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [BUG][bisected 270065e] linux-next fails to boot on powerpc
Date: Thu, 17 Aug 2017 17:06:38 +1000
Message-ID: <87d17usmf5.fsf@concordia.ellerman.id.au>
References: <1502902815.3305.22.camel@abdul.in.ibm.com> <1502915146.2421.13.camel@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58521 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750943AbdHQHGk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Aug 2017 03:06:40 -0400
In-Reply-To: <1502915146.2421.13.camel@wdc.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <Bart.VanAssche@wdc.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>
Cc: "sachinp@linux.vnet.ibm.com" <sachinp@linux.vnet.ibm.com>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "hare@suse.com" <hare@suse.com>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "hch@lst.de" <hch@lst.de>

Bart Van Assche <Bart.VanAssche@wdc.com> writes:

> On Wed, 2017-08-16 at 22:30 +0530, Abdul Haleem wrote:
>> As of next-20170809, linux-next on powerpc boot hung with below trace
>> message.
>> [ ... ]
>> System booted fine when the below commit is reverted: 
>
> Hello Abdul,
>
> Can you check whether applying the following commit on top of next-20170809
> fixes this regression:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?h=4.13/scsi-fixes&id=b0e17a9b0df29590c45dfb296f541270a5941f41

That's already in next-20170816, which still exhibits the bug.

We know that reverting it fixes the bug, but I can also fix it by doing
a partial revert, ie:

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 582769116f66..95f1428c5bc9 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -190,7 +190,9 @@ static void __scsi_queue_insert(struct scsi_cmnd *cmd, int reason, int unbusy)
 	 */
 	cmd->result = 0;
 	if (q->mq_ops) {
-		scsi_mq_requeue_cmd(cmd);
+		struct scsi_device *sdev = cmd->device;
+		blk_mq_requeue_request(cmd->request, true);
+		put_device(&sdev->sdev_gendev);
 		return;
 	}
 	spin_lock_irqsave(q->queue_lock, flags);


That's basically inlining the old version of scsi_mq_requeue_cmd() at
the other call site in __scsi_queue_insert().

Now I guess that was fairly obvious, if you look closely at the commit,
and the fact that we're not hitting the WARN_ON() you added.

Anyway let me know if there's anything else I can try.

cheers
