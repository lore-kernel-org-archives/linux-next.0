From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Mon, 22 Feb 2016 09:24:15 +0000
Message-ID: <20160222092414.GA24203@e104818-lin.cambridge.arm.com>
References: <20160222132829.2b4cf53e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160222132829.2b4cf53e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Mon, Feb 22, 2016 at 01:28:29PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the kvm-arm tree got a conflict in:
> 
>   arch/arm64/include/asm/cpufeature.h
>   arch/arm64/kernel/cpufeature.c
> 
> between commit:
> 
>   d5370f754875 ("arm64: prefetch: add alternative pattern for CPUs without a prefetcher")
>   57f4959bad0a ("arm64: kernel: Add support for User Access Override")
>   705441960033 ("arm64: kernel: Don't toggle PAN on systems with UAO")
> 
> from the arm64 tree and commit:
> 
>   d0be74f771d5 ("arm64: Add ARM64_HAS_VIRT_HOST_EXTN feature")
> 
> from the kvm-arm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

The fix-up looks correct indeed. Thanks.

-- 
Catalin
