From: Mike Turquette <mturquette@linaro.org>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Mon, 17 Jun 2013 11:49:30 -0700
Message-ID: <20130617184930.9136.76869@quantum>
References: <20130617172719.f19a76fae98cc7ef82b91ae9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130617172719.f19a76fae98cc7ef82b91ae9@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stephen Warren <swarren@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Joseph Lo <josephl@nvidia.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

Quoting Stephen Rothwell (2013-06-17 00:27:19)
> Hi Mike,
> 
> Today's linux-next merge of the clk tree got a conflict in
> drivers/clk/tegra/clk-tegra114.c between commit 31972fd95527 ("clk:
> tegra114: implement wait_for_reset and disable_clock for
> tegra_cpu_car_ops") from the arm-soc tree and commit d53442e94db0 ("clk:
> tegra: override bits for Tegra114 PLLM") from the clk tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good.

Thanks,
Mike

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/clk/tegra/clk-tegra114.c
> index 40d939d,7fe36ea..0000000
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@@ -250,9 -251,10 +251,13 @@@
>   #define CLK_SOURCE_XUSB_DEV_SRC 0x60c
>   #define CLK_SOURCE_EMC 0x19c
>   
>  +/* Tegra CPU clock and reset control regs */
>  +#define CLK_RST_CONTROLLER_CPU_CMPLX_STATUS   0x470
>  +
> + /* PLLM override registers */
> + #define PMC_PLLM_WB0_OVERRIDE 0x1dc
> + #define PMC_PLLM_WB0_OVERRIDE_2 0x2b0
> + 
>   static int periph_clk_enb_refcnt[CLK_OUT_ENB_NUM * 32];
>   
>   static void __iomem *clk_base;
