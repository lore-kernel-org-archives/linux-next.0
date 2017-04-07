From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the akpm tree with the arm64 tree
Date: Fri, 7 Apr 2017 09:48:35 +0100
Message-ID: <20170407084835.GA18291@e104818-lin.cambridge.arm.com>
References: <20170407174120.0b0baadf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:52264 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754830AbdDGIsk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 Apr 2017 04:48:40 -0400
Content-Disposition: inline
In-Reply-To: <20170407174120.0b0baadf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>, Laura Abbott <labbott@redhat.com>

Hi Stephen,

On Fri, Apr 07, 2017 at 05:41:20PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   arch/arm64/include/asm/cacheflush.h
> 
> between commit:
> 
>   9b0aa14e3155 ("arm64: mm: add set_memory_valid()")
> 
> from the arm64 tree and patch:
> 
>   "treewide: move set_memory_* functions away from cacheflush.h"
> 
> from the akpm tree.
> 
> I fixed it up (see below - not ideal ...) and can carry the fix as
> necessary.

Thanks for fixing this up. Not ideal, indeed, but I can push a clean-up
patch after -rc1 to move set_memory_valid() to an arm64-specific
set_memory.h (which would include asm-generic/set_memory.h). Given that
my for-next branch is based on 4.11-rc3, I can't do this now without
risking breaking other things.

-- 
Catalin
