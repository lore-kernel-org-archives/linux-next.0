From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kbuild tree build warning
Date: Wed, 10 Jun 2009 11:52:55 +1000
Message-ID: <20090610115255.035da856.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__10_Jun_2009_11_52_55_+1000_HSWxJqSoQj9VQ7A_"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758234AbZFJBxJ@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__10_Jun_2009_11_52_55_+1000_HSWxJqSoQj9VQ7A_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

In file included from arch/x86/kernel/vmlinux.lds.S:23:
include/asm-generic/vmlinux.lds.h:726:47: warning: backslash-newline at end=
 of file

Caused by commit ef53dae8658cf0e93d380983824a661067948d87 ("Improve
vmlinux.lds.h support for arch specific linker scripts").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__10_Jun_2009_11_52_55_+1000_HSWxJqSoQj9VQ7A_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkovEfgACgkQjjKRsyhoI8wuIQCgtJ4A8kA5MMg5eRNzGRWnGliV
OR8An1bo8rL7z1inpoLTOnfD5TxO0rRk
=378b
-----END PGP SIGNATURE-----

--Signature=_Wed__10_Jun_2009_11_52_55_+1000_HSWxJqSoQj9VQ7A_--
