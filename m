From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the davinci tree with the arm tree
Date: Mon, 18 Oct 2010 11:01:16 +1100
Message-ID: <20101018110116.00c4665e.sfr@canb.auug.org.au>
References: <20101018103152.33fa12cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101018103152.33fa12cd.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@deeprootsystems.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Nicolas Pitre <nicolas.pitre@linaro.org>
List-Id: linux-next.vger.kernel.org

[Just cc'ing Russell, sorry about that]

On Mon, 18 Oct 2010 10:31:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Kevin,
> 
> Today's linux-next merge of the davinci tree got a conflicts in
> arch/arm/mach-davinci/board-da830-evm.c and
> arch/arm/mach-davinci/board-da850-evm.c between commit
> 861bd81ee62a0d6759144c22909a8a3938951656 ("arm: remove
> machine_desc.io_pg_offst and .phys_io") from the arm tree and commit
> 48ea89eabee96019a4a84615af921f8703320abb ("davinci: introduce support for
> AM1x ARM9 microprocessors") from the davinci tree.
> 
> Just context changes,  I fixed them up (see below) and can carry the fix
> as necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/arm/mach-davinci/board-da830-evm.c
> index 7f3cdbf,1bb89d3..0000000
> --- a/arch/arm/mach-davinci/board-da830-evm.c
> +++ b/arch/arm/mach-davinci/board-da830-evm.c
> @@@ -596,7 -608,9 +608,7 @@@ static void __init da830_evm_map_io(voi
>   	da830_init();
>   }
>   
> - MACHINE_START(DAVINCI_DA830_EVM, "DaVinci DA830/OMAP-L137 EVM")
> + MACHINE_START(DAVINCI_DA830_EVM, "DaVinci DA830/OMAP-L137/AM17x EVM")
>  -	.phys_io	= IO_PHYS,
>  -	.io_pg_offst	= (__IO_ADDRESS(IO_PHYS) >> 18) & 0xfffc,
>   	.boot_params	= (DA8XX_DDR_BASE + 0x100),
>   	.map_io		= da830_evm_map_io,
>   	.init_irq	= cp_intc_init,
> diff --cc arch/arm/mach-davinci/board-da850-evm.c
> index b26f5cb,ef97c7f..0000000
> --- a/arch/arm/mach-davinci/board-da850-evm.c
> +++ b/arch/arm/mach-davinci/board-da850-evm.c
> @@@ -816,7 -868,9 +868,7 @@@ static void __init da850_evm_map_io(voi
>   	da850_init();
>   }
>   
> - MACHINE_START(DAVINCI_DA850_EVM, "DaVinci DA850/OMAP-L138 EVM")
> + MACHINE_START(DAVINCI_DA850_EVM, "DaVinci DA850/OMAP-L138/AM18x EVM")
>  -	.phys_io	= IO_PHYS,
>  -	.io_pg_offst	= (__IO_ADDRESS(IO_PHYS) >> 18) & 0xfffc,
>   	.boot_params	= (DA8XX_DDR_BASE + 0x100),
>   	.map_io		= da850_evm_map_io,
>   	.init_irq	= cp_intc_init,


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
