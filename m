From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [Consult] About only one Signed-of-by for the patches
Date: Tue, 27 May 2014 11:34:00 +1000
Message-ID: <20140527113400.6fa2eeee@canb.auug.org.au>
References: <5383E91A.4010208@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iW4U/Zpxnz.+lgpr_nKyFB7"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50380 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751487AbaE0BeH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 May 2014 21:34:07 -0400
In-Reply-To: <5383E91A.4010208@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-next@vger.kernel.org

--Sig_/iW4U/Zpxnz.+lgpr_nKyFB7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Chen,

On Tue, 27 May 2014 09:23:38 +0800 Chen Gang <gang.chen.5i5j@gmail.com> wro=
te:
>
> I find some of patches are only Signed-of-by me, are they OK?

Actually, this one is not OK.  Anyone who handles a patch needs to add a
Signed-off-by.  In the case below, that patch was commited to the tree
by Guan Xuetao <gxt@mprc.pku.edu.cn>, so there needs to be a
Signed-off-by from them as well.

The same is true for all the commits in the unicore32 tree ...

> commit d7de15786d1a10fa18b80fd44026d442e7a84bd2
> Author: Chen Gang <gang.chen.5i5j@gmail.com>
> Date:   Tue Apr 15 09:21:30 2014 +0800
>=20
>     arch:unicore32:mm: add devmem_is_allowed() to support STRICT_DEVMEM
>    =20
>     unicore32 supports STRICT_DEVMEM, so it needs devmem_is_allowed(), li=
ke
>     some of other architectures have done (e.g. arm, powerpc, x86 ...).
>    =20
>     The related error with allmodconfig:
>    =20
>         CC      drivers/char/mem.o
>       drivers/char/mem.c: In function =C3=A2<U+0080><U+0098>range_is_allo=
wed=C3=A2<U+0080><U+0099>:
>       drivers/char/mem.c:69: error: implicit declaration of function =C3=
=A2<U+0080><U+0098>devmem_is_allowed=C3=A2<U+0080><U+0099>
>       make[2]: *** [drivers/char/mem.o] Error 1
>       make[1]: *** [drivers/char] Error 2
>       make: *** [drivers] Error 2
>    =20
>     Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>     Acked-by: Xuetao Guan <gxt@mprc.pku.edu.cn>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/iW4U/Zpxnz.+lgpr_nKyFB7
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTg+uNAAoJEMDTa8Ir7ZwVOMcP/1YNRs56YC/ipxFuRPbeeX9/
1z8X4lRVzD9y7KU+6N4hKxAwNVL7CA66vH3yehizjRMtq/vRxbAAM3nTjxYAJATB
ll4YUdltv+REXbOSOAsXH45ERZOxTYM91qbDZEg6vAJA7xSM/3Tf6BUAEmBrp55C
gHnvA7fUVeRcrLUadhL2lqJ8jNTAL/MYtQouyQbFAfimRmhyNbQhUBEHm/53fu8B
Ft8zngyjJmQUqOsHyxLHqrvcO+57Boa4kuxAUoImLO6SKfnEpJ+c/8FlkCMzecDH
uZDHOlrUfBDeZFYIJkGq3Nubk1SBA4M85JCFns9asKpzkZeQwxUenevLlV9wuxtr
fdF/GUyzY0vbhvqwy/B9YvH6UNF3Gp7rrzd3nuOj9u6FjGiWIcW7DTVyzZeS5CBy
21CTzAK9yMtHKvUYfv26B2NRoYOOa3BX940qrJPtVwqLpumnsV841aosHyHkx3gi
W+klnuLgCEC/W02oM1681mSlLI+sQ2hC6+aQ52+EglC3vgUzP5oerCmtzyHPEQBG
+NkO/RrDi4r6C5ZPSrr7rl0/vnS9yKqO4lY0r+6juwPQfGFHrYdccMrAEY7F7L50
h7CCusr4jNgUP4k8Nj0e2JNeT5j8zbB1fWQGjLLaEmYy04ldwuOsts/9R7uSpE7H
OkUWTTnBuC8xF+0331dt
=xURa
-----END PGP SIGNATURE-----

--Sig_/iW4U/Zpxnz.+lgpr_nKyFB7--
