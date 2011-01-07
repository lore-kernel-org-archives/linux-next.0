From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the final tree (ext3 tree
 related)
Date: Fri, 7 Jan 2011 14:04:14 +1100
Message-ID: <20110107140414.43d5b980.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Jan_2011_14_04_14_+1100_.EPpf+g2_I7yzAJl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Czerner <lczerner@redhat.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__7_Jan_2011_14_04_14_+1100_.EPpf+g2_I7yzAJl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jan,

After merging the final tree, today's linux-next build (powerpc
ppc44x_defconfig) produced these warnings:

fs/ext3/balloc.c: In function 'ext3_get_group_no_and_offset':
fs/ext3/balloc.c:53: warning: comparison of distinct pointer types lacks a =
cast
fs/ext3/balloc.c:53: warning: right shift count >=3D width of type
fs/ext3/balloc.c:53: warning: passing argument 1 of '__div64_32' from incom=
patible pointer type
include/asm-generic/div64.h:35: note: expected 'uint64_t *' but argument is=
 of type 'ext3_fsblk_t *'

Caused by commit 3e5eb5c509e311fdea2468be913ec264edd4f617 ("ext3: Add
batched discard support for ext3").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Jan_2011_14_04_14_+1100_.EPpf+g2_I7yzAJl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNJoKuAAoJEDMEi1NhKgbsdCAIAIDuEGuN/p52szV6V2REkk8B
H1wusQ8JlUxUw6uuLSdU61vTuHVVjvtOZXWINzsd0hjJsIRypYDWm+WNIOrA6of3
IEKP6d6KLWb9qNUKsFag/LWfTpiE5Ifd7nee6uPCbqhPDrWvlbqwGuGn+ATAV2dd
htj10uLFOfIFv1Laq8SI3l20w6fvkaIhZSWVJE4bIjrD3AWxyrkrnBsOkeX50xq9
Rox4iOQPlh3O8JdYNgYx6JYLKTVQh3h0hisNl++j9gw9+5JMlHFwBr/25gRhnoGN
fYUNEvXpFvci0CW2lqvTwJuGxgnx2/QAqR9gX/JmRfkBkhDSamUt2yZqTtdVhKI=
=X3kk
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Jan_2011_14_04_14_+1100_.EPpf+g2_I7yzAJl--
