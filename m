From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the metag
 tree
Date: Mon, 26 Feb 2018 15:01:55 +1100
Message-ID: <20180226150155.6cbddcfb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_bK+/gGAVMz5qU6VyCnaf.M"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, James Hogan <james.hogan@imgtec.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/_bK+/gGAVMz5qU6VyCnaf.M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/metag/kernel/process.c

between commit:

  bb6fb6dfcc17 ("metag: Remove arch/metag/")

from the metag tree and commit:

  3c365ca66bd0 ("fs, elf: drop MAP_FIXED usage from elf_map")

from the akpm-current tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/_bK+/gGAVMz5qU6VyCnaf.M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqThrMACgkQAVBC80lX
0GxPXwf/cnjmDi2y3809hkctE9PB8bWS8m3f2bRkCaRHEz+PZOySpuPz3K9B72Le
60fYDK/32iy1CZ77MesaWJLOXnF+2+h78kYItPf3HVBRMAC9LhITI1oG+I7uqnsG
6/uezEt29Rwu77G4cc5SjZWdB3laXv6DqWaEvU83Yzcpuk5vlUhIOlW/dtUJDqf8
7SV7dujYfHKKnpzu54Iblqzb0QjJlqFlAx/g5sYYthEFaLF7A6Je/lAn9z3d9Cou
qybYGZj0NLY12zSi9/UDVgOBZ02acOAbQV4d5bJj8ozvjFxRqKfEVzoQoqqENMrF
/XlrTD1Aq0ORLyLhMU30Pf1laqZzBQ==
=Kouq
-----END PGP SIGNATURE-----

--Sig_/_bK+/gGAVMz5qU6VyCnaf.M--
