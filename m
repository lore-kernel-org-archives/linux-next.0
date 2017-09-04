From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: manual merge of the s390 tree with Linus' tree
Date: Mon, 4 Sep 2017 14:45:42 +0200
Message-ID: <20170904144542.3d41a0fe@mschwideX1>
References: <20170904094928.59e8594c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40797 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753651AbdIDMpt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Sep 2017 08:45:49 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v84CijEt150896
        for <linux-next@vger.kernel.org>; Mon, 4 Sep 2017 08:45:49 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2cs1ewaec1-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 04 Sep 2017 08:45:48 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <schwidefsky@de.ibm.com>;
        Mon, 4 Sep 2017 13:45:47 +0100
In-Reply-To: <20170904094928.59e8594c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, 4 Sep 2017 09:49:28 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the s390 tree got a conflict in:
> 
>   arch/s390/include/asm/mmu_context.h
> 
> between commit:
> 
>   0b89ede62963 ("s390/mm: fork vs. 5 level page tabel")
> 
> from Linus' tree and commit:
> 
>   f1c1174fa099 ("s390/mm: use new mm defines instead of magic values")
> 
> from the s390 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
 
Fixup looks fine, thank you!

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
