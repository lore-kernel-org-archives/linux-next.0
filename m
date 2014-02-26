From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the final tree
 (akpm-current tree related)
Date: Thu, 27 Feb 2014 10:42:11 +1100
Message-ID: <20140227104211.b2a4a5a1066fcf8ac2640ce3@canb.auug.org.au>
References: <20140226191627.9adf3c8e1548e2016c16557c@canb.auug.org.au>
	<20140226100234.GA23064@thin>
	<20140227100026.1cc909f2722b16b6d11a7b91@canb.auug.org.au>
	<20140226231916.GB17589@jtriplet-mobl1>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__27_Feb_2014_10_42_11_+1100_EHcT7JP8LniiOa4S"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140226231916.GB17589@jtriplet-mobl1>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Triplett <josh@joshtriplett.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__27_Feb_2014_10_42_11_+1100_EHcT7JP8LniiOa4S
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Josh,

On Wed, 26 Feb 2014 15:19:16 -0800 Josh Triplett <josh@joshtriplett.org> wr=
ote:
>
> Please also fold in my patch "ia64: select CONFIG_TTY for use of
> tty_write_message in unaligned".  (Just bounced you a copy.)

Done.

> There's an s390 issue as well which needs the same fix (make the
> top-level architecture symbol select TTY).
>=20
> I'll look at the other issues tonight.

OK, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__27_Feb_2014_10_42_11_+1100_EHcT7JP8LniiOa4S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTDnvXAAoJEMDTa8Ir7ZwVH9UP/i19cgaUOLpAWqyWENIzFySX
Xu31FhSFagJXyWzUr6Af3RjpiL140CXoFtUOOjLjqWZWfjYe/N1ak7+uSH7WwuGW
ZVOdQ6GMOsC+iPWLkDwgDlZTlbEWcyysoxAYQ8m1Hm5QFX1sZ4pIjiTtDDP0uZF8
r9Evsx5zReg+utkERJr2yT3YLtOmvndYZqtI5TdM6fXtSxnWAKycY2cLiXWmZJSi
v8FD9Sx63tZPyzn1mFqrBDzyD/lrapA1X72fCwCl2Ru87YgAiHPPts4ZVj2/H15o
6yntpTg2m1KJKD7qP1tHR2g1UfuBS0puBxhHAWhPMFEa0eAYDSA8q3vWnAad/BJe
mQ+nRtphTMv5UgOqM6rodFgDKVIjwAXZsGrxQzFlJmq0lbacjdyR52RPkb9wXAya
my7DakY3K2NuuEs63kbYPbeuBo7dai1t/ZOlhQneswGlq9G0lysMIKnZF4e3+uga
EOxEQWS4wX++deId3/GVo0Q7z8EXhMrEDdDVnnnG+xtHZBfo7+/c1U0CmFOnfikJ
QjUEy0fcetMhKGU1HleIY62poVKh039t10A9Zm5HVUSy95DXclhq2rFa31lk0uul
Xjg1ACZMyhmrr8hQ5SxVdPoJAPnmynoT/O7CNk6i5nuSPJ093QB3MjLkp0+XqVOo
GBUEO8ofEhiKX0plHfay
=hZ8I
-----END PGP SIGNATURE-----

--Signature=_Thu__27_Feb_2014_10_42_11_+1100_EHcT7JP8LniiOa4S--
