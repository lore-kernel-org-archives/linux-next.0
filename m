From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the s390 tree
Date: Wed, 27 Sep 2017 07:59:01 +0200
Message-ID: <20170927075901.3c1c0210@mschwideX1>
References: <20170927092734.5b8a062e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49514 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751741AbdI0F7J (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Sep 2017 01:59:09 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8R5sdWo090518
        for <linux-next@vger.kernel.org>; Wed, 27 Sep 2017 01:59:09 -0400
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2d80vc6byt-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 27 Sep 2017 01:59:08 -0400
Received: from localhost
        by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <schwidefsky@de.ibm.com>;
        Wed, 27 Sep 2017 06:59:07 +0100
In-Reply-To: <20170927092734.5b8a062e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Thumshirn <jthumshirn@suse.de>

On Wed, 27 Sep 2017 09:27:34 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Commit
> 
>   fc9abdb8a661 ("samples/kprobes: Add s390 case in kprobe example module")
> 
> is missing a Signed-off-by from its committer.

Fixed, thanks!

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
