From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kspp tree
Date: Fri, 27 Jul 2018 19:02:07 +1000
Message-ID: <20180727190207.7ce1c9b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/inqdy/oNf6dcVMCgfy/Rc_S"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>
List-Id: linux-next.vger.kernel.org

--Sig_/inqdy/oNf6dcVMCgfy/Rc_S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

After merging the kspp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

cc1: error: plugin stackleak_plugin should be specified before -fplugin-arg=
-stackleak_plugin-disable in the command line

Maybe caused by commit

  a8b9eaddb9c0 ("gcc-plugins: Add STACKLEAK plugin for tracking the kernel =
stack")

I have used the kspp tree from next-20180726 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/inqdy/oNf6dcVMCgfy/Rc_S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlta348ACgkQAVBC80lX
0GzuwQf/Uhbd1pseRq3IFcCgNfLp4ZWgVgCWYyN9QTcc4Mz5hL9x/4kWf9b4nA1s
e2QgZUe2qVclbpVAoFtqkb/cpwqkkrxC8AcrVYxHuc4pp/kwtPG4zgnrHLyvGZKA
l2cyFpj4QBNDbAuikgHvsCSibLX7bjbiFCCdXufGVIOVudirddGIqjPYpzi/z4pW
YmqHcbHEE4H259uSQgvvhn3rdDxDr1KFkqJxwQWFAnJEPDSRXW1r1pOZFaXZoWNn
TnonFa/s/2VT29nQ1y/wu83uBCXrqe41PxyPiE9iHvNf9rvEuYDT4d1IObRlV/me
UVfG5po11GFeyzIYYc1dfNJ3OogRqw==
=FPmp
-----END PGP SIGNATURE-----

--Sig_/inqdy/oNf6dcVMCgfy/Rc_S--
