From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs work in the amlogic tree
Date: Wed, 16 Jan 2019 07:45:10 +1100
Message-ID: <20190116074510.7c7e6a4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JwLiueIBRTMFareA/PLW/UJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

--Sig_/JwLiueIBRTMFareA/PLW/UJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[I am experimenting with checking the Fixes tags in commits in linux-next.
Please let me know if you think I am being too strict.]

Hi all,

Commit

  90d2bf8975cc ("ARM64: dts: meson-gxbb-odroidc2: Fix usb phy regulator pow=
er failed warning")

has a malformed Fixes tag:

  Fixes: 5a0803bd5ae (ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes)

There should be at least 12 digits of the commit SHA1 and double quotes
around the commit subject.

--=20
Cheers,
Stephen Rothwell

--Sig_/JwLiueIBRTMFareA/PLW/UJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+RlYACgkQAVBC80lX
0Gwo3gf9EiuOZIdh3hTk6RDXI6XcWLhYzK2e0I5Qm97mVT65nPEEp/tSgGLXHMYQ
I520HkAjumZEKLP+xtpPS1eGL2O5isXd//qMMMGIrVzpWLQzD92SWXiwHlKQMzrN
/bq2NSn1iAmNnz+Y3Fh1xyOwYTFa2UvdNeYm5XQrEbflE1qLDSDuRGeD0TdnqL95
ThZLPgMf8ZumSMhHcHqRJlsLt0Y5Cxyy3eoAoY3VS4A/I0Gfq86ZQbOfELj/dgCk
D6sLV02RF/9qj0XS6VndNYOqZCy7n2+6K/LDJwFYtkm4g0yzxgOPpa4n6Xg9doGd
wbTwo88Wts4s4g0ZoJDwVR3CnsfUqA==
=ciYL
-----END PGP SIGNATURE-----

--Sig_/JwLiueIBRTMFareA/PLW/UJ--
