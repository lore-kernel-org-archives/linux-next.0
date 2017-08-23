From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: linux-next: manual merge of the tip tree with the iommu tree
Date: Wed, 23 Aug 2017 09:15:07 -0500
Message-ID: <828c5f60-5d75-f9f3-4d96-a85906399463@amd.com>
References: <20170822135057.776f3509@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-sn1nam02on0071.outbound.protection.outlook.com ([104.47.36.71]:45632
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754001AbdHWOPQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Aug 2017 10:15:16 -0400
In-Reply-To: <20170822135057.776f3509@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>

On 8/21/2017 10:50 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got conflicts in:
> 
>    drivers/iommu/amd_iommu.c
>    drivers/iommu/amd_iommu_init.c
>    drivers/iommu/amd_iommu_proto.h
>    drivers/iommu/amd_iommu_types.h
> 
> between commits:
> 
>    4c232a708be1 ("iommu/amd: Detect pre enabled translation")
>    9494ea90a56d ("Revert "iommu/amd: Suppress IO_PAGE_FAULTs in kdump kernel"")
>    07a80a6b5920 ("iommu/amd: Define bit fields for DTE particularly")
>    daae2d25a477 ("iommu/amd: Don't copy GCR3 table root pointer")
> 
> from the iommu tree and commit:
> 
>    2543a786aa25 ("iommu/amd: Allow the AMD IOMMU to work with memory encryption")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Sorry, I was out of the office the past few days.  I checked the
linux-next tree and everything looks good in relation to commit

  2543a786aa25 ("iommu/amd: Allow the AMD IOMMU to work with memory encryption")

Thanks,
Tom
