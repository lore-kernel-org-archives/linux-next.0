From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: block tree build failure
Date: Wed, 13 May 2009 18:21:43 +0900
Message-ID: <4A0A9127.90307@kernel.org>
References: <20090513140413.b8a3c8d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:43261 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755248AbZEMJWA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 May 2009 05:22:00 -0400
In-Reply-To: <20090513140413.b8a3c8d0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, James Smart <James.Smart@Emulex.Com>, James Bottomley <James.Bottomley@HansenPartnership.com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

Hello,

Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/scsi/scsi_transport_fc.c: In function 'fc_bsg_jobdone':
> drivers/scsi/scsi_transport_fc.c:3428: error: 'struct request' has no member named 'data_len'
> drivers/scsi/scsi_transport_fc.c:3434: error: 'struct request' has no member named 'data_len'
> drivers/scsi/scsi_transport_fc.c:3437: error: implicit declaration of function 'blk_end_bidi_request'
> drivers/scsi/scsi_transport_fc.c: In function 'fc_bsg_map_buffer':
> drivers/scsi/scsi_transport_fc.c:3499: error: 'struct request' has no member named 'data_len'
> drivers/scsi/scsi_transport_fc.c: In function 'fc_bsg_request_handler':
> drivers/scsi/scsi_transport_fc.c:3765: error: implicit declaration of function 'elv_next_request'
> drivers/scsi/scsi_transport_fc.c:3765: warning: assignment makes pointer from integer without a cast
> drivers/scsi/scsi_transport_fc.c:3772: error: implicit declaration of function 'blkdev_dequeue_request'
> 
> Caused by commit 1bfe9caaff367601134c14fc428017419f628f7d ("[SCSI] FC
> Pass Thru support") from the scsi tree interacting with commits
> a2dec7b36364a5cc564c4d76cf16d2e7d33f5c05 ("block: hide request sector and
> data_len"), 9934c8c04561413609d2bc38c6b9f268cba774a4 ("block:
> implement and enforce request peek/start/fetch") and
> b1f744937f1be3e6d3009382a755679133cf782d ("block: move completion related
> functions back to blk-core.c") from the block tree.
> 
> Removing old interfaces is a particularly unfriendly thing to do within
> the same time frame as creating replacements.  Better would be to
> deprecate them or reimplement them in terms of the new interfaces if
> possible.

One of the goals of the API change was to break any user which
accesses block layer internals directly to enforce proper
encapsulation because there were too many abusers.  Sorry about the
trouble.

> I have reverted commit b1f744937f1be3e6d3009382a755679133cf782d
> ("block: move completion related functions back to blk-core.c") and
> applied the following patch (which I realise is probably not
> correct) for today.  Maybe someone can come up with a better
> solution for the scsi guys and me.

Hmmm... is there a SCSI tree which won't be rebased?  Then I can pull
blk tree into it and SCSI tree can go on from that point on.

Thanks.

-- 
tejun
