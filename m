Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9E4C2D0A3
	for <linux-next@archiver.kernel.org>; Tue, 10 Nov 2020 02:26:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EB6120644
	for <linux-next@archiver.kernel.org>; Tue, 10 Nov 2020 02:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Nqtd4pNW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729706AbgKJC0R (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 9 Nov 2020 21:26:17 -0500
Received: from ozlabs.org ([203.11.71.1]:48407 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbgKJC0R (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Nov 2020 21:26:17 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CVWvB1NTRz9sRK;
        Tue, 10 Nov 2020 13:26:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604975175;
        bh=RKj/coDJuwQ31FaFZSoV4bBFdJBXlGdGS/cDbXVCy8w=;
        h=Date:From:To:Cc:Subject:From;
        b=Nqtd4pNWXHP+8Zv2zEVRk9nDmSIG6W1B14UbpVbiFAwPVsLjp8YhTK1mqCUUycmdv
         Px0njwFC/J7eEN9XOfaP/4QFpRmkXzIfqUR6t87+3MmMh+pvIPujtAmR+r6vxoscJb
         k3BmKvx4qGtRwjlGzcN1B1naWbGtlnFA7k1WLvKK61iljy5FmJtgbJIYShx6rpcS3p
         LMxR+JOqnSIYLZIrX+rwIfHsxbrJ3Kdb3NR1/h9ttPkxPM0kvNVlOIW/18ffozoXlL
         yorkc+KGnbeM+cPScX+/D7l2TzFmguXz4Y6pVrt5xvZw2PkkLH5VqDMOFWmn375s+g
         v+XVlc8T2GLDg==
Date:   Tue, 10 Nov 2020 13:26:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201110132610.34c62c71@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ujvVdjNjmCUQnYFk50_llkW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ujvVdjNjmCUQnYFk50_llkW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/msm/msm_gem.c:1014:10: error: initialization of 'int (*)(st=
ruct drm_gem_object *, struct dma_buf_map *)' from incompatible pointer typ=
e 'void * (*)(struct drm_gem_object *)' [-Werror=3Dincompatible-pointer-typ=
es]
 1014 |  .vmap =3D msm_gem_prime_vmap,
      |          ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/msm/msm_gem.c:1014:10: note: (near initialization for 'msm_=
gem_object_funcs.vmap')
drivers/gpu/drm/msm/msm_gem.c:1015:12: error: initialization of 'void (*)(s=
truct drm_gem_object *, struct dma_buf_map *)' from incompatible pointer ty=
pe 'void (*)(struct drm_gem_object *, void *)' [-Werror=3Dincompatible-poin=
ter-types]
 1015 |  .vunmap =3D msm_gem_prime_vunmap,
      |            ^~~~~~~~~~~~~~~~~~~~

Caused by commit

  49a3f51dfeee ("drm/gem: Use struct dma_buf_map in GEM vmap ops and conver=
t GEM backends")

interacting with commit

  3c9edd9c85f5 ("drm/msm: Introduce GEM object funcs")

from the drm tree.

I tried reverting commit 3c9edd9c85f5 (as 49a3f51dfeee does not revert
cleanly) but that just produced more errors, so I have disabled
CONFIG_DRM_MSM for now.
--=20
Cheers,
Stephen Rothwell

--Sig_/ujvVdjNjmCUQnYFk50_llkW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+p+kIACgkQAVBC80lX
0Gzp9gf/aviNGqsALWirx49+xmIeJeVMas00GpXoDiNhqf6Ez7by0VNmzvfJP0Ig
pUY6mVC38d/IGuHAYQoMHRqlDtf2ty42cc8WftZeaX0NBZOY4aWglqYYmb2J9bdn
Vuy1oy83kXREYqKk6IGjDcwmB79Cgehbh0LvpFd9kAIs5uy5HDugzGQxMFybonwv
5L8v8R4lMmWl6JidgnOSIKmB4V5cEtdA8xhdWFV8lfDldV/ew1GmeesQFUIwF0Fg
H8ALm1E+DioCXXbBLU8OhLAUEkG0j76jPy81qh/9P2BJ2TxPLdNgipu/HaJEndrK
iKeFZ24DobLoNx8m+7OruS+Rb9AbVA==
=bsR8
-----END PGP SIGNATURE-----

--Sig_/ujvVdjNjmCUQnYFk50_llkW--
