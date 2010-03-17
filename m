From: Tilman Schmidt <tilman@imap.cc>
Subject: Re: linux-next: Tree for March 17 (gigaset isdn)
Date: Wed, 17 Mar 2010 18:30:27 +0100
Message-ID: <4BA111B3.3040108@imap.cc>
References: <20100317160803.78c63f94.sfr@canb.auug.org.au> <4BA0F78F.9090804@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigD2453755781AE0EC2A96753F"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4BA0F78F.9090804@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Hansjoerg Lipp <hjlipp@web.de>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigD2453755781AE0EC2A96753F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 17.03.2010 16:38 schrieb Randy Dunlap:
> On 03/16/10 22:08, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20100316:
>=20
>=20
> ERROR: "gigaset_isdn_regdev" [drivers/isdn/gigaset/gigaset.ko] undefine=
d!
> ERROR: "gigaset_isdn_regdrv" [drivers/isdn/gigaset/gigaset.ko] undefine=
d!
> ERROR: "gigaset_isdn_unregdrv" [drivers/isdn/gigaset/gigaset.ko] undefi=
ned!
> ERROR: "gigaset_isdn_unregdev" [drivers/isdn/gigaset/gigaset.ko] undefi=
ned!
>=20
> when
> # CONFIG_ISDN_I4L is not set
> # CONFIG_ISDN_CAPI is not set
> CONFIG_ISDN_DRV_GIGASET=3Dm # or =3Dy
>=20

Rats, you're right. Sorry for the oversight. I will create a fix right aw=
ay.

Thanks,
Tilman

--=20
Tilman Schmidt                    E-Mail: tilman@imap.cc
Bonn, Germany
Diese Nachricht besteht zu 100% aus wiederverwerteten Bits.
Unge=F6ffnet mindestens haltbar bis: (siehe R=FCckseite)


--------------enigD2453755781AE0EC2A96753F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkuhEb0ACgkQQ3+did9BuFvGEACffyXNiVqTjJcNxwDvvRgDl025
j5oAn0I9akJDhJEQ22Z89207kOQK5W9r
=rDCq
-----END PGP SIGNATURE-----

--------------enigD2453755781AE0EC2A96753F--
