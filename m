From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the tip tree
Date: Fri, 18 Jan 2019 09:31:35 +1100
Message-ID: <20190118093135.39cf071e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AqHG0K4+LaYSP5cre78SC7M"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/AqHG0K4+LaYSP5cre78SC7M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a31e184e4f69 ("x86/pkeys: Properly copy pkey state at fork()")

Fixes tag

  Fixes: e8c24d3a23a ("x86/pkeys: Allocation/free syscalls")

has these problems:

  - SHA1 should be at least 12 digits long

--=20
Cheers,
Stephen Rothwell

--Sig_/AqHG0K4+LaYSP5cre78SC7M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxBAkcACgkQAVBC80lX
0GwqQgf/R7FSce8yihSxWinaT3Z/YltX1oHHs9AIPl82Ent2gd6gwX7Ix5pvBHLT
B4VLjtxDJBq822TVI4UxWT7cjFTJ++u40OiPj5AORzy3ygVwrf/bYHV1lPBSf4zg
i8/R9aNmefUj/Ui7He3V4G6/gYNl4/UVyDHQBHfz4mVmUjFTUNLNuaEN6nd4cw/i
ZZ00Ugv5ZV7xBSBX+0Yu09jrbDbNMzoNUC+bVJZ39Jqy1V0bHDe52OhNpepdizaE
Nk5diD+BgM7FrOgblT0AreymtJQDOe9wABz5vhdJpkz2dJu4Z2ZGu3aXKqBaPOYd
gkwYTA/0uH7EowhAm5MOmhIQdIndGg==
=ECMj
-----END PGP SIGNATURE-----

--Sig_/AqHG0K4+LaYSP5cre78SC7M--
