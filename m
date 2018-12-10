From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-msm tree with the drm tree
Date: Mon, 10 Dec 2018 14:03:20 +1100
Message-ID: <20181210140320.5ba2b2e4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yvq14zz5VR3AAQ0TgU1L9rR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mamta Shukla <mamtashukla555@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Jordan Crouse <jcrouse@codeaurora.org>
List-Id: linux-next.vger.kernel.org

--Sig_/yvq14zz5VR3AAQ0TgU1L9rR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/adreno/a5xx_gpu.c

between commit:

  c97ea6a61b5e ("drm: msm: adreno: Use PTR_ERR_OR_ZERO rather than if(IS_ER=
R(...)) +PTR_ERR")

from the drm tree and commits:

  dadb36b7ec42 ("drm/msm: Add a common function to free kernel buffer objec=
ts")
  7799a98edd80 ("drm/msm: Add a name field for gem objects")

from the drm-msm tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/yvq14zz5VR3AAQ0TgU1L9rR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwN13gACgkQAVBC80lX
0Gw4EQf+LTa78benAqBO19IrVd0qbHteZ7MrACogJaKCqq8S7lMSxKm26z7HTi9T
k3L+PG4uSgZn3NthiFEpSMbwFakCuV5Cow5X+aSu38bXuIw0lmFKQAyrspa+PK4G
pMGTxOd8sXiBYNYysXKpitXzJVrP6Q/N4uDaJkjy7qPGSQnHPwCa7B5Ryo3yvcSP
CXrtoT77jlF2MzjSLFtjNz4KdAb9KXU9VcWfREyXncwmZNd+ea4U7GOaABoTOE3p
MZEBRAxI3VWAqyYAZ9CqgdwhxRtyGpJxhpx9W2ItDIBcecR4tPCngTTODc2nw9R+
itG6uwpUwGTuFaJotDIafD3im8Mrkg==
=xEqx
-----END PGP SIGNATURE-----

--Sig_/yvq14zz5VR3AAQ0TgU1L9rR--
