Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D815F2BE65F;
	Wed, 25 Feb 2026 13:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772025735; cv=none; b=ghsEyCwoa61aiPcjatZ60+rAuW5nu+1AMqn4irHf4PIY1U25eMuEPZbJvT4UpcCSSsnoMPISbokpne57TXoLxFxvJ58yLL7bJuQL88TV9ekt6eXEErXKnp4ru2ec5wk0+rL1MwQAkldrXVgVZ/a9OXHUAYADa85QRkO+kzDfYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772025735; c=relaxed/simple;
	bh=nTTcGiXnjD1B7bk+aBO94f9a3oXSPI8fImRJxEMmCf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kukL70xN488k+SS2VoriLxb/RJXIDTTPLFj7GHDpZkeneBSZmXgcqnCN6n6xCsD4ZeuKviMOIrRFpnp7vrUHO9BhD+SfTayu9lGHCc5Uu99BTNU97dYtemQM83VPjBeKN6t4fD77PjcD9Cy4s4M778gO8MlrMX1XpIWtNjRJaCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzfmO0Uh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzfmO0Uh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7522CC116D0;
	Wed, 25 Feb 2026 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772025735;
	bh=nTTcGiXnjD1B7bk+aBO94f9a3oXSPI8fImRJxEMmCf8=;
	h=Date:From:To:Cc:Subject:From;
	b=JzfmO0UhrpIILfzBga3I5ZQn2kfmCmqy8r92JtLiCAAUbnvCWN5kfMWGpi1KKVg81
	 GIi0NAa3skJ2FiDDmSIAys5xeGFIHd1PA/aoupl3dRWy+WR1Dl9J0VUxr5nEAmLrmx
	 +79IZUbaKfnUSuLAOZdzOwm2+6MWNQzn1oW4Kz8BI+B+9Y3chO2Hx1COJaxTwTCtTW
	 hGOsHdb40I51bcPjkcjn80W24xAmL041m8rkdN8t0Lu6SA+q9dUn/N0ZbRzShiFFBX
	 EjUqSI8Ui/f7FcQ9fzmJBNhjBZ6+wXLNFpN6P0d6fVLunbWTkCM+5URJm7Ukh2Qw04
	 WkwieqRfuqBAA==
Date: Wed, 25 Feb 2026 13:22:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-msm-fixes tree with the origin
 tree
Message-ID: <aZ73gWMLc_kMCIrA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JbrRa2LIFGxMdn/D"
Content-Disposition: inline


--JbrRa2LIFGxMdn/D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm-fixes tree got a conflict in:

  drivers/gpu/drm/msm/msm_iommu.c

between commits:

  48634a9ea06a4 ("drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() a=
llocation type")
  69050f8d6d075 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar=
 types")
  bf4afc53b77ae ("Convert 'alloc_obj' family to use the new default GFP_KER=
NEL argument")

=66rom the origin tree and commit:

  6f6f3535192dd ("drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() a=
llocation type")

=66rom the drm-msm-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/msm/msm_iommu.c
index 7d449e5202c5d,271baf4dc4e80..0000000000000
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@@ -332,7 -332,7 +332,7 @@@ msm_iommu_pagetable_prealloc_allocate(s
  	struct kmem_cache *pt_cache =3D get_pt_cache(mmu);
  	int ret;
 =20
 -	p->pages =3D kvmalloc_array(p->count, sizeof(*p->pages), GFP_KERNEL);
 +	p->pages =3D kvmalloc_objs(*p->pages, p->count);
  	if (!p->pages)
  		return -ENOMEM;
 =20
@@@ -521,7 -521,7 +521,7 @@@ struct msm_mmu *msm_iommu_pagetable_cre
  	if (WARN_ONCE(!ttbr1_cfg, "No per-process page tables"))
  		return ERR_PTR(-ENODEV);
 =20
 -	pagetable =3D kzalloc(sizeof(*pagetable), GFP_KERNEL);
 +	pagetable =3D kzalloc_obj(*pagetable);
  	if (!pagetable)
  		return ERR_PTR(-ENOMEM);
 =20
@@@ -734,7 -734,7 +734,7 @@@ struct msm_mmu *msm_iommu_new(struct de
 =20
  	iommu_set_pgtable_quirks(domain, quirks);
 =20
 -	iommu =3D kzalloc(sizeof(*iommu), GFP_KERNEL);
 +	iommu =3D kzalloc_obj(*iommu);
  	if (!iommu) {
  		iommu_domain_free(domain);
  		return ERR_PTR(-ENOMEM);

--JbrRa2LIFGxMdn/D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmme94AACgkQJNaLcl1U
h9DAbwf/fSI5nBT0wG3dNuJSy52DNtLjseqThFz4IvtV1dlAR8q7ggF046f8p5UU
cvTgwRsqta9N6wG8Q0CnP14O9K3/tOWAi+jd1ZeWtgWXeLNliKnCH5EJLq7pt3Oj
ZsZcCJGfLO2lAeBkqAdJYhEPy+pSC2BMra84otf4SVD1frga+6ujLy6pAuus7koE
/asn8nW7RJFUZQT7uLL59iLkA2pFlBmeVY+v5zJZn9PkixkQE17jMP4xkZhNOG4V
wzf5AbPOLRO6IKZmyJizV7ycRqZTCs4mGej87BBqob6tObQ4N9BkKQyIovGRISor
gj2xna93+H/SHthy5PsOnJx+vf5uZQ==
=QY9d
-----END PGP SIGNATURE-----

--JbrRa2LIFGxMdn/D--
