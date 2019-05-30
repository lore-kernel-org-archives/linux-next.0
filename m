From: Maxim Uvarov <muvarov@gmail.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 30 May 2019 09:51:03 +0300
Message-ID: <CAJGZr0KLtXeJ6uKWqFcqFY=25XbjAfJ_LUSjM8waXHsFpRZVMQ@mail.gmail.com>
References: <20190530095632.34685e5b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190530095632.34685e5b@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Trent Piepho <tpiepho@impinj.com>, Vivien Didelot <vivien.didelot@gmail.com>
List-Id: linux-next.vger.kernel.org

Merge fix looks like correct. Might be my fault I sent dp83867 patches
against linux.git, not linux-next.git. If you want I can resend
updated version for linux-next.

Max.

=D1=87=D1=82, 30 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 02:56, Stephen Roth=
well <sfr@canb.auug.org.au>:
>
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>   drivers/net/phy/dp83867.c
>
> between commits:
>
>   2b892649254f ("net: phy: dp83867: Set up RGMII TX delay")
>   333061b92453 ("net: phy: dp83867: fix speed 10 in sgmii mode")
>
> from the net tree and commits:
>
>   c11669a2757e ("net: phy: dp83867: Rework delay rgmii delay handling")
>   27708eb5481b ("net: phy: dp83867: IO impedance is not dependent on RGMI=
I delay")
>
> from the net-next tree.
>
> I fixed it up (I took a guess - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/net/phy/dp83867.c
> index c71c7d0f53f0,3bdf94043693..000000000000
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c
> @@@ -26,18 -26,11 +26,19 @@@
>
>   /* Extended Registers */
>   #define DP83867_CFG4            0x0031
>  +#define DP83867_CFG4_SGMII_ANEG_MASK (BIT(5) | BIT(6))
>  +#define DP83867_CFG4_SGMII_ANEG_TIMER_11MS   (3 << 5)
>  +#define DP83867_CFG4_SGMII_ANEG_TIMER_800US  (2 << 5)
>  +#define DP83867_CFG4_SGMII_ANEG_TIMER_2US    (1 << 5)
>  +#define DP83867_CFG4_SGMII_ANEG_TIMER_16MS   (0 << 5)
>  +
>   #define DP83867_RGMIICTL      0x0032
>   #define DP83867_STRAP_STS1    0x006E
> + #define DP83867_STRAP_STS2    0x006f
>   #define DP83867_RGMIIDCTL     0x0086
>   #define DP83867_IO_MUX_CFG    0x0170
>  +#define DP83867_10M_SGMII_CFG   0x016F
>  +#define DP83867_10M_SGMII_RATE_ADAPT_MASK BIT(7)
>
>   #define DP83867_SW_RESET      BIT(15)
>   #define DP83867_SW_RESTART    BIT(14)
> @@@ -255,10 -321,18 +329,17 @@@ static int dp83867_config_init(struct p
>                 ret =3D phy_write(phydev, MII_DP83867_PHYCTRL, val);
>                 if (ret)
>                         return ret;
>  -      }
>
>  -      /* If rgmii mode with no internal delay is selected, we do NOT us=
e
>  -       * aligned mode as one might expect.  Instead we use the PHY's de=
fault
>  -       * based on pin strapping.  And the "mode 0" default is to *use*
>  -       * internal delay with a value of 7 (2.00 ns).
>  -       */
>  -      if ((phydev->interface >=3D PHY_INTERFACE_MODE_RGMII_ID) &&
>  -          (phydev->interface <=3D PHY_INTERFACE_MODE_RGMII_RXID)) {
>  +              /* Set up RGMII delays */
> ++              /* If rgmii mode with no internal delay is selected,
> ++               * we do NOT use aligned mode as one might expect.  Inste=
ad
> ++               * we use the PHY's default based on pin strapping.  And =
the
> ++               * "mode 0" default is to *use* * internal delay with a
> ++               * value of 7 (2.00 ns).
> ++              */
>                 val =3D phy_read_mmd(phydev, DP83867_DEVADDR, DP83867_RGM=
IICTL);
>
> +               val &=3D ~(DP83867_RGMII_TX_CLK_DELAY_EN | DP83867_RGMII_=
RX_CLK_DELAY_EN);
>                 if (phydev->interface =3D=3D PHY_INTERFACE_MODE_RGMII_ID)
>                         val |=3D (DP83867_RGMII_TX_CLK_DELAY_EN | DP83867=
_RGMII_RX_CLK_DELAY_EN);
>
> @@@ -275,41 -349,14 +356,41 @@@
>
>                 phy_write_mmd(phydev, DP83867_DEVADDR, DP83867_RGMIIDCTL,
>                               delay);
> -
> -               if (dp83867->io_impedance >=3D 0)
> -                       phy_modify_mmd(phydev, DP83867_DEVADDR, DP83867_I=
O_MUX_CFG,
> -                                      DP83867_IO_MUX_CFG_IO_IMPEDANCE_CT=
RL,
> -                                      dp83867->io_impedance &
> -                                      DP83867_IO_MUX_CFG_IO_IMPEDANCE_CT=
RL);
>         }
>
> +       /* If specified, set io impedance */
> +       if (dp83867->io_impedance >=3D 0)
> +               phy_modify_mmd(phydev, DP83867_DEVADDR, DP83867_IO_MUX_CF=
G,
> +                              DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK,
> +                              dp83867->io_impedance);
> +
>  +      if (phydev->interface =3D=3D PHY_INTERFACE_MODE_SGMII) {
>  +              /* For support SPEED_10 in SGMII mode
>  +               * DP83867_10M_SGMII_RATE_ADAPT bit
>  +               * has to be cleared by software. That
>  +               * does not affect SPEED_100 and
>  +               * SPEED_1000.
>  +               */
>  +              ret =3D phy_modify_mmd(phydev, DP83867_DEVADDR,
>  +                                   DP83867_10M_SGMII_CFG,
>  +                                   DP83867_10M_SGMII_RATE_ADAPT_MASK,
>  +                                   0);
>  +              if (ret)
>  +                      return ret;
>  +
>  +              /* After reset SGMII Autoneg timer is set to 2us (bits 6 =
and 5
>  +               * are 01). That is not enough to finalize autoneg on som=
e
>  +               * devices. Increase this timer duration to maximum 16ms.
>  +               */
>  +              ret =3D phy_modify_mmd(phydev, DP83867_DEVADDR,
>  +                                   DP83867_CFG4,
>  +                                   DP83867_CFG4_SGMII_ANEG_MASK,
>  +                                   DP83867_CFG4_SGMII_ANEG_TIMER_16MS);
>  +
>  +              if (ret)
>  +                      return ret;
>  +      }
>  +
>         /* Enable Interrupt output INT_OE in CFG3 register */
>         if (phy_interrupt_is_valid(phydev)) {
>                 val =3D phy_read(phydev, DP83867_CFG3);



--=20
Best regards,
Maxim Uvarov
