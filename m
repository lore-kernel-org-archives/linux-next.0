Return-Path: <SRS0=qnOo=EM=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50BAC388F7
	for <linux-next@archiver.kernel.org>; Fri,  6 Nov 2020 00:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA90220782
	for <linux-next@archiver.kernel.org>; Fri,  6 Nov 2020 00:19:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ou4kByin"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732046AbgKFATZ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 5 Nov 2020 19:19:25 -0500
Received: from ozlabs.org ([203.11.71.1]:55911 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731860AbgKFATZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Nov 2020 19:19:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CS1Gd1yv7z9sSn;
        Fri,  6 Nov 2020 11:19:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604621963;
        bh=Yo0g6bFZL2sBmHxL8yHJUvx5kULiPdsn6EWfyQUThxY=;
        h=Date:From:To:Cc:Subject:From;
        b=ou4kByinq3eyzjIatzeWiBRteHsWvvMBGm7npcSgTmdqC49FRH1c9sWLn4lQcKJR8
         49yxMIP5BgtFd30PnK6pbzihWGjD3vt8pjInGrNncd3D4aSF9y21+yLIS4qvcDKSXY
         cK4mrAZjTVzIyrbfeblr6C1FZbQ0H/0MmQ5EgdqZME/PMi+wkGhbSWOi34Vx6AVlzS
         CtpP0jUKDy3J0aYFbEr+bwjR5jLDM6vKo8ct/QpZ/ERfbQ6v4RYLajRFWRAesdYFWo
         ltOCrIB9N+6/U6a9LhOi/gWVfvnuBC+6CvmHkaM1OGViv3oCd0h61kSyNxg3H8InEu
         oFsTyKAk9WyDg==
Date:   Fri, 6 Nov 2020 11:19:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: linux-next: manual merge of the v4l-dvb tree with the v4l-dvb-fixes
 tree
Message-ID: <20201106111917.2d62e74b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UuoFTWcXK907bbu4FPka9gf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UuoFTWcXK907bbu4FPka9gf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/platform/marvell-ccic/mmp-driver.c

between commit:

  e6fcf468c51d ("media: media/platform/marvell-ccic: fix warnings when CONF=
IG_PM is not enabled")

from the v4l-dvb-fixes tree and commit:

  009e3b8d9e28 ("media: marvell-ccic: Fix -Wunused-function warnings")

from the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/media/platform/marvell-ccic/mmp-driver.c
index 63fce1b85d26,032fdddbbecc..000000000000
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@@ -307,8 -307,7 +307,8 @@@ static int mmpcam_platform_remove(struc
   * Suspend/resume support.
   */
 =20
 +#ifdef CONFIG_PM
- static int mmpcam_runtime_resume(struct device *dev)
+ static int __maybe_unused mmpcam_runtime_resume(struct device *dev)
  {
  	struct mmp_camera *cam =3D dev_get_drvdata(dev);
  	struct mcam_camera *mcam =3D &cam->mcam;

--Sig_/UuoFTWcXK907bbu4FPka9gf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+kloUACgkQAVBC80lX
0Gyj4AgAi49OW1ljQBv4Q0Sm/cywHtCNtNsVcAvK9bdam6LCnGyBUw05U9XkFnz9
tnlsITLgmVjQaQqh6IEDmi3FS73SOB6jLiLj6+64L4HbdN4yw91y2KZIn6Yk8oIS
xyqtLNQZuYxSR9tT1nIUoQZAq0cFDH50b1Oyuy2KI9/fE28PtZJRh630IspeDh5R
Wawhd2ZMbPWpfkPLGGcoVCnV79WEQV9QhxzKDjwMN0RLmoNH+p05TKwxE4U1E14t
amHTEs6D1nG7l1MdMQUEStHqt8xK9PiETa1+yJYXGSvVkwahmwEsf+YqLOTrBOwE
dm7JmQbhx5yJTc7L6K3D0NLTe2uSDQ==
=ZiHW
-----END PGP SIGNATURE-----

--Sig_/UuoFTWcXK907bbu4FPka9gf--
