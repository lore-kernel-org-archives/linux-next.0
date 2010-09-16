From: Daniel Walker <dwalker@fifo99.com>
Subject: Re: FW: next build fails
Date: Thu, 16 Sep 2010 14:58:57 -0700
Message-ID: <1284674337.2411.53.camel@c-dwalke-linux.qualcomm.com>
References: <33A307AF30D7BF4F811B1568FE7A9B18043784FF99@EXDCVYMBSTM006.EQ1STM.local>
	 <20100916164442.df749cc1.sfr@canb.auug.org.au>
	 <1284656407.2411.5.camel@c-dwalke-linux.qualcomm.com>
	 <20100917075242.e0bc4b54.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100917075242.e0bc4b54.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sundar R IYER <sundar.iyer@stericsson.com>, Linus WALLEIJ <linus.walleij@stericsson.com>, Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 2010-09-17 at 07:52 +1000, Stephen Rothwell wrote:

> diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
> index 820f6ba..fc8828b 100644
> --- a/arch/arm/mm/proc-v7.S
> +++ b/arch/arm/mm/proc-v7.S
> @@ -334,10 +334,16 @@ cpu_elf_name:
>  __v7_ca9mp_proc_info:
>  	.long	0x410fc090		@ Required ID value
>  	.long	0xff0ffff0		@ Mask for ID
> -	.long   PMD_TYPE_SECT | \
> +	ALT_SMP(.long \
> +		PMD_TYPE_SECT | \
>  		PMD_SECT_AP_WRITE | \
>  		PMD_SECT_AP_READ | \
> -		PMD_FLAGS
> +		PMD_FLAGS_SMP)
> +	ALT_UP(.long \
> +		PMD_TYPE_SECT | \
> +		PMD_SECT_AP_WRITE | \
> +		PMD_SECT_AP_READ | \
> +		PMD_FLAGS_UP)

Yeah, exactly .. This is what I did to update my patch .. Do you want to
include this, or should I update my version and my tree.. Ultimately my
version has to go into Russell's tree..

Daniel
