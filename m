Return-Path: <SRS0=tAkU=C6=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81826C43465
	for <linux-next@archiver.kernel.org>; Mon, 21 Sep 2020 03:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A03220723
	for <linux-next@archiver.kernel.org>; Mon, 21 Sep 2020 03:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A24X/rF6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgIUDID (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 20 Sep 2020 23:08:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37755 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgIUDID (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Sep 2020 23:08:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BvqBQ05y2z9sSW;
        Mon, 21 Sep 2020 13:07:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600657681;
        bh=dhUkL2f4HAZeyqjMRUfsy8JO2RKoK78IBKBPtNNovGw=;
        h=Date:From:To:Cc:Subject:From;
        b=A24X/rF6sK+WiYLx7PqUuRH4MZActArsLpxV22qQPbh+TiYXD0zGdB7GhWgy6B91B
         UPkqmtlpAAKW7c9/1rBW4o0/VxXOeCnCb/fSW3NT2AH51RH5PQovi7ylrVEiIGksp4
         EFFDQtKif8tsSg/XS4vXFjUt+moXO8YcKOzDE5prDpP0eh9qtknGlSc7Hi8tp6el9+
         8jAI0BuzimyBOydwx2gCfRkwXEzgeHs7vKsYGAhsW++WkGrkjXVsbul7Fd5ba8UPAX
         n60abIAigwNJNo7jpzEBgZKlTkgLOWhiZocuH1T+dcNdsg9blhBYWMooNczVWtYfCS
         WPXJZcay1f8YQ==
Date:   Mon, 21 Sep 2020 13:07:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the drm-msm tree with the drm tree
Message-ID: <20200921130757.6ece7053@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Igh5oluZFKriELs0FAq0rYY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Igh5oluZFKriELs0FAq0rYY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/msm_iommu.c

between commit:

  7690a33f22ab ("drm: msm: fix common struct sg_table related issues")

from the drm tree and commit:

  e3c64c7221f6 ("drm/msm: Set the global virtual address range from the IOM=
MU domain")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/msm_iommu.c
index 6c31e65834c6,697cc0a059d6..000000000000
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@@ -36,7 -231,11 +231,11 @@@ static int msm_iommu_map(struct msm_mm
  	struct msm_iommu *iommu =3D to_msm_iommu(mmu);
  	size_t ret;
 =20
+ 	/* The arm-smmu driver expects the addresses to be sign extended */
+ 	if (iova & BIT_ULL(48))
+ 		iova |=3D GENMASK_ULL(63, 49);
+=20
 -	ret =3D iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
 +	ret =3D iommu_map_sgtable(iommu->domain, iova, sgt, prot);
  	WARN_ON(!ret);
 =20
  	return (ret =3D=3D len) ? 0 : -EINVAL;

--Sig_/Igh5oluZFKriELs0FAq0rYY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9oGQ0ACgkQAVBC80lX
0GxDAAf+LHM2OQXy++1uJ+8KRuiGLN8eFeGbfydmDXRkdQHX47+PaGLzNOOO4C0H
upei42MyMMHJMedzG3vdGAtvVW3D6zGxyJQ59HZTRAojp2SUZRDoP59sGwvueLR/
fWrUDCbdFy9rXD7GijzNuPWGL3Bf/hs2n9BfjDKZ6xqDNQ2krCQ9dSihc2NUvb+6
gBwvPmu2oAyMV1ved1um12sOyMgj+hTFbHfl7hsKwDouJq2DBqX3UMF+0C/aYCUn
pqDHVeC0k+i7WzOWMW96whu7AQ1lpN2yAI1zXadSlNQ+hh8l4eDM7HPcTdSgu5/M
X55iO+zZ+jI8oxSb86LmZXaOAvYdMA==
=oHn/
-----END PGP SIGNATURE-----

--Sig_/Igh5oluZFKriELs0FAq0rYY--
