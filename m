From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Tue, 22 Nov 2016 13:31:59 +0000
Message-ID: <20161122133158.GG28723@e104818-lin.cambridge.arm.com>
References: <20161122103458.1f10bcbc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:55884 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755697AbcKVNcD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 08:32:03 -0500
Content-Disposition: inline
In-Reply-To: <20161122103458.1f10bcbc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>

Hi Stephen,

On Tue, Nov 22, 2016 at 10:34:58AM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/include/asm/cpufeature.h
> 
> between commit:
> 
>   272d01bd790f ("arm64: Fix circular include of asm/lse.h through linux/jump_label.h")
> 
> from Linus' tree and commits:
> 
>   a4023f682739 ("arm64: Add hypervisor safe helper for checking constant capabilities")
>   82e0191a1aa1 ("arm64: Support systems without FP/ASIMD")
> 
> from the arm64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The merge resolution and additional patch look fine. Thanks.

-- 
Catalin
