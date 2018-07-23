From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xarray tree with the nvdimm tree
Date: Mon, 23 Jul 2018 17:17:15 +1000
Message-ID: <20180723171715.23328c84@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JpRRr9Nbzc+rmYndEKCelr6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>, Dan Williams <dan.j.williams@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/JpRRr9Nbzc+rmYndEKCelr6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xarray tree got a conflict in:

  fs/dax.c

between commit:

  55f25ced654c ("filesystem-dax: Introduce dax_lock_mapping_entry()")

from the nvdimm tree and several commits from the xarray tree.

I have no idea how to fix this up, please discuss it and give me a
resolution (or better yet, create a command branch that both trees can
merge so that the conflicts do not exist any more).

I have temporarily dropped the xarray and ida trees for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/JpRRr9Nbzc+rmYndEKCelr6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltVgPsACgkQAVBC80lX
0GyyUQf/X4AMiibk7ze8FxWUQ7dNo/m8/IAPR/O1jE3lY61egKC2bxUYAU4+rHzu
gPw5Rd2PmCs/yjGqMjcr6uYy+nVmp+sqNzgn2oMOnpVGa3QLVJA387yHFp1sZiw+
WSqurdDPcCA7RwZMRyxYqUtSDIae/DYb7/OIhfa9V0OVE6g0UJfvhVbwI353Mt9W
iM19Ob9RF9NqZhdIWpSGjwtR2T0UQljVQxQWR6sj8dMj4LwAhWjhagmiJ0foezSw
MvJXxZKDNvJhniQUHRuGB2BIFJDhWRt9kl1enkx7IVHEq9dRheB69EfMHXWKxvqO
16UH3VC6xfnOKgw8d2xdMsyKmsKK2w==
=u46T
-----END PGP SIGNATURE-----

--Sig_/JpRRr9Nbzc+rmYndEKCelr6--
