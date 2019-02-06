From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the drivers-x86 tree
Date: Thu, 7 Feb 2019 09:57:03 +1100
Message-ID: <20190207095703.564e76b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JrloarUeDi9Ju44Le1giVnh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/JrloarUeDi9Ju44Le1giVnh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4284dc008f43 ("platform/x86: intel_pmc_core: Fix file permissions for ltr=
_show")

Fixes tag

  Fixes: 63cde0c16c67 ("platform/x86: intel_pmc_core: Show Latency Toleranc=
e info")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

  2eb150558bb7 ("platform/x86: intel_pmc_core: Show Latency Tolerance info")

--=20
Cheers,
Stephen Rothwell

--Sig_/JrloarUeDi9Ju44Le1giVnh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbZj8ACgkQAVBC80lX
0GxziAf+OZiiUxf14raDsB9CyenVnSXgLln30g4hqU9cdgCHDsXjNSN1KKevSQ/P
Kd9W26sBqt5KlPZ2mUJ6fWiHtmRi5vv0dvHVavGvgAr380qjIIQvucpKSdqSP2iJ
Yq+x6l9Hxq6VXTocJKATMdTojwnW3KSYu5ENVhYnZJH2K0KTmQOiUDsl5lONwMtN
Eupg3rW/iSyahpG3eB5nPIjBf6B5LwbosRzpbKsBqaQwKZwY+46LYGg/ddSe8A84
GlQaBGY3ZHYjN+V89jPvh7ZlqSSIjSZAlA1CAYm1wl6qsU2ha9yt9Slnt2U+oQ8y
zzPx72gpdpAFPDvMgrJOq7LOz67/vw==
=J3HE
-----END PGP SIGNATURE-----

--Sig_/JrloarUeDi9Ju44Le1giVnh--
