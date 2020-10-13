Return-Path: <SRS0=mT+L=DU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9370C433E7
	for <linux-next@archiver.kernel.org>; Tue, 13 Oct 2020 03:07:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19C1920838
	for <linux-next@archiver.kernel.org>; Tue, 13 Oct 2020 03:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aPGxQXQ9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgJMDHt (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 12 Oct 2020 23:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728576AbgJMDHt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2020 23:07:49 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8FBDC0613D0;
        Mon, 12 Oct 2020 20:07:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9L813PVzz9sTq;
        Tue, 13 Oct 2020 14:07:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602558465;
        bh=tJfLy15Oh0fo4qU4WnhKcM5j1E7Q6yLHBc1mvdAZOEs=;
        h=Date:From:To:Cc:Subject:From;
        b=aPGxQXQ9RMjHNnRXR15BH2f5UI3sF9H4Stk+Saw1Xbqly0YTCVk4GZa43Y/Zi7HJc
         Hy8Wwfykf+tjs/NT4c2nEofSZntc8SoZk5lmNg/qdnghbUkqFJCy08TXxD26x5ON+M
         Yz580WUncvef2IvEEOpj7+zXAWbrvCO7ukviX6I58URD5IVSOwx2QL1Ah+ljdTtZCD
         sFBW9YN+kq/7UgNexNm9ATtEMKZsAltciLPFK6hXvI1P6QrWhCf/8oedLY53Zp3MfT
         p+DA3PKhXAgh9zunXYtg0gNpvEALTC+FznL+EQiqJHKCpziqzZ2vLsvyPCOzhVhAaW
         akDsimSVDXf7Q==
Date:   Tue, 13 Oct 2020 14:07:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Williamson <alex.williamson@redhat.com>
Cc:     Diana Craciun <diana.craciun@oss.nxp.com>,
        Bharat Bhushan <Bharat.Bhushan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfio tree
Message-ID: <20201013140744.64937ecd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qs8TWmdupUetD_41d79J3uv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Qs8TWmdupUetD_41d79J3uv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfio tree, today's linux-next build (x86_64
allmodconfig) failed like this:


Caused by commit

  cc0ee20bd969 ("vfio/fsl-mc: trigger an interrupt via eventfd")
  ac93ab2bf69a ("vfio/fsl-mc: Add support for device reset")

I have used the vfio tree from next-20201012 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Qs8TWmdupUetD_41d79J3uv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+FGgAACgkQAVBC80lX
0Gwt7QgAmAYXBkJmd0zBip2tYUm/ndYaM71s5G5NN//MpWUOV0NKYDjfNZF8Pdda
U+t6ZFql545Z4xBEha2ZTKonkgc7udnceOns6HdwgtXBoFcoG7RAtvevGHirZYbs
nmoI6REdlcQT6mdnVZ4ZPoBG/pMLHo/cFvlZhIgh3lCUgJQIGnGFkEoKLEaFe4n7
BH7Z0G2YLy63HaRoCNiN2PygCWSyEb6OV7xwLh5XbUlJPMoIEy7wSz+d6OzQZ0Nv
wN+HU12S57FJKiD53MQ0vfKFaCHADh9D8S+dG1b90aKmNl6u49s/JPxVLTj9EqA0
EGpiyfYtRIyCWhBfbuTQwMQqD8LCVw==
=8EQa
-----END PGP SIGNATURE-----

--Sig_/Qs8TWmdupUetD_41d79J3uv--
