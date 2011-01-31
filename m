From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slab tree
Date: Mon, 31 Jan 2011 14:42:46 +1100
Message-ID: <20110131144246.dfa2abe3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__31_Jan_2011_14_42_46_+1100_QGIUU2gR0H1ahIaO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55470 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752122Ab1AaDm7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 30 Jan 2011 22:42:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Tso <tytso@MIT.EDU>

--Signature=_Mon__31_Jan_2011_14_42_46_+1100_QGIUU2gR0H1ahIaO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the slab tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/ext4/mballoc.c: In function 'ext4_exit_mballoc':
fs/ext4/mballoc.c:2750: error: implicit declaration of function 'kmem_cache=
_name'
fs/ext4/mballoc.c:2750: warning: cast to pointer from integer of different =
size

Caused by commit 63310467a3d1ed6a0460ec1f4268126cd1ceec2e ("mm: Remove
support for kmem_cache_name()").  Clearly the last user has not gone, yet.

I have used the version of the slab tree from next-20110121 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__31_Jan_2011_14_42_46_+1100_QGIUU2gR0H1ahIaO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNRi+2AAoJEDMEi1NhKgbstq8H/ioiytskEyYnGPY8YVPlq8qJ
5OhX8HKLqi+c4ki3YnVaOBHeMF6niRpbjLf5r/H5/rF9jkw8AvsCEP4/kpeYG6xQ
mnEADk1lDxlO+r5k0uo13II3OfDH1C+2fHP5s7JcsomvxY72rM7zkfmx/pr8K2Mm
zd4pK2UzhZW6n7KZIrYtNAV1IsN4BQGO1MoN7iZyZE6dYnsh/LflkQEyoWh2ISLX
WK+987dTfeCLS3up/ICAo2nxOwGjUkGsLEwj1Orz0ohEyzrQtk4NkigH7KeCgoO0
fe99KtjNwPrjevglJStIiQVLyPeWOaxpPC485GrLcQpxwYOl43bV5xBir5wDcxE=
=WJOM
-----END PGP SIGNATURE-----

--Signature=_Mon__31_Jan_2011_14_42_46_+1100_QGIUU2gR0H1ahIaO--
