From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the s390 tree
Date: Thu, 27 Apr 2017 08:47:22 +0200
Message-ID: <4dbc5e97-2577-d3b7-466c-24cba3a3fdca@de.ibm.com>
References: <20170427132917.3843cedc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59266 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753767AbdD0Gra (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 Apr 2017 02:47:30 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v3R6iM9V081947
        for <linux-next@vger.kernel.org>; Thu, 27 Apr 2017 02:47:30 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2a32j3t1g2-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 27 Apr 2017 02:47:29 -0400
Received: from localhost
        by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
        Thu, 27 Apr 2017 00:47:28 -0600
In-Reply-To: <20170427132917.3843cedc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Cornelia Huck <cornelia.huck@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Harald Freudenberger <freude@linux.vnet.ibm.com>, "Jason J. Herne" <jjherne@linux.vnet.ibm.com>

On 04/27/2017 05:29 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvms390 tree got a conflict in:
> 
>   arch/s390/include/asm/cpacf.h
> 
> between commit:
> 
>   985a9d20daa6 ("s390/crypto: Renaming PPNO to PRNO.")
> 
> from the s390 tree and commit:
> 
>   152c1c8d60eb ("s390/cpacf: Introduce kma instruction")
> 
> from the kvms390 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Correct fix, thanks. It should be ok again tomorrow as Martin has merged
my topic branch.
