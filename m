From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: manual merge of the kvm tree with the s390 tree
Date: Wed, 29 Jun 2016 07:47:50 +0200
Message-ID: <20160629054750.GA3458@osiris>
References: <20160629143658.204b8d07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39960 "EHLO
	mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750790AbcF2Fr7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jun 2016 01:47:59 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5T5i1B5009295
	for <linux-next@vger.kernel.org>; Wed, 29 Jun 2016 01:47:58 -0400
Received: from e06smtp16.uk.ibm.com (e06smtp16.uk.ibm.com [195.75.94.112])
	by mx0a-001b2d01.pphosted.com with ESMTP id 23v09p63aj-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 29 Jun 2016 01:47:58 -0400
Received: from localhost
	by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Wed, 29 Jun 2016 06:47:56 +0100
Content-Disposition: inline
In-Reply-To: <20160629143658.204b8d07@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Janosch Frank <frankja@linux.vnet.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>

On Wed, Jun 29, 2016 at 02:36:58PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm tree got a conflict in:
> 
>   arch/s390/hypfs/hypfs_diag.c
> 
> between commit:
> 
>   e030c1125eab ("s390/hypfs: use basic block for diag inline assembly")
> 
> from the s390 tree and commit:
> 
>   e65f30e0cb29 ("s390: hypfs: Move diag implementation and data definitions")
> 
> from the kvm tree.
> 
> I fixed it up (my fixup patch now looks like below) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 14 Jun 2016 14:47:33 +1000
> Subject: [PATCH] s390: merge fix up for __diag204 move
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/s390/kernel/diag.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

The fix looks good. Thanks!
