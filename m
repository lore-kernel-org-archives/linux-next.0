From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Mon, 4 Sep 2017 15:59:36 +1000
Message-ID: <20170904155936.567b86ca@canb.auug.org.au>
References: <20170824092246.6a92110e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37173 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750821AbdIDF7i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Sep 2017 01:59:38 -0400
In-Reply-To: <20170824092246.6a92110e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Martin <Dave.Martin@arm.com>, Will Deacon <will.deacon@arm.com>

Hi all,

On Thu, 24 Aug 2017 09:22:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/kernel/fpsimd.c
> 
> between commit:
> 
>   096622104e14 ("arm64: fpsimd: Prevent registers leaking across exec")
> 
> from Linus' tree and commit:
> 
>   cb84d11e1625 ("arm64: neon: Remove support for nested or hardirq kernel-mode NEON")
> 
> from the arm64 tree.
> 
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Just a reminder that the above conflict still exists.
-- 
Cheers,
Stephen Rothwell
