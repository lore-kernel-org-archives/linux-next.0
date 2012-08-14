From: Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: Tree for July 26 (uml)
Date: Tue, 14 Aug 2012 17:17:12 +0200
Message-ID: <502A6BF8.6040804@nod.at>
References: <502A69FA.8040805@nod.at> <502A6759.3090802@nod.at> <15981.1344955883@warthog.procyon.org.uk> <502A613F.1090600@nod.at> <87a9xys53h.fsf@rustcorp.com.au> <20120726150419.0de645e8750e3a15fa0f1aaa@canb.auug.org.au> <50115FCF.4060708@xenotime.net> <502932A0.3060001@xenotime.net> <15532.1344954413@warthog.procyon.org.uk> <18600.1344956051@warthog.procyon.org.uk> <18933.1344956788@warthog.procyon.org.uk> <30102.1344957328@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig1B9ECB9B1B5FB94E2CFFE3F7"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30102.1344957328@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, user-mode-linux-devel@lists.sourceforge.net
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig1B9ECB9B1B5FB94E2CFFE3F7
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Am 14.08.2012 17:15, schrieb David Howells:
> How about this then?
>=20
> David
> ---
> diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
> index 9926e11..a4b0c10 100644
> --- a/arch/x86/um/Kconfig
> +++ b/arch/x86/um/Kconfig
> @@ -21,9 +21,11 @@ config 64BIT
>  config X86_32
>  	def_bool !64BIT
>  	select HAVE_AOUT
> +	select MODULES_USE_ELF_REL
> =20
>  config X86_64
>  	def_bool 64BIT
> +	select MODULES_USE_ELF_RELA
> =20
>  config RWSEM_XCHGADD_ALGORITHM
>  	def_bool X86_XADD && 64BIT

Looks sane.

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard


--------------enig1B9ECB9B1B5FB94E2CFFE3F7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJQKmv4AAoJEN9758yqZn9ebaAH/1dOgLeyMCJ5hVEaMw1QmnXq
0rSNc6wv0zi0BRRuv3XLrzddDq//ouEkMTDRTMdA0Vk8qNi5XTSonTr4fxoyRiLk
FY4AWweNn7rjNpaFVy+07BRsr47g3h+MWoYSrGq/MiCZy5A33DUR9QtGslxIxN9X
3Ym5zGIRkUquhGoYRBADX279q3ctHelT68L0tcoavSJU8wBQi4A1JHnRIZ7eUobQ
kE9E/TGUcyg1Yc1tOB8TCJd42Qsxw+skJZNYZilE6QnOLyfhIuI7j1eoRDySDnOD
DLRh2wTYZOiurTbHOUIKJZx0nc79jZkdXamOZWVYWFJUAYy0jS4x0N8hGO+kI2M=
=h7xw
-----END PGP SIGNATURE-----

--------------enig1B9ECB9B1B5FB94E2CFFE3F7--
