From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the s390 tree
Date: Thu, 8 Feb 2018 07:08:12 +0100
Message-ID: <20180208070812.7dd4e1b6@mschwideX1>
References: <20180208073539.706e942f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38270 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751796AbeBHGIU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Feb 2018 01:08:20 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w1864Teh005379
        for <linux-next@vger.kernel.org>; Thu, 8 Feb 2018 01:08:20 -0500
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2g0d9u76e3-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 08 Feb 2018 01:08:19 -0500
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <schwidefsky@de.ibm.com>;
        Thu, 8 Feb 2018 06:08:18 -0000
In-Reply-To: <20180208073539.706e942f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, 8 Feb 2018 07:35:39 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Commit
> 
>   b175210bd231 ("s390/kconfig: Remove ARCH_WANTS_PROT_NUMA_PROT_NONE select")
> 
> is missing a Signed-off-by from its committer.
 
It is always that "last" one you add. Fixed. Thanks.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
