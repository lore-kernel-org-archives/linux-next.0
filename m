From: Moritz Fischer <moritz.fischer.private@gmail.com>
Subject: Re: linux-next: Tree for Aug 31 (nixge.c and phy)
Date: Fri, 31 Aug 2018 09:36:15 -0700
Message-ID: <CAJYdmeMYT_L841XsUOYYepen7WOSp-6zU40QbRy97G5GPzAygg@mail.gmail.com>
References: <20180831130356.6b0fd971@canb.auug.org.au> <fe65a78f-51fb-248a-565a-f21594caa957@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fe65a78f-51fb-248a-565a-f21594caa957@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Randy, Dave,

On Fri, Aug 31, 2018 at 8:57 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 08/30/2018 08:03 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20180830:
> >
>
> on i386:
>
> WARNING: unmet direct dependencies detected for OF_MDIO
>   Depends on [n]: OF [=n] && PHYLIB [=y]
>   Selected by [y]:
>   - NI_XGE_MANAGEMENT_ENET [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_NI [=y] && HAS_IOMEM [=y] && HAS_DMA [=y]
>
> WARNING: unmet direct dependencies detected for OF_MDIO
>   Depends on [n]: OF [=n] && PHYLIB [=y]
>   Selected by [y]:
>   - NI_XGE_MANAGEMENT_ENET [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_NI [=y] && HAS_IOMEM [=y] && HAS_DMA [=y]
>
> drivers/net/phy/mdio-gpio.o: In function `mdio_gpio_probe':
> mdio-gpio.c:(.text+0x294): undefined reference to `of_mdiobus_register'
> drivers/net/phy/mdio-hisi-femac.o: In function `hisi_femac_mdio_probe':
> mdio-hisi-femac.c:(.text+0x352): undefined reference to `of_mdiobus_register'
> drivers/net/ethernet/ni/nixge.o: In function `nixge_probe':
> nixge.c:(.text+0x1357): undefined reference to `of_mdiobus_register'
> drivers/net/ethernet/ni/nixge.o: In function `nixge_open':
> nixge.c:(.text+0x21e9): undefined reference to `of_phy_connect'
> drivers/net/usb/lan78xx.o: In function `lan78xx_probe':
> lan78xx.c:(.text+0x5e29): undefined reference to `of_mdiobus_register'
> /home/rdunlap/lnx/next/linux-next-20180831/Makefile:1035: recipe for target 'vmlinux' failed
>
>
> Full randconfig file is attached.
>
>
> --
> ~Randy

Would:

diff --git a/drivers/net/ethernet/ni/Kconfig b/drivers/net/ethernet/ni/Kconfig
index 04e315704f71..83b6922767af 100644
--- a/drivers/net/ethernet/ni/Kconfig
+++ b/drivers/net/ethernet/ni/Kconfig
@@ -20,7 +20,6 @@ config NI_XGE_MANAGEMENT_ENET
        tristate "National Instruments XGE management enet support"
        depends on HAS_IOMEM && HAS_DMA
        select PHYLIB
-       select OF_MDIO
        help
          Simple LAN device for debug or management purposes. Can
          support either 10G or 1G PHYs via SFP+ ports.


be the right solution? I did a quick build-test with the configuration
above and it seems to fix the issue.
Do I submit a follow-up patch to Dave?

Thanks,

Moritz
