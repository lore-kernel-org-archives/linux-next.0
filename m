From: Mike Turquette <mturquette@ti.com>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Tue, 30 Oct 2012 03:11:40 -0700
Message-ID: <20121030101140.18780.69840@nucleus>
References: <20121030150627.ac1f6a3f75231ea49edf7b98@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121030150627.ac1f6a3f75231ea49edf7b98@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

Quoting Stephen Rothwell (2012-10-29 21:06:27)
> Hi Mike,
> 
> Today's linux-next merge of the clk tree got a conflict in
> arch/arm/include/asm/hardware/sp810.h between commit 0891642cf117 ("ARM:
> vexpress: Start using new Versatile Express infrastructure") from the
> arm-soc tree and commit 05e3659135a4 ("clk: Common clocks implementation
> for Versatile Express") from the clk tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/arm/include/asm/hardware/sp810.h
> index 2cdcf44,afd7e91..0000000
> --- a/arch/arm/include/asm/hardware/sp810.h
> +++ b/arch/arm/include/asm/hardware/sp810.h
> @@@ -50,6 -50,14 +50,8 @@@
>   #define SCPCELLID2            0xFF8
>   #define SCPCELLID3            0xFFC
>   
>  -#define SCCTRL_TIMEREN0SEL_REFCLK     (0 << 15)
>  -#define SCCTRL_TIMEREN0SEL_TIMCLK     (1 << 15)
>  -
>  -#define SCCTRL_TIMEREN1SEL_REFCLK     (0 << 17)
>  -#define SCCTRL_TIMEREN1SEL_TIMCLK     (1 << 17)
>  -
> + #define SCCTRL_TIMERENnSEL_SHIFT(n)   (15 + ((n) * 2))
> + 
>   static inline void sysctl_soft_reset(void __iomem *base)
>   {
>         /* switch to slow mode */

Pawel,

Does this look OK for you?

Thanks,
Mike
