From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Fri, 20 Jul 2018 08:09:06 +1000
Message-ID: <20180720080906.7a30c573@canb.auug.org.au>
References: <20180719120447.6e7ba23d@canb.auug.org.au>
        <cbc20089-6847-c0eb-5b5a-735245986be1@roeck-us.net>
        <20180719152940.0720e9c1@canb.auug.org.au>
        <6dabf12b-e3db-dfe8-101c-02772039e21a@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LzLmvbjsCm6bMmqi8Epcb=x"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <6dabf12b-e3db-dfe8-101c-02772039e21a@roeck-us.net>
Sender: netdev-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-next.vger.kernel.org

--Sig_/LzLmvbjsCm6bMmqi8Epcb=x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Thu, 19 Jul 2018 06:49:01 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 07/18/2018 10:29 PM, Stephen Rothwell wrote:
> >=20
> > On Wed, 18 Jul 2018 20:52:56 -0700 Guenter Roeck <linux@roeck-us.net> w=
rote: =20
> >>
> >> On 07/18/2018 07:04 PM, Stephen Rothwell wrote: =20
> >>>
> >>> After merging the net-next tree, today's linux-next build (x86_64
> >>> allmodconfig) produced this warning:
> >>>
> >>> *
> >>> * Restart config...
> >>> *
> >>> ....
> >>>
> >>> This is output by my "make allmodconfig" and only started after mergi=
ng
> >>> the net-next tree today.  It has continued for further merges/builds.
> >>>
> >>> I suspect commit
> >>>
> >>>     1323061a018a ("net: phy: sfp: Add HWMON support for module sensor=
s")
> >>>
> >>> which added an "imply" clause.
> >>>     =20
> >> I thought "imply" was better than "depends on HWMON || HWMON=3Dn", but=
 maybe
> >> not. Is that a caveat when using "imply", and does it mean that "imply"
> >> should better not be used ? =20
> >=20
> > I don't know, sorry.  It was just my best guess from what I could see
> > had changed.
> >=20
> > I wonder if it makes a difference that I am doing my "make
> > allmodconfig" on top of a previous "make allmodconfig" and some symbols
> > are marked as "NEW" (though they are not symbols related to the changes
> > that happened during the net-next tree merge)?
> >  =20
>=20
> I tried to reproduce the problem, but I don't see the message.
>=20
> What I do see, though, is that "make allmodconfig" on a clean tree,
> followed by "make menuconfig", results in configuration changes.
> Specifically,
>=20
>  > CONFIG_ARC_EMAC_CORE=3Dm
>  > CONFIG_ARC_EMAC=3Dm
>  > CONFIG_EMAC_ROCKCHIP=3Dm =20
>=20
> is removed by menuconfig, and a large number of "# ... is not set"
> configuration lines are added. Weird and bad, since several of the
> disabled configurations _should_ be enabled by "make allmodconfig",
> and a large number of hwmon drivers are affected. Bisect does point
> to "net: phy: sfp: Add HWMON support for module sensors", meaning
> "imply hwmon" does have severe side effects and can not be used.
>=20
> I'll try to find a fix.

OK, my mistake, the "make allmodconfig" works, the following "make"
causes the config restart.  (I am actually doing cross builds and using
an external object directory, in case that matters.)

I removed the "imply HWMON" line added by the above commit and the
problem went away.  Also, using "depends on HWMON || HWMON=3Dn" instead
of the imply fixes it.
--=20
Cheers,
Stephen Rothwell

--Sig_/LzLmvbjsCm6bMmqi8Epcb=x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltRDAIACgkQAVBC80lX
0GxxHQf+OZrmyaDgLRRpn8CK/+fFsZrYD3X68yddEhsdIfs3xBT98WDSe60LHBjE
1pm6JMktZVJnsA1tMxmQTytM/dm7kVIgXRDN4Zf7/42Y/+0ikcuYSOkEYueKDeAZ
3v5hNzF7HBI4CvLUxiNKH+t2/q4KgN+gMPeafGbIDat9rhDf1ssyLCgtGrDB2YhX
ZUiYJIWUqbOTucVm8YVaEZYT7otAn/I8RUGFs+E4QQ5CtLaH5UtVHkw3U9kFbZNY
aVWeFMJfLEp7fS1aZ6jAavrpoD7y3wttMuEZm1XDLaYt3KpVquMsU/6bwYBY/XP6
JP/L0fIG9wbrXTWn1XdLQybIXb0nTw==
=sElz
-----END PGP SIGNATURE-----

--Sig_/LzLmvbjsCm6bMmqi8Epcb=x--
