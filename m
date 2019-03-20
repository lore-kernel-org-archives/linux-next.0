From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: Re: linux-next: Fixes tag needs some work in the net tree
Date: Wed, 20 Mar 2019 10:45:05 +0100
Message-ID: <20190320094504.GA16193@localhost.localdomain>
References: <20190320081549.7112c33c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190320081549.7112c33c@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi all,
>=20
> In commit
>=20
>   13f61dfc5235 ("mt76: fix schedule while atomic in mt76x02_reset_state")
>=20
> Fixes tag
>=20
>   Fixes: e4ebb8b403d1 ("mt76: mt76x2: implement full device restart on wa=
tchdog reset")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Did you mean:
>=20
>   004960423fe1 ("mt76: mt76x2: implement full device restart on watchdog =
reset")

Hi Stephen,

yes, the right Fixes tag is:
004960423fe1 ("mt76: mt76x2: implement full device restart on watchdog rese=
t")

Sorry for the mistake.

Regards,
Lorenzo

>=20
> --=20
> Cheers,
> Stephen Rothwell



--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXJILnAAKCRA6cBh0uS2t
rLs1APsHBqDbJ8Dnrh33NzyBoydGceQK5C9X0KLG7NNv2zDm+AEA2CUnUhrv+gGQ
4h9qAzCppfRa+tbcAkyvr+pprstOPwE=
=0ehf
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
