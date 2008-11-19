From: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: linux-next: Tree for November 19 (mtd build error)
Date: Wed, 19 Nov 2008 19:18:07 +0000
Message-ID: <1227122287.3052.7.camel@achroite>
References: <20081119175917.7d21cf77.sfr@canb.auug.org.au>
	 <20081119105321.477e618a.randy.dunlap@oracle.com>
	 <1227121104.27728.618.camel@macbook.infradead.org>
	 <492463A1.3000306@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754870AbYKSTSY@vger.kernel.org>
In-Reply-To: <492463A1.3000306@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-net-drivers@solarflare.com
List-Id: linux-next.vger.kernel.org

On Wed, 2008-11-19 at 11:06 -0800, Randy Dunlap wrote:
> David Woodhouse wrote:
> > On Wed, 2008-11-19 at 10:53 -0800, Randy Dunlap wrote:
> >> On Wed, 19 Nov 2008 17:59:17 +1100 Stephen Rothwell wrote:
> >>
> >> (.text+0x104879): undefined reference to `add_mtd_device'
> >> (.text+0x1048e1): undefined reference to `del_mtd_device'
> >> mtd.c:(.text+0x104999): undefined reference to `mtd_erase_callback=
'
> >>
> >>
> >> config attached.
> >=20
> > CONFIG_SFC_MTD=3Dy
> >=20
> > What's that?
>=20
> drivers/net/sfc/Kconfig:
>=20
> config SFC_MTD
> 	bool "Solarflare Solarstorm SFC4000 flash MTD support"
> 	depends on SFC && MTD
> 	default y
> 	help
> 	  This exposes the on-board flash memory as an MTD device (e.g.
>           /dev/mtd1).  This makes it possible to upload new boot code
>           to the NIC.
>=20
>=20
> sfc people added to cc.

=EF=BB=BFPlease use the address linux-net-drivers@solarflare.com, as li=
sted in
MAINTAINERS.=EF=BB=BF  There are several of us working on the driver, a=
nd they
no longer include Michael Brown.

David Woodhouse wrote:
> =EF=BB=BFSounds like this was built-in while CONFIG_MTD=3Dm

So does the dependency need to be something like
"depends on SFC && MTD && !(SFC=3Dy && MTD=3Dm)"?

Ben.

--=20
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
