From: Sebastian Ott <sebott@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 15 Jun 2017 16:50:48 +0200 (CEST)
Message-ID: <alpine.LFD.2.20.1706151649160.1848@schleppi>
References: <20170613205409.4b7e06f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47832 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752548AbdFOOu4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jun 2017 10:50:56 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5FEmgKH063963
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2017 10:50:55 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2b3ujvtbya-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2017 10:50:55 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <sebott@linux.vnet.ibm.com>;
        Thu, 15 Jun 2017 15:50:53 +0100
In-Reply-To: <20170613205409.4b7e06f9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

On Tue, 13 Jun 2017, Stephen Rothwell wrote:
> After merging the block tree, today's linux-next build (s390x
> s390-defconfig) failed like this:
> 
> drivers/s390/block/scm_blk.c:293:10: error: 'BLK_MQ_RQ_QUEUE_BUSY' undeclared (first use in this function)
> drivers/s390/block/scm_blk.c:327:9: error: 'BLK_MQ_RQ_QUEUE_OK' undeclared (first use in this function)
> 
> Caused by commit
> 
>   fc17b6534eb8 ("blk-mq: switch ->queue_rq return value to blk_status_t")
> 
> interacting with commit
> 
>   12d907626539 ("s390/scm: convert to blk-mq")
> 
> from the s390 tree.
> 
> Is the following the correct merge fixup?

Yes, that looks good!

Thanks,
Sebastian
