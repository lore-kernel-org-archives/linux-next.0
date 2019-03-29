From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Subject: Re: linux-next: Fixes tag needs some work in the net tree
Date: Fri, 29 Mar 2019 09:46:06 -0700
Message-ID: <406ed115ce8c3bd690c0d434f8d5a5062ab4f793.camel@intel.com>
References: <20190329142605.5e3263d1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-B1aM37n2wI2XBDiwefHM"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329142605.5e3263d1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arvind Sankar <niveditas98@gmail.com>
List-Id: linux-next.vger.kernel.org


--=-B1aM37n2wI2XBDiwefHM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-29 at 14:26 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> In commit
>=20
>   dabb8338be53 ("igb: Fix WARN_ONCE on runtime suspend")
>=20
> Fixes tag
>=20
>   Fixes: fb29f76cc566 ("igb: Fix an issue that PME is not enabled during
> runtime suspend")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Did you mean:
>=20
> Fixes: 1fb3a7a75e2e ("igb: Fix an issue that PME is not enabled during
> runtime suspend")
>=20

Yes

--=-B1aM37n2wI2XBDiwefHM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiTyZWz+nnTrOJ1LZ5W/vlVpL7c4FAlyeS84ACgkQ5W/vlVpL
7c7U3hAAjDrnd5mqw58ZPFtepxXH+dM4967nXKVYwZjxpc/bHcLYblMLw3haHifK
EcRUneeqG7zg4Ps/CiNiVg+BXMtOtFkt7465GPVL5F4/pbcTahP7jYqO9cWX6pEt
zG6dseCaK+up5WuQ5RW50+tVS6MOKwANDvB+oZ4qzfEUymhX2/QRV6GJhPl42e0m
viAIa+leMtCWp294igX0ltZ22gAUQhpW6C9zlrhpwFFdJmy3i71uZN/HaARBFnDi
OJVGeO25yBpDrCYWl9cYBw1D+6SDEJYPAEPQSolZ9l4iBjYM/SqJlKvkAG7U9IiW
EOVYEb505LpYB2vexX29wzMhaz9WUG8x2CrDuj5cecSPIOKNasWEEYnblWLFNSvU
45dC24IevWFc3ZbySh66fI+orBxeuV6IhK8iDTL7/kY0dE6zq8Ra5e3AJBMKn1Iw
/Q2mQL4gJujdyIIZd9Z+SmyGlD6GmGQu7TyDtY8cpSB9VZimCv1lHML/aXePBT2Q
Iwe9rrW8jGTDB2UqJYs+qn91hDDRX8b5bE+bcu37zZoOcQizsgtbUZ4xNMcnqqz5
ChDR7C7++YQ4kRVUs31EJKxbrJm5eKV+US1n4jYXdyM62VaSZutt/V4X9X+blIM0
sNwSTLH0DH/kHgGFS1WKI18HPzLuOmUUQhDp7fiGPjx3M7+XXIk=
=jE88
-----END PGP SIGNATURE-----

--=-B1aM37n2wI2XBDiwefHM--
