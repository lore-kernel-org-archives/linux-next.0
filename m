From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: manual merge of the pinctrl tree with the slave-dma tree
Date: Mon, 12 Nov 2012 09:05:00 +0530
Message-ID: <CAKohponChNTOw=h6V1wka9vO0n8QWObX4O9PjDfir8Fr8gidEA@mail.gmail.com>
References: <20121112141503.6539e4170839e8f18910bb8d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121112141503.6539e4170839e8f18910bb8d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, spear-devel <spear-devel@list.st.com>
List-Id: linux-next.vger.kernel.org

On 12 November 2012 08:45, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Linus,
>
> Today's linux-next merge of the pinctrl tree got a conflict in
> arch/arm/boot/dts/spear1340.dtsi between commit b47394911c26 ("ARM:
> SPEAr13xx: Pass DW DMAC platform data from DT") from the slave-dma tree and commit
> 4ddb1c295752 ("ARM: SPEAr: Add plgpio node in device tree dtsi files")
> from the pinctrl tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen. It looks perfectly fine. Thanks for keeping ascending order
of node names. :)

> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> diff --cc arch/arm/boot/dts/spear1340.dtsi
> index 8ea3f66,6c09eb0..0000000
> --- a/arch/arm/boot/dts/spear1340.dtsi
> +++ b/arch/arm/boot/dts/spear1340.dtsi
> @@@ -24,25 -24,12 +24,31 @@@
>                         status = "disabled";
>                 };
>
>  +              dma@ea800000 {
>  +                      slave_info {
>  +                              uart1_tx {
>  +                                      bus_id = "uart1_tx";
>  +                                      cfg_hi = <0x6000>;      /* 0xC << 11 */
>  +                                      cfg_lo = <0>;
>  +                                      src_master = <0>;
>  +                                      dst_master = <1>;
>  +                              };
>  +                              uart1_tx {
>  +                                      bus_id = "uart1_tx";
>  +                                      cfg_hi = <0x680>;       /* 0xD << 7 */
>  +                                      cfg_lo = <0>;
>  +                                      src_master = <1>;
>  +                                      dst_master = <0>;
>  +                              };
>  +                      };
>  +              };
>  +
> +               pinmux: pinmux@e0700000 {
> +                       compatible = "st,spear1340-pinmux";
> +                       reg = <0xe0700000 0x1000>;
> +                       #gpio-range-cells = <2>;
> +               };
> +
>                 spi1: spi@5d400000 {
>                         compatible = "arm,pl022", "arm,primecell";
>                         reg = <0x5d400000 0x1000>;
