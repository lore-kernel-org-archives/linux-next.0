From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arc tree with Linus' tree
Date: Fri, 26 Jun 2015 09:47:51 +1000
Message-ID: <20150626094751.3c5a6490@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9Te+I8HsUHBpZRNcrXJM/+k"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/9Te+I8HsUHBpZRNcrXJM/+k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

Today's linux-next merge of the arc tree got a conflict in:

  include/asm-generic/barrier.h

between commits:

  ab3f02fc2372 ("locking/arch: Add WRITE_ONCE() to set_mb()")
  b92b8b35a2e3 ("locking/arch: Rename set_mb() to smp_store_mb()")

from Linus' tree and commit:

  470c27e4695a ("arch: conditionally define smp_{mb,rmb,wmb}")

from the arc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/asm-generic/barrier.h
index e6a83d712ef6,270b7c989ea1..000000000000
--- a/include/asm-generic/barrier.h
+++ b/include/asm-generic/barrier.h
@@@ -66,8 -89,10 +89,10 @@@
  #define smp_read_barrier_depends()	do { } while (0)
  #endif
 =20
+ #endif
+=20
 -#ifndef set_mb
 -#define set_mb(var, value)  do { (var) =3D (value); mb(); } while (0)
 +#ifndef smp_store_mb
 +#define smp_store_mb(var, value)  do { WRITE_ONCE(var, value); mb(); } wh=
ile (0)
  #endif
 =20
  #ifndef smp_mb__before_atomic


--Sig_/9Te+I8HsUHBpZRNcrXJM/+k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVjJMtAAoJEMDTa8Ir7ZwVZp4QAJQBsamoh6/oVCKnPdcLhSpy
OShMbRc0w96gfUyeajjXqETQaRP2+uYnzBS2Fha2Q1b7ObfvEqM0VkJqQQC2jk3d
pHfPL02dN8dz2qFfzaCPf2/lgUCa0xtbOu+Py1NL6bmVXY3XZGvUPzTOWrQdXEEG
/hUYF7Somq3UEEyJeH6r1XBEGmhv0FQ7XZMpE1yaWFrnJEy5rMTVlQn/nzzubPo3
n9jQcTm8gnZdbuGcJ1nOsHrBdcA2r+1YRmpdIk0/O4o9PNoa/K7UtHQhePzlqxyq
ABYzbGVLrDYrgP4ymfRufMkXhIUH3zCj534hr7ZEf24v50jKYVNKTEIHhkIA6rdO
0PNX9h1WAGrnwzoQ50iCvL7cnTptzEdOfhHyKgE8f2kVYrNyBX53Uu8FIrt8GlIM
TKvJGZTIVEZBMiDyzuGQQd6e6fLNlr6ikiF/2RFM704UWeXwxznF98ajfvPnqOs2
bgz3u6jXolXWkL1w1h0KA2vlN+2b75vwpAICq5FsMLVV2ADVs2y+E5Oyohhh8/OF
WVScszNSJTRY1OsF23csIZMlbkArAa2Vb6OKe1gWzyvsZCAeEnsJYBvkMlE63VVx
A3K9tRIbsNNfa6k4TSJDb2/zWh8Ct6b042Ay2N51dv9d8AboMVLOaGFLVA4LJPe9
0he9LpzsO7UOqbpWTiKN
=O4AK
-----END PGP SIGNATURE-----

--Sig_/9Te+I8HsUHBpZRNcrXJM/+k--
