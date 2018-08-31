From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: linux-next: Tree for Aug 31 (nixge.c and phy)
Date: Fri, 31 Aug 2018 19:54:27 +0200
Message-ID: <20180831175427.GC19733@lunn.ch>
References: <20180831130356.6b0fd971@canb.auug.org.au>
 <fe65a78f-51fb-248a-565a-f21594caa957@infradead.org>
 <CAJYdmeMYT_L841XsUOYYepen7WOSp-6zU40QbRy97G5GPzAygg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJYdmeMYT_L841XsUOYYepen7WOSp-6zU40QbRy97G5GPzAygg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer.private@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org
List-Id: linux-next.vger.kernel.org

> @@ -20,7 +20,6 @@ config NI_XGE_MANAGEMENT_ENET
>         tristate "National Instruments XGE management enet support"
>         depends on HAS_IOMEM && HAS_DMA
>         select PHYLIB
> -       select OF_MDIO
>         help
>           Simple LAN device for debug or management purposes. Can
>           support either 10G or 1G PHYs via SFP+ ports.

Hi Moritz

Since you are targeting both DT and non-DT systems, you cannot
unconditionally select OF_MDIO

What might work is

         select OF_MDIO if OF

	 Andrew
