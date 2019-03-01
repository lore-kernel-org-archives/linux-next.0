From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm64 tree
Date: Fri, 1 Mar 2019 10:58:42 +0000
Message-ID: <20190301105842.GA10733@arrakis.emea.arm.com>
References: <20190301091036.3e97bb49@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190301091036.3e97bb49@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Will Deacon <will.deacon@arm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 01, 2019 at 09:10:36AM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-soc tree got a conflict in:
> 
>   arch/arm64/Kconfig.platforms
> 
> between commit:
> 
>   a29c78234942 ("arm64: Kconfig.platforms: fix warning unmet direct dependencies")
> 
> from the arm64 tree and commits:
> 
>   67b9282387c5 ("arm64: imx8mq: select GPCv2 irqchip driver")
>   84a2ab25b12d ("arm64: imx8mq: select PM support")
> 
> from the arm-soc tree.
[...]
> diff --cc arch/arm64/Kconfig.platforms
> index d4faca775d9c,c5f6a57f16b8..000000000000
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@@ -145,7 -151,11 +151,11 @@@ config ARCH_MVEB
>   config ARCH_MXC
>   	bool "ARMv8 based NXP i.MX SoC family"
>   	select ARM64_ERRATUM_843419
>  -	select ARM64_ERRATUM_845719
>  +	select ARM64_ERRATUM_845719 if COMPAT
> + 	select IMX_GPCV2
> + 	select IMX_GPCV2_PM_DOMAINS
> + 	select PM
> + 	select PM_GENERIC_DOMAINS
>   	help
>   	  This enables support for the ARMv8 based SoCs in the
>   	  NXP i.MX family.

The resolution looks fine, thanks Stephen.

Olof, Arnd, I can drop this commit if you'd rather merge it via the
arm-soc tree (it was related to a CPU erratum and thought I'd pick it
up).

-- 
Catalin
