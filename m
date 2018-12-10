From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the net-next
 tree
Date: Mon, 10 Dec 2018 13:05:25 +1100
Message-ID: <20181210130525.2586bfac@canb.auug.org.au>
References: <20181209232722.GA4425@bistromath.localdomain>
        <20181209.163152.1641648923109797638.davem@davemloft.net>
        <20181210114848.3f726482@canb.auug.org.au>
        <20181209.165443.617494663676711708.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9+/ZkCprHoHTAepI2YZ/Gm="; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181209.165443.617494663676711708.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sd@queasysnail.net, andrew@lunn.ch, hkallweit1@gmail.com, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com
List-Id: linux-next.vger.kernel.org

--Sig_/9+/ZkCprHoHTAepI2YZ/Gm=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sun, 09 Dec 2018 16:54:43 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 10 Dec 2018 11:48:48 +1100
>=20
> > That is fine as a last resort, but it is probably less disruptive to
> > find these things before you try to push i.e. as part of the "apply the
> > patch" otherwise you could end up having to rebase a whole lot of later
> > commits. =20
>=20
> I meant to imply that we should do both, something I do pre-commit
> and something that double checks again when I push.
>=20
> Sorry if I wasn't clear.

No worries, belts and braces :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/9+/ZkCprHoHTAepI2YZ/Gm=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwNyeUACgkQAVBC80lX
0GxjiQf/WzApR3hqpqkxRKgT0v1hr+M9rt6VQl2D6Kc40LOEo/j8dHJBwuei/W8n
1WnRPHkvIcaV54u2srwUSZAnkwell7qh0bgePO1S73xQhMxuAeRcIYJjaB6fsh5c
OGdVcQFeRB4Z4yUsTkMgP2WPwKlolFNdbof8MKR/iP0YTKYH3+c/nzREbYGiqFA2
C6wlLIj3MlCYa0NZrsFmtqNsw5+LDskM0uQPx4nERsjSD7LsTUWjxI4wHscYVVGx
US2GnU1UUo06Ndh2113ewVWEBJNgCIuDf5aBBIs6rbd6+8SVHzZqdKqccxhIaO1I
g/bXxOvlR/2ppp4CRwXgkaKP+jOrmQ==
=pHwH
-----END PGP SIGNATURE-----

--Sig_/9+/ZkCprHoHTAepI2YZ/Gm=--
