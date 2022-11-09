Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E692EC4332F
	for <linux-next@archiver.kernel.org>; Wed,  9 Nov 2022 23:54:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbiKIXyq (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 9 Nov 2022 18:54:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbiKIXyh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Nov 2022 18:54:37 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B859248DD;
        Wed,  9 Nov 2022 15:54:35 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4N71zD5mQRz4xYD;
        Thu, 10 Nov 2022 10:54:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1668038073;
        bh=8scDc1dWo/N/sQIgyaUpJyTxwAXLYx2ZCqELj/8aWy0=;
        h=Date:From:To:Cc:Subject:From;
        b=itKSEJgFosLrgotVH5ZbbbzfuywvaMuGuVYM4l3gcmsjIAi/s7Mea/sNT5/HUV9c7
         IkTdSDD3c7nD8XTWCBeijUL2Y4T9BwjlarNnDAF/DcmyVfN3I8GQOTjyUQa5nDEMqZ
         ARB0OJRI20o1nXiP5s3OGoenfT87/fmlqejB0a9fzdhVQ6OaYvdSUBMddv1LbMJniI
         ZL+UotntrOu2+1DXT9Mk9GuFobWwtE3wixWIriCbQuVIEt/eHzcqlANt3QJmgAc28n
         rwKFHZMNNy5AbaTzQuYwdkmH4oPo6LmkGtZTV8lxK8xfREr1wQgyZWEvrFyvcf1ckW
         PDIUQ13GjcjHw==
Date:   Thu, 10 Nov 2022 10:54:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>
Cc:     Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <20221110105431.164e411d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Llf+jcIAGjBrZ9CjHZDQWCJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Llf+jcIAGjBrZ9CjHZDQWCJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/nouveau/nouveau_fbcon.c

between commit:

  4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")

from the drm tree and commits:

  9877d8f6bc37 ("drm/fb_helper: Rename field fbdev to info in struct drm_fb=
_helper")
  7fd50bc39d12 ("drm/fb-helper: Rename drm_fb_helper_alloc_fbi() to use _in=
fo postfix")
  afb0ff78c13c ("drm/fb-helper: Rename drm_fb_helper_unregister_fbi() to us=
e _info postfix")

from the drm-misc tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Llf+jcIAGjBrZ9CjHZDQWCJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNsPbcACgkQAVBC80lX
0GwsKQgAhuT7YAcwMGTbZUiPbPr6ICtpwuQN7+2oe+0jemxqiaODBxvD1PvDi7cL
bj4u3zVATZxmhMEFYaZn4TzY2WsuYnzVwtmineEzP/NzML0f4ZSP/nvlBFgCyYuJ
+00oFge7ki+VWcy+6ZwlW/7ClNSyu+sADC+5N3/a9DXyKXhV0Q2jQy8e+U3Bw8Ki
CrBdy4uENOH1dcd84MtqgCOlI8KmJHwaTwJkkw9LZnM52/1gCPZhkJVN6+fnT340
l/orIVn2txdUJXVwa2Xj9b/gbt8fgutNLWY69nqm5p94OmxO/OPyr3sOB4OLzQ4r
1D05WAMAlJKPMHSBHRtUg/HyE3fQ/g==
=I2QK
-----END PGP SIGNATURE-----

--Sig_/Llf+jcIAGjBrZ9CjHZDQWCJ--
