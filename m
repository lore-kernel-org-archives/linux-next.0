From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH V2] ARM: imx: add i.MX7ULP cpuidle support
Date: Wed, 16 Jan 2019 00:10:43 +1100
Message-ID: <20190116001043.69529b90@canb.auug.org.au>
References: <1547185955-2395-1-git-send-email-Anson.Huang@nxp.com>
        <20190114005600.GN11426@dragon>
        <e892304bde543b86a9d0ad4409d0c6a1f509a312.camel@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/t.tgKeD2y1yX06Oh8kdGcV0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e892304bde543b86a9d0ad4409d0c6a1f509a312.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Anson Huang <anson.huang@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/t.tgKeD2y1yX06Oh8kdGcV0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Leonard,

On Tue, 15 Jan 2019 12:30:23 +0000 Leonard Crestez <leonard.crestez@nxp.com=
> wrote:
>
> On 1/14/19 2:56 AM, Shawn Guo wrote:
> > On Fri, Jan 11, 2019 at 05:57:30AM +0000, Anson Huang wrote: =20
> > > This patch adds cpuidle support for i.MX7ULP, 3 cpuidle
> > > states supported as below:
> > >=20
> > > 1. WFI, just ARM wfi;
> > > 2. WAIT mode, mapped to SoC's partial stop mode #3;
> > > 3. STOP mode, mapped to SoC's partial stop mode #1.
> > >=20
> > > In WAIT mode, system clock and bus clock will be enabled;
> > > In STOP mode, system clock and bus clock will be disabled.
> > >=20
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com> =20
> >=20
> > Applied, thanks.
> >  =20
>=20
> Hello,
>=20
> I'm not sure if anyone else already noticed but it seems the
> arch/arm/mach-imx/cpuidle-imx7ulp.c file was dropped?
>=20
> It's not in your tree:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/commit=
/?h=3Dimx/soc&id=3Dcf2d2d392906f5603cf0d0f3630f6386babf7e4b
>=20
> This causes build failures in next-20190115 with imx_v6_v7_defconfig.

That file does not exist in Linus' tree either.  And there are no
commits in linux-next that add it.


--=20
Cheers,
Stephen Rothwell

--Sig_/t.tgKeD2y1yX06Oh8kdGcV0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw929MACgkQAVBC80lX
0GyDEwgAmGv+Q6po4XzsOJ+7bVXlMggp3rkzl4n6ZYgfNPZgMeqcvHJ7/zVxj+TO
nesTdlgal/q+X5x0f39z8t4+UcXJGIpctOULWDMIRt3n5G0aLIIlTSFae9yf3+gY
2UvR483ALXoBUsoBFxJfSyBedzVvt+syAenCsN2RgSJxWe5ymPNX9/LZPjrJULEs
d32HvN4hrGcIwKoHLceHRUCi4OBA9yJ2qEkAXgoPFFMBA5LaLM36SNAwr7yGw+SV
kJQAToTo4IAs7LntQr/Kt1B/9n7VXV6UcrWRAKzwEp4ibIo8DTfL7Clglfgw+UgD
NXmau7HKeWeCpAjmy7kprK2pgtSpbQ==
=34oG
-----END PGP SIGNATURE-----

--Sig_/t.tgKeD2y1yX06Oh8kdGcV0--
