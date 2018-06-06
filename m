From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the y2038 tree with the staging tree
Date: Wed, 6 Jun 2018 20:19:27 +1000
Message-ID: <20180606201927.7c4efad2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Afb0fnXM94H/AknFEebhBdz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Afb0fnXM94H/AknFEebhBdz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the y2038 tree got conflicts in:

  drivers/staging/lustre/lustre/llite/llite_lib.c
  drivers/staging/lustre/lustre/llite/namei.c
  drivers/staging/lustre/lustre/lmv/lmv_obd.c
  drivers/staging/lustre/lustre/mdc/mdc_reint.c
  drivers/staging/lustre/lustre/obdclass/obdo.c

between commit:

  be65f9ed267f ("staging: lustre: delete the filesystem from the tree.")

from the staging tree and commit:

  18a592632e61 ("lustre: Use long long type to print inode time")

from the y2038 tree.

I fixed it up (I removed the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Afb0fnXM94H/AknFEebhBdz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsXtS8ACgkQAVBC80lX
0GwcTAgAkXBsrnxg5u6UYMlycpRtt7PlD8xTeuhc9tGdo16xZb5DT7EhfYzWMA7S
L7pNHpUoXPofnG+drZI9jCPTrvQg0Op/VycRE1ZbmbwzttxpbGHBtYTRRsOtCnvV
CnjDpniGH3draZaVgyuXXoHX0YEbaM9d+QHeFVnnWubaIIRE/bhxNI2diqtfXHlK
AjlKaDJ8+OhRPW1rE3U4cH0h6RQs+yxuR5tnEuCSmDX23pWSp6vfOcRs+mTiSuo6
QKL7Vx+9GwLP0YSkYTLGVSh+7XTjUJJ7xUnYqa06O8cL7pPshUqcVJWXD584CueL
nGMDe7MORnQETZDDVP7m0sIEFcEAPA==
=WdFL
-----END PGP SIGNATURE-----

--Sig_/Afb0fnXM94H/AknFEebhBdz--
