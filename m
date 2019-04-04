From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with the
 btrfs-fixes tree
Date: Fri, 5 Apr 2019 10:03:29 +1100
Message-ID: <20190405100329.1fab45a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kTo4dKiR8goPPhKVcKF0iyi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anand Jain <anand.jain@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/kTo4dKiR8goPPhKVcKF0iyi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/props.c

between commits:

  50398fde997f ("btrfs: prop: fix zstd compression parameter validation")
  272e5326c783 ("btrfs: prop: fix vanished compression property after faile=
d set")

from the btrfs-fixes tree and commit:

  10e02a8f96ea ("btrfs: drop redundant forward declaration in props.c")

from the btrfs-kdave tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/kTo4dKiR8goPPhKVcKF0iyi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlymjUEACgkQAVBC80lX
0GxdPwf+KBlZTbMI/TAZjEQsz9yqsxyePbkhR+n7/rcV/J1xjWc08M+fdiec41XD
ikKn4EH6HmWG45G/MMadHrm0kapzbev+BAu+Ntm8Kad5tnIrVXIqmdnWVVy0sSIU
ycSY/3exlzdl1DMzEqsmIAr3SKNhvbKNIdOlYd0BfRkPu5sPR22I+O4K/pi6/by+
jLnDLcoTRc5jFLJQpbnhFsCYL/0ly2FBnPUTNTykh4Iya6Xv/Wh20QBPx+mu3mhs
bAXSMpm7VDmRqxmHtwMio6tlJJVg+VVQPM9w5x7hxAXzShANxRX/DmczICFFgpPA
KUhxYyAJV7B5o3yVp3s5N3DdAcUsTQ==
=xA1m
-----END PGP SIGNATURE-----

--Sig_/kTo4dKiR8goPPhKVcKF0iyi--
