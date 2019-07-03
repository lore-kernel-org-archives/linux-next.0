Return-Path: <SRS0=JrHm=VA=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2308C5B578
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 08:30:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D74B42189E
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 08:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f1CUiiw7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfGCIaz (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 3 Jul 2019 04:30:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52813 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727004AbfGCIaz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jul 2019 04:30:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45dvSp4Mj1z9s4V;
        Wed,  3 Jul 2019 18:30:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1562142652;
        bh=WeDiAfo0BQ+r8aIcvSG76itffid/LwqyDD7tDwMg6TA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f1CUiiw7jQq2DogS1vZBh3MRXdrIsoWe04ZN7W7mCsUhkCmk8RROc1M+aD+eA0Ibp
         ccpT/GjA1MTTwMg74R5TdnSi1OWrOzceLhDXgRbtMdJW9J36lx0FaJMhvzt8591q3k
         6ztNxl504AMqhXpRvHvBsfzfPaupMvofwWrz3GuJxOqdcJpH5s1z1+CzyPQCdUDqZn
         V4nKr0+m6a+gJxdte96grocHNjXgmYKPKDTokqAwqdRJcmaapgShuWnii77IG6jerW
         fsWSnNj/dVE2wvDEaq0PF2QbPLJ8rqWZ6NlJNlWUgXyTZcY3MRCtDqomqcn/2fmo1O
         /r8b7GMDMdGWw==
Date:   Wed, 3 Jul 2019 18:30:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Kuehling, Felix" <Felix.Kuehling@amd.com>
Cc:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "Yang, Philip" <Philip.Yang@amd.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Dave Airlie <airlied@linux.ie>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Message-ID: <20190703183036.09032d12@canb.auug.org.au>
In-Reply-To: <20190703145443.2ea425c8@canb.auug.org.au>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
        <20190703145443.2ea425c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e5qSB1VclK5wgme0230sZ_1"; protocol="application/pgp-signature"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e5qSB1VclK5wgme0230sZ_1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 3 Jul 2019 14:54:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Wed, 3 Jul 2019 01:55:08 +0000 "Kuehling, Felix" <Felix.Kuehling@amd.c=
om> wrote:
> >
> > From: Philip Yang <Philip.Yang@amd.com>
> >=20
> > In order to pass mirror instead of mm to hmm_range_register, we need
> > pass bo instead of ttm to amdgpu_ttm_tt_get_user_pages because mirror
> > is part of amdgpu_mn structure, which is accessible from bo.
> >=20
> > Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> > Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > CC: Stephen Rothwell <sfr@canb.auug.org.au>
> > CC: Jason Gunthorpe <jgg@mellanox.com>
> > CC: Dave Airlie <airlied@linux.ie>
> > CC: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/Kconfig                          |  1 -
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  5 ++---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          |  3 +--
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c           |  8 ++++++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h           |  5 +++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          | 12 ++++++++++--
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h          |  5 +++--
> >  8 files changed, 30 insertions(+), 11 deletions(-) =20
>=20
> I will apply this to the hmm tree merge today to see how it goes.

This (at least) build for me.

--=20
Cheers,
Stephen Rothwell

--Sig_/e5qSB1VclK5wgme0230sZ_1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0cZ6wACgkQAVBC80lX
0GwxCAgAm5w3v6m4QhQxoWWwyh1Z0i31z/xsiFrk/0NFrUOK/amLgWJZSB6ROTmT
7ySOpcelOGLsmu7jt9EFVgk7Mio1uPAWYIErYOOp0+PlhloVGbS+lNH+mVNMNuNV
xh0mtxzfkltkBEaKMBNRU0V/GIu9s/BAQPVgy6m1g3Nc1a2iOKaojrYdgcjO5stD
jQ5J9Nw3gvx9qJmGD3vO7f9aIEOc8l+oO9thr2E3nM0f0v0OVs3oVS0yjMRnidHJ
Gu1z/04ZuG477a1nSPU6NrzNQFxrBhz5zO0OIIH2egAwJXh7DzHOIOnHFqkFPdhO
o0IPmHtn4WsoNYDaDRuHEWI2ae0V9g==
=UeUM
-----END PGP SIGNATURE-----

--Sig_/e5qSB1VclK5wgme0230sZ_1--
