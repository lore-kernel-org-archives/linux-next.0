From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the rr tree
Date: Mon, 10 May 2010 13:46:20 +1000
Message-ID: <20100510134620.2e06495b.sfr@canb.auug.org.au>
References: <20100510134409.4bbf1873.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__10_May_2010_13_46_20_+1000_3N_2a6VSJEFe/XyP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44018 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751254Ab0EJDqZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 May 2010 23:46:25 -0400
In-Reply-To: <20100510134409.4bbf1873.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__10_May_2010_13_46_20_+1000_3N_2a6VSJEFe/XyP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Mon, 10 May 2010 13:44:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> drivers/acpi/debug.c:141: warning: passing argument 1 of '__check_old_set=
_param' from incompatible pointer type
> include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, st=
ruct kernel_param *)' but argument is of type 'int (*)(const char *, const =
struct kernel_param *)'
>=20
> Introduced by commit a1c3b92923eced4ee034fa15bf058f91e435e08c ("param:par=
am_ops").

Also

drivers/message/fusion/mptbase.c:112: warning: passing argument 1 of '__che=
ck_old_set_param' from incompatible pointer type
include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, stru=
ct kernel_param *)' but argument is of type 'int (*)(const char *, const st=
ruct kernel_param *)'
drivers/message/fusion/mptbase.c:112: warning: passing argument 1 of '__che=
ck_old_set_param' from incompatible pointer type
include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, stru=
ct kernel_param *)' but argument is of type 'int (*)(const char *, const st=
ruct kernel_param *)'
drivers/message/fusion/mptbase.c:112: warning: passing argument 1 of '__che=
ck_old_set_param' from incompatible pointer type
include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, stru=
ct kernel_param *)' but argument is of type 'int (*)(const char *, const st=
ruct kernel_param *)'
drivers/message/fusion/mptbase.c:112: warning: passing argument 1 of '__che=
ck_old_set_param' from incompatible pointer type
include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, stru=
ct kernel_param *)' but argument is of type 'int (*)(const char *, const st=
ruct kernel_param *)'

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__10_May_2010_13_46_20_+1000_3N_2a6VSJEFe/XyP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvngYwACgkQjjKRsyhoI8wdLwCfZnGhkY/UmlzsVEQTAeKQ0JTp
fT0AoId6gX7t8mnrWPrYLUz5fTz9Drio
=aFvg
-----END PGP SIGNATURE-----

--Signature=_Mon__10_May_2010_13_46_20_+1000_3N_2a6VSJEFe/XyP--
