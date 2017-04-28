From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: rhashtable - Cap total number of entries to 2^31
Date: Fri, 28 Apr 2017 13:43:49 +0200
Message-ID: <a4ff19b5-85c6-00d7-c144-ce8ea00dc2ad@de.ibm.com>
References: <20170427054451.GA529@gondor.apana.org.au>
 <0cd0286d-b81d-7bf4-d345-7ef098b9a998@broadcom.com>
 <56843a86-9a09-16e8-acec-05a80396f282@gmail.com>
 <acb22f3f-8286-01f2-e536-0ab44eb06b34@de.ibm.com>
 <20170428113145.GA7843@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41378 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756550AbdD1Ln5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 28 Apr 2017 07:43:57 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v3SBcj4Z113750
        for <linux-next@vger.kernel.org>; Fri, 28 Apr 2017 07:43:56 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2a3j0mj81k-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 28 Apr 2017 07:43:56 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
        Fri, 28 Apr 2017 07:43:55 -0400
In-Reply-To: <20170428113145.GA7843@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Florian Fainelli <f.fainelli@gmail.com>, David Miller <davem@davemloft.net>, fw@strlen.de, netdev@vger.kernel.org, Thomas Graf <tgraf@suug.ch>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 04/28/2017 01:31 PM, Herbert Xu wrote:
> On Fri, Apr 28, 2017 at 12:23:15PM +0200, Christian Borntraeger wrote:
>>
>> I can reproduce this boot failure on s390 bisected to 
>> commit 6d684e54690caef45cf14051ddeb7c71beeb681b
>>    rhashtable: Cap total number of entries to 2^31
>> in linux-next from Apr 28
> 
> It should go away with
> 
> https://patchwork.ozlabs.org/patch/756233/
> 
> Thanks,
> 
Yes it does.

Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>

would be nice to have it in the next linux-next version.
