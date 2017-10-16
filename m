From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the drm-msm tree with Linus' tree
Date: Mon, 16 Oct 2017 12:56:45 +0100
Message-ID: <20171016115645.qoasl2vbdeegsj3j@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rfnrp2x3rpgcjgjq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:58322 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752088AbdJPL4r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Oct 2017 07:56:47 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--rfnrp2x3rpgcjgjq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/msm_gpu.c

between commit:

  6bd6ae2dfc7e09 ("drm/msm: fix error path cleanup")

=66rom Linus' tree and commit:

  0502a625c2ee0c ("drm/msm: fix error path cleanup")

=66rom the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/msm/msm_gpu.c
index 6a887032c66a,fac688bdddb1..000000000000
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@@ -713,12 -795,17 +795,11 @@@ void msm_gpu_cleanup(struct msm_gpu *gp
 =20
  	bs_fini(gpu);
 =20
- 	if (gpu->rb) {
- 		if (gpu->rb_iova)
- 			msm_gem_put_iova(gpu->rb->bo, gpu->aspace);
- 		msm_ringbuffer_destroy(gpu->rb);
+ 	for (i =3D 0; i < ARRAY_SIZE(gpu->rb); i++) {
+ 		msm_ringbuffer_destroy(gpu->rb[i]);
+ 		gpu->rb[i] =3D NULL;
  	}
 =20
 -	if (gpu->memptrs_bo) {
 -		msm_gem_put_vaddr(gpu->memptrs_bo);
 -		msm_gem_put_iova(gpu->memptrs_bo, gpu->aspace);
 -		drm_gem_object_unreference_unlocked(gpu->memptrs_bo);
 -	}
 -
  	if (!IS_ERR_OR_NULL(gpu->aspace)) {
  		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu,
  			NULL, 0);

--rfnrp2x3rpgcjgjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnknnwACgkQJNaLcl1U
h9AbTQf8CDGAPyPj9K/4W7gsGqU4q5VnyGjM+drhyMXlwEahNSUz/2FKSeXwPbC4
vl1Jt61IpZUCqXv7b5n/LnRargRKAZ3r1ZlbBpLn83OHSrh0BFc8e4jbjgF6VjxD
+tLTiv/v2rZ4OI52FKWoO9pm/hY6oD2ZxPMveqkhar6CSZ1Re/3qGrXk27L2rqoQ
fWxS45C+E47y9GX9ILVYXuYmeMYQli2ODGkxHyF67tZQxm1Lg8iZ/ouPgWQ4/fkv
FmMQMxxaWtxBp4SicOy6VysQRwf95vXxTcTt5aNsrbWuEa5ekTiAzI6T5jcDT0q+
cc1m7chsBe67/i+jE27sxt3LQg74BQ==
=TjS2
-----END PGP SIGNATURE-----

--rfnrp2x3rpgcjgjq--
