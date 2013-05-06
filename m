From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: Splitting stk1160-ac97 as a module (Re: linux-next: Tree for May
 1 (media/usb/stk1160))
Date: Mon, 6 May 2013 10:11:52 -0300
Message-ID: <20130506131150.GB18007@localhost>
References: <20130501183734.7ad1efca2d06e75432edabbd@canb.auug.org.au>
 <518157EB.3010700@infradead.org>
 <51827DB1.7000304@redhat.com>
 <20130504172142.GA21656@localhost>
 <20130504195950.GA3254@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130504195950.GA3254@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, Ezequiel =?utf-8?Q?Garc=C3=ADa?= <elezegarcia@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, linux-kbuild@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Sat, May 04, 2013 at 09:59:50PM +0200, Yann E. MORIN wrote:
> Ezequiel, All,
>=20
> On Sat, May 04, 2013 at 02:21:44PM -0300, Ezequiel Garcia wrote:
> > I'm trying to split the ac97 support into a separate module.
> > So far I've managed to do this with two different approaches,
> > but both of them are broken in some way :-(
> >=20
> > Couple questions:
> >=20
> > 1. Is it possible to force two symbols to be both built-in (=3Dy) o=
r both
> > modules (=3Dm)? This would make one of my solutions work.
>=20
> If they are always the same value, there is no need to have two symbo=
ls
> in the first place.
>=20
> However, given the original problem from this thread, if what you mea=
nt
> was to have the second symbol either 'n' or the same as the first sym=
bol,
> ie. the following table:
>=20
>     A:  n   m   m   y   y
>     B:  n   n   m   n   y
>=20
> Then the closest I came up with is:
>=20
>     config MODULES
>         bool "Modules"
>    =20
>     config A
>         tristate "A"
>    =20
>     config B_dummy
>         bool "B"
>         depends on A
>    =20
>     config B
>         tristate
>         default m if A=3Dm && B_dummy
>         default y if A=3Dy && B_dummy
>=20
> where B_dummy is not used outside of Kconfig, and only A and B are th=
e
> symbols of interest (eg. to build the drivers).
>=20

That worked like a charm!

Thanks a lot,
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
