From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the s390 tree
Date: Tue, 14 Jun 2016 10:45:48 +0200
Message-ID: <575FC43C.7000306@de.ibm.com>
References: <20160614145117.54eba7ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49524 "EHLO
	mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751661AbcFNIp4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Jun 2016 04:45:56 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5E8iljT125271
	for <linux-next@vger.kernel.org>; Tue, 14 Jun 2016 04:45:55 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
	by mx0b-001b2d01.pphosted.com with ESMTP id 23gc8x0v4d-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 14 Jun 2016 04:45:55 -0400
Received: from localhost
	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Tue, 14 Jun 2016 04:45:54 -0400
In-Reply-To: <20160614145117.54eba7ec@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Cornelia Huck <cornelia.huck@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Janosch Frank <frankja@linux.vnet.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>

On 06/14/2016 06:51 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvms390 tree got a conflict in:
> 
>   arch/s390/hypfs/hypfs_diag.c
> 
> between commit:
> 
>   6c22c9863760 ("s390: avoid extable collisions")
> 
> from the s390 tree and commit:
> 
>   e65f30e0cb29 ("s390: hypfs: Move diag implementation and data definitions")
> 
> from the kvms390 tree.
> 
> I fixed it up (using the kvms390 version and then adding the following
> patch) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 14 Jun 2016 14:47:33 +1000
> Subject: [PATCH] s390: merge fix up for __diag204 move
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/s390/kernel/diag.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/s390/kernel/diag.c b/arch/s390/kernel/diag.c
> index a44faf4a0454..2289d6f8bec0 100644
> --- a/arch/s390/kernel/diag.c
> +++ b/arch/s390/kernel/diag.c
> @@ -169,7 +169,7 @@ static inline int __diag204(unsigned long subcode, unsigned long size, void *add
> 
>  	asm volatile(
>  		"	diag	%2,%0,0x204\n"
> -		"0:\n"
> +		"0:	nopr	%%r7\n"
>  		EX_TABLE(0b,0b)
>  		: "+d" (_subcode), "+d" (_size) : "d" (addr) : "memory");
>  	if (_subcode)
> 


Yes, thanks. This conflict (and the other preexisting one) will move soon to Paolos KVM tree
as I plan to submit my first pull request soon.

Christian 
