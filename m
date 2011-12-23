From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure
Date: Fri, 23 Dec 2011 17:08:55 +1100
Message-ID: <20111223170855.4af1442474b6d72afa7574b8@canb.auug.org.au>
References: <CAHfT02u5as-YvAvwznMveNY_FbeDWLbj0NL6O78MRfeLQ5mpsA@mail.gmail.com>
	<CAHfT02tghwTyzEFSjF4dP+dtHBxwjmOpHLd_JmgiV0py3EFb8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__23_Dec_2011_17_08_55_+1100_2rbQR_/kpR/j6.T8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:43432 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753630Ab1LWGJE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Dec 2011 01:09:04 -0500
In-Reply-To: <CAHfT02tghwTyzEFSjF4dP+dtHBxwjmOpHLd_JmgiV0py3EFb8g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Carles Pey <carles.pey@gmail.com>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

--Signature=_Fri__23_Dec_2011_17_08_55_+1100_2rbQR_/kpR/j6.T8
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Just letting Rusty know]

On Fri, 23 Dec 2011 00:55:00 +0100 Carles Pey <carles.pey@gmail.com> wrote:
>
> Hi all,
>=20
> It failed while building today's linux-next commit 4765f871e50f0 on i686:
>=20
> drivers/block/paride/bpck6.c:24: error: expected =E2=80=98=3D=E2=80=99, =
=E2=80=98,=E2=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99
> or =E2=80=98__attribute__=E2=80=99 before =E2=80=98verbose=E2=80=99
> drivers/block/paride/bpck6.c: In function =E2=80=98bpck6_connect=E2=80=99:
> drivers/block/paride/bpck6.c:94: error: =E2=80=98verbose=E2=80=99 undecla=
red (first
> use in this function)
> drivers/block/paride/bpck6.c:94: error: (Each undeclared identifier is
> reported only once
> drivers/block/paride/bpck6.c:94: error: for each function it appears in.)
> drivers/block/paride/bpck6.c: In function =E2=80=98bpck6_disconnect=E2=80=
=99:
> drivers/block/paride/bpck6.c:118: error: =E2=80=98verbose=E2=80=99 undecl=
ared (first
> use in this function)
> drivers/block/paride/bpck6.c: In function =E2=80=98bpck6_test_port=E2=80=
=99:
> drivers/block/paride/bpck6.c:128: error: =E2=80=98verbose=E2=80=99 undecl=
ared (first
> use in this function)
> drivers/block/paride/bpck6.c: In function =E2=80=98bpck6_probe_unit=E2=80=
=99:
> drivers/block/paride/bpck6.c:162: error: =E2=80=98verbose=E2=80=99 undecl=
ared (first
> use in this function)
> drivers/block/paride/bpck6.c: In function =E2=80=98bpck6_init=E2=80=99:
> drivers/block/paride/bpck6.c:253: error: =E2=80=98verbose=E2=80=99 undecl=
ared (first
> use in this function)
> drivers/block/paride/bpck6.c: In function =E2=80=98__check_verbose=E2=80=
=99:
> drivers/block/paride/bpck6.c:266: error: =E2=80=98verbose=E2=80=99 undecl=
ared (first
> use in this function)
> drivers/block/paride/bpck6.c:266: warning: type defaults to =E2=80=98int=
=E2=80=99 in
> declaration of =E2=80=98type name=E2=80=99
> drivers/block/paride/bpck6.c:266: warning: type defaults to =E2=80=98int=
=E2=80=99 in
> declaration of =E2=80=98type name=E2=80=99
> drivers/block/paride/bpck6.c:266: warning: type defaults to =E2=80=98int=
=E2=80=99 in
> declaration of =E2=80=98type name=E2=80=99
> drivers/block/paride/bpck6.c:266: error: size of array =E2=80=98type name=
=E2=80=99 is negative
> drivers/block/paride/bpck6.c:266: warning: type defaults to =E2=80=98int=
=E2=80=99 in
> declaration of =E2=80=98type name=E2=80=99
> drivers/block/paride/bpck6.c:266: warning: type defaults to =E2=80=98int=
=E2=80=99 in
> declaration of =E2=80=98type name=E2=80=99
> drivers/block/paride/bpck6.c:266: warning: type defaults to =E2=80=98int=
=E2=80=99 in
> declaration of =E2=80=98type name=E2=80=99
> drivers/block/paride/bpck6.c: At top level:
> drivers/block/paride/bpck6.c:266: error: =E2=80=98verbose=E2=80=99 undecl=
ared here
> (not in a function)
> drivers/block/paride/bpck6.c:266: warning: type defaults to =E2=80=98int=
=E2=80=99 in
> declaration of =E2=80=98type name=E2=80=99
> make[2]: *** [drivers/block/paride/bpck6.o] Error 1
> make[1]: *** [drivers/block/paride] Error 2
> make: *** [drivers] Error 2
>=20
> Apparently due to the change in commit a367680f90a94
>=20
> Carles

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__23_Dec_2011_17_08_55_+1100_2rbQR_/kpR/j6.T8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO9Br3AAoJEECxmPOUX5FE26oQAJaCt2s6sXsexXa/lXAhkRRQ
bANnLdGVCU0G3g0vlrSJLX26f+G2/lCq/j5tahHqW6e6AzwG0ydHU9w97TEsZDOz
rqp6341Sb79vkfWELFrSwYIJr4aQGkWUbjn7HlZC5FiTha4CrJU9ke5MiZD7/AmB
IQgpQaY2BeoNdbbWUMLcYTgmS4fBMmqg24MEm3/jVPUd7FHIWGipZHCrpFM5OwpP
0sOlNM1gcIWHVufQqLbsu2mnsVINwYmdcd9WgRzvbLKr4necJtlwUoo9UWMDAY9N
iyOy+wX1KQtRbwQm0NRG6hEBQIZT923iDSAR5LYiywuja4q+SnHJP6PtVTbI6H0d
spkUdB5ALOV+yPf6aPbzCu16KRas4Ho9p0pMkp94jxcovplA9BZW17S7CqzYsQ9+
JjUcenhh0cO1ck13UlKZQueZixYjOoWKKTqDW5qUlzypYIyLp5jgOqP2PiUhCroo
w4XhBX4R++mss/jB8N/Kg5PHuTn3MFT9g1JNONiCRBM9RpBBjWojlUHdItb44Y8J
L1FTWtEdo2D1yh6shfOYLi1sHz24Am9/1Fdn7+YX1vBEStt1s7Puj0x0VUoue2wW
a9s7fafruT5aoaXW7VkB+3dHsyZXUVHZsr2vmXq78JF9yJM6kfOVNyCiiH+iHm5Z
xCMfFK2eNJtWOqs6/Q7N
=v52B
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Dec_2011_17_08_55_+1100_2rbQR_/kpR/j6.T8--
