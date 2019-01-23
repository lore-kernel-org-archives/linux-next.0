From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the btrfs-kdave tree
Date: Thu, 24 Jan 2019 09:53:38 +1100
Message-ID: <20190124095338.523fc3a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+lP+2jeFj5G.UNcTA7vUQ2z"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Qu Wenruo <wqu@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/+lP+2jeFj5G.UNcTA7vUQ2z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

After merging the btrfs-kdave tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/btrfs/relocation.c: In function 'insert_dirty_subv':
fs/btrfs/relocation.c:2138:6: warning: unused variable 'root_objectid' [-Wu=
nused-variable]
  u64 root_objectid =3D root->root_key.objectid;
      ^~~~~~~~~~~~~

Introduced by commit

  7b837199c581 ("btrfs: relocation: Delay reloc tree deletion after merge_r=
eloc_roots()")

Presumably the ASSERT is compiled out in this configuration.

--=20
Cheers,
Stephen Rothwell

--Sig_/+lP+2jeFj5G.UNcTA7vUQ2z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxI8HIACgkQAVBC80lX
0GytqAf9EP4Z1WY2SQ9oF7osbfIWY1PH+C+C3Oe/dPor2lC9HXEUFtYSs3cNKMXv
FvChRWMplfLXUeu8qezW9xemZLQfX+pOnms7gM7RXSIXlVIMxJ84+0bKCSSIbxQs
nbe8U2LVE77jDq5ot8394xAGIA3Cc1SXKAyYHLqG3YhxXIQROrbMR37TQlS3nYOg
wJX2NQxkaNZRmn3FFDzIyqRMEciAgry/ZMKeJC1szQ0FCXyA5s6GgjxQ5jv53GsJ
3vK3ebrwv504+7SU/dTseRGunFjFjFSs1YH8Krw7cWdDw3dBQuPdZfsZX5xKRgYi
6e7r5jGhlOjqL3QAjr0LwBtKu0IEgw==
=phOG
-----END PGP SIGNATURE-----

--Sig_/+lP+2jeFj5G.UNcTA7vUQ2z--
