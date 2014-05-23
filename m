From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: build failure after merge of the target-updates tree
Date: Fri, 23 May 2014 10:38:37 -0700
Message-ID: <1400866717.30565.3.camel@haakon3.risingtidesystems.com>
References: <20140523191159.6a064678@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linux-iscsi.org ([67.23.28.174]:51703 "EHLO
	linux-iscsi.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750924AbaEWRis (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 May 2014 13:38:48 -0400
In-Reply-To: <20140523191159.6a064678@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, target-devel <target-devel@vger.kernel.org>

Hi Stephen,

(Adding CC's for Paolo + MKP)

On Fri, 2014-05-23 at 19:11 +1000, Stephen Rothwell wrote:
> Hi Nicholas,
> 
> After merging the target-updates tree, today's linux-next build
> (powerpc ppc64_defconfig) failed like this:
> 
> 
> drivers/scsi/virtio_scsi.c: In function 'virtio_scsi_init_hdr_pi':
> drivers/scsi/virtio_scsi.c:491:48: error: dereferencing pointer to incomplete type
>    cmd_pi->pi_bytesout = blk_rq_sectors(rq) * bi->tuple_size;
>                                                 ^
> drivers/scsi/virtio_scsi.c:493:47: error: dereferencing pointer to incomplete type
>    cmd_pi->pi_bytesin = blk_rq_sectors(rq) * bi->tuple_size;
>                                                ^
> 
> Caused by commit 4baaa7d589e2 ("virtio-scsi: Enable DIF/DIX modes in
> SCSI host LLD").  A missing include of linux/blkdev.h.  See Rule 1 in
> Documentation/SubmitChecklist.
> 
> I have used the target-updates tree from next-20140522 for today.

Whoops, adding the missing #include <linux/blkdev.h> now..

Thanks!

--nab
