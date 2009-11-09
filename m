From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: rr tree build warnings
Date: Mon, 9 Nov 2009 18:40:46 +1100
Message-ID: <20091109184046.2a802372.sfr@canb.auug.org.au>
References: <20091109183104.2bf7add6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__9_Nov_2009_18_40_46_+1100_BTVQl9ptSjXaTqLq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45708 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750800AbZKIHko (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Nov 2009 02:40:44 -0500
In-Reply-To: <20091109183104.2bf7add6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__9_Nov_2009_18_40_46_+1100_BTVQl9ptSjXaTqLq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Mon, 9 Nov 2009 18:31:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
>=20
> drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__che=
ck_old_set_param' from incompatible pointer type
> include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, st=
ruct kernel_param *)' but argument is of type 'int (*)(const char *, const =
struct kernel_param *)'
> drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__che=
ck_old_set_param' from incompatible pointer type
> include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, st=
ruct kernel_param *)' but argument is of type 'int (*)(const char *, const =
struct kernel_param *)'
> drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__che=
ck_old_set_param' from incompatible pointer type
> include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, st=
ruct kernel_param *)' but argument is of type 'int (*)(const char *, const =
struct kernel_param *)'
> drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__che=
ck_old_set_param' from incompatible pointer type
> include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, st=
ruct kernel_param *)' but argument is of type 'int (*)(const char *, const =
struct kernel_param *)'
>=20
> Introduced by commit 9f94999724555729819ea0143eab1d0529c029d1
> ("param:param_ops").

I am also getting some section mismatch warnings like this:

WARNING: drivers/mtd/ubi/ubi.o(.data+0x1c0): Section mismatch in reference =
from the variable __ops_mtd to the function .init.text:ubi_mtd_param_parse()
The variable __ops_mtd references
the function __init ubi_mtd_param_parse()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console=
,=20

Which are probably also related to the above change.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__9_Nov_2009_18_40_46_+1100_BTVQl9ptSjXaTqLq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr3x34ACgkQjjKRsyhoI8yWngCfQtKEgW1tSmzJaO/nX9AwP3XT
5hkAnj7PNoHvoL7ZHn+hF92wzJriLsDI
=UywA
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Nov_2009_18_40_46_+1100_BTVQl9ptSjXaTqLq--
