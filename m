From: Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: Tree for July 26 (uml)
Date: Tue, 14 Aug 2012 16:31:27 +0200
Message-ID: <502A613F.1090600@nod.at>
References: <87a9xys53h.fsf@rustcorp.com.au> <20120726150419.0de645e8750e3a15fa0f1aaa@canb.auug.org.au> <50115FCF.4060708@xenotime.net> <502932A0.3060001@xenotime.net> <15532.1344954413@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig95FD8DA7F5FAB50EAB9478D6"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <15532.1344954413@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, user-mode-linux-devel@lists.sourceforge.net
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig95FD8DA7F5FAB50EAB9478D6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Am 14.08.2012 16:26, schrieb David Howells:
> Rusty Russell <rusty@rustcorp.com.au> wrote:
>=20
>>>>   CC      arch/x86/um/../kernel/module.o
>>>> arch/x86/um/../kernel/module.c:96:5: error: redefinition of 'apply_r=
elocate_add'
>>>> include/linux/moduleloader.h:64:19: note: previous definition of 'ap=
ply_relocate_add' was here
>>>> make[2]: *** [arch/x86/um/../kernel/module.o] Error 1
>=20
> Hmmm...  I'm not sure how to deal with this.  The problem is that UML d=
oesn't
> draw the:
>=20
> 	select MODULES_USE_ELF_REL if X86_32
> 	select MODULES_USE_ELF_RELA if X86_64
>=20
> definitions from arch/foo/Kconfig that tell it what modules will look l=
ike.
>=20
> Should I just enable both REL and RELA in UML, or is there a better way=
 to do
> this?

Is there no way to get this information from the UML subarch?
Which is currently X86_32 or X86_64.

Thanks,
//richard


--------------enig95FD8DA7F5FAB50EAB9478D6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJQKmFAAAoJEN9758yqZn9eMQsIAIfhSZNfzO9od5/7oE/DTinR
pClB9vwteHAj2wzYvpG9t3E1F1TP4tChWeIEP/1of2ToQpCsSOo0vJFjf7X2c+63
L8199lMnVQsqeAMgtbY6Q3jJ+SI0GIEPgheiHu+lO1znl8hNGu0o3eg4nrXWhkco
oVAtUbucwzDy0OFrXKZD0h7fLcrrocdN4Z3C75pAEZeB3lXYsG77XX9rz5pBloDN
htWZ61RQBoSJhAxeeV5r4WEKVNg0Wxkbc2QoFqi8WKxg6zvHgPtsfnP/h29zKaso
rS5WTouAqP7e/YIBbA8VQr+lhAzuPMJDiSrdoEJLDLj95SDFEmESoGvBsjGiDbE=
=p0wF
-----END PGP SIGNATURE-----

--------------enig95FD8DA7F5FAB50EAB9478D6--
