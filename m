From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] powerpc: sort Kconfig selects under CONFIG_PPC
Date: Mon, 30 Jan 2017 20:41:02 +1100
Message-ID: <20170130204102.423cebea@canb.auug.org.au>
References: <87y3xtw62l.fsf@concordia.ellerman.id.au>
        <20170130093002.22180-1-andrew.donnellan@au1.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170130093002.22180-1-andrew.donnellan@au1.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, paulmck@linux.vnet.ibm.com, benh@kernel.crashing.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On Mon, 30 Jan 2017 20:30:02 +1100 Andrew Donnellan <andrew.donnellan@au1.ibm.com> wrote:
>
> config PPC has a lot of selects under it. They're not sorted in any
> particular order, leading to merge conflicts when adding items at the end.
> 
> Sort them alphabetically.

Excellent, thanks.

> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> ---
> 
> On top of linux-next 20170130

Probably best done on top of powerpc-next and I can cope with the
conflicts one more time.

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 689cf9218b21..570195c8a86a 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -80,91 +80,91 @@ config ARCH_HAS_DMA_SET_COHERENT_MASK
>  config PPC

Could we add a comment just above asking that the selects be kept in order?

>  	bool
>  	default y
> -	select BUILDTIME_EXTABLE_SORT
> +	select ARCH_HAS_DEVMEM_IS_ALLOWED
> +	select ARCH_HAS_DMA_SET_COHERENT_MASK
-- 
Cheers,
Stephen Rothwell
