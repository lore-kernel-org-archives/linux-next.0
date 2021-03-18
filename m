Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A32C433E0
	for <linux-next@archiver.kernel.org>; Thu, 18 Mar 2021 05:55:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E285464EB6
	for <linux-next@archiver.kernel.org>; Thu, 18 Mar 2021 05:55:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCRFyf (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 18 Mar 2021 01:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhCRFyM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 01:54:12 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1AD7C06174A;
        Wed, 17 Mar 2021 22:54:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1GS02M35z9sWK;
        Thu, 18 Mar 2021 16:54:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616046848;
        bh=Kh21eM1n+dlXF+R4eTMG78Pm2+YY//CrT1YqzbNUYO8=;
        h=Date:From:To:Cc:Subject:From;
        b=QoTJiQYtSjCDECz0AoV/e7xMAqxSTTEoaLS5BlQd/OPutdgzm465jGIF7zGe9TwN9
         9IeJzJyO611+IcBNDCbBGEn/4azPTZqWapWbnaaIsQcmI8Flckrs8sKNcu3uQhb7Nb
         thbsunsJQ/rVgIja47cgB67zsr5N5z0WmN6AdYL7fHlI/WkhsQDyqQbWK3NqKYCnmJ
         l76Vcp78xXiD5iOwuqlWi1RW1ENEephTzJPy9iIPYY7xFCRKKfnbDo/AqhHq5OkF9c
         Nyxlq7slxg7g92WoBjDZlIowhI/oqX3PVORXB6+usFYOqG0mjjJuD2NvJsQLsbIwxt
         Yxg/5Q9OdlKrw==
Date:   Thu, 18 Mar 2021 16:54:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Mike Christie <michael.christie@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the scsi tree
Message-ID: <20210318165407.0873d58b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zfb8=s+tDkOtp5xrnsTkWvh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Zfb8=s+tDkOtp5xrnsTkWvh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/driver-api/target:19: drivers/target/target_core_transport.c:=
1661: WARNING: Block quote ends without a blank line; unexpected unindent.

Introduced by commit

  750a1d93f905 ("scsi: target: core: Break up target_submit_cmd_map_sgls()")

--=20
Cheers,
Stephen Rothwell

--Sig_/Zfb8=s+tDkOtp5xrnsTkWvh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBS6v8ACgkQAVBC80lX
0Gw+uwf/ZP7n3//fff4dMI+G4CPb/GsFZgyBP086Z+qKlPtiWUCRHW1C+d8lQYIv
C/gA3QZyWsgv//6FD9MlXWDdZbppj4Ww7ZoSzygQF1QYb5K+SB7Ecp5pypgZajrp
PWiEHP20RizDjvuPx2cyo4okL/JzeJZBHzRuFb+14lRfW+8P9u9OVIK3+q0ugx5U
9PvV2E8NJ8UMVQAd2JDvorCNuY5zfLnFVwFhjlotrO4nj8mIkigmGEJzKNt7PF95
WxWsJy5zV0Wf/25uanar083mijRpmVUSYCgyM/AqrwjxYpAxTKt0A+Sbi38ZU3nk
NwsXzyycnSMMdmJsASvzHu1zXK6VOw==
=qDRF
-----END PGP SIGNATURE-----

--Sig_/Zfb8=s+tDkOtp5xrnsTkWvh--
