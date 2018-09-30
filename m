From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: commits in the cisco tree
Date: Sun, 30 Sep 2018 11:24:19 +1000
Message-ID: <20180930112419.6f880e46@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//qGmaqsFQ5PMLlsRT=QHVJ8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Walker <dwalker@fifo99.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_//qGmaqsFQ5PMLlsRT=QHVJ8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

I noticed that you have added some commits to the cisco tree today.  Just a=
 couple of comments:

Fristly, commits

  734245aec283 ("This code allows architectures to use a generic builtin co=
mmand line."

and

  b17f223f16f2 ("This code allows architectures to use a generic builtin co=
mmand line.")

are identical (though in different branches).

Secondly, commits

  2c070709ea75 ("his updates the x86 code to use the CONFIG_GENERIC_CMDLINE=
")
  a5c4647c26da ("This updates the powerpc code to use the CONFIG_GENERIC_CM=
DLINE")

have no Acked-by or Reviewed-by from the repspective architecture
maintainers/developers.

--=20
Cheers,
Stephen Rothwell

--Sig_//qGmaqsFQ5PMLlsRT=QHVJ8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluwJcMACgkQAVBC80lX
0GzQ5wf/XmpLoVLGS+Fg31oFfgiUGBilsDrDifnKe9krSvv0JaA8GuXhOzNdW/a6
gMOYFLE2xz7inMOr7D5sokjGZR2hHYANscl002qXzeyIwnO7jNthsLPsUQppK66j
sGuP0iD53c7sdo55AoEOfvK7FcRw0syr/ZAJgwV+NUedRi8d5dbMkyLhKFPsdbsm
+nb3FL1h3ly2aWaK1psUo3RRQM0ZIHQoz75jD5+VLFcECNwzndYeg6PCMXOQ+fFX
s59VsPSubOa0pKEHqJULFPEm09cR0dXVDHh32cnFUDiQKF9tt/Uy9gcjV3ZHKQ+l
ivgHXJegY1bq4GR5X9lpCLpjYU6Kmw==
=88q2
-----END PGP SIGNATURE-----

--Sig_//qGmaqsFQ5PMLlsRT=QHVJ8--
