From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Mon, 24 Sep 2018 10:32:05 +0100
Message-ID: <20180924093204.GB52978@arrakis.emea.arm.com>
References: <20180924143853.0f6cc235@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180924143853.0f6cc235@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jia He <jia.he@hxt-semitech.com>, James Morse <james.morse@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Mon, Sep 24, 2018 at 02:38:53PM +1000, Stephen Rothwell wrote:
> diff --cc arch/arm64/Kconfig
> index da5e6f085561,f8a618a292f4..000000000000
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@@ -785,7 -786,8 +785,8 @@@ config ARCH_FLATMEM_ENABL
>   	def_bool !NUMA
>   
>   config HAVE_ARCH_PFN_VALID
>  -	def_bool ARCH_HAS_HOLES_MEMORYMODEL || !SPARSEMEM
>  +	def_bool y
> + 	select HAVE_MEMBLOCK_PFN_VALID

It looks fine. Thanks.

-- 
Catalin
