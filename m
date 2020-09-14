Return-Path: <SRS0=31GW=CX=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62946C433E2
	for <linux-next@archiver.kernel.org>; Mon, 14 Sep 2020 01:40:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62D4520796
	for <linux-next@archiver.kernel.org>; Mon, 14 Sep 2020 01:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HkOcpfuM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgINBkn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 13 Sep 2020 21:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbgINBkn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Sep 2020 21:40:43 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90B7C06174A;
        Sun, 13 Sep 2020 18:40:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BqTZl739Sz9sSs;
        Mon, 14 Sep 2020 11:40:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600047632;
        bh=/yCJ8elKP1QQENEZBnQ5hHOj9ioJVTXN6Py42n2Nv/0=;
        h=Date:From:To:Cc:Subject:From;
        b=HkOcpfuMpMvs5MND37akdSD6Kq5ksFolzsmMxk2UfpM1WLCnUgqcTeFaKrJRu6mv3
         pAWXhGL/bq0P6GooLaAnwOzaRmufjEpEIF6+s2Mc052rdzHTbqabrO4bdeITcvB2lK
         unip2KBLrl9V/+F4/S5j3La0RTSqe1ZLn4Ye+24qdb75mc4NSGyZP0ACk8YZrnJWpV
         bEfkOVt9wXiC8Bpx0edxDA0HAGSHrvkyi+tSOE+5yUtqN/HiN+1Af0CFUkNX80tcfD
         gYgC06Ssq/sU6Ks/qXsQb2r4s3yU1wu1BnfhlRzJbCPsN8R+CBvRKr6fD0Ad+YyyeX
         BAexG3ftWwZoA==
Date:   Mon, 14 Sep 2020 11:40:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the nand tree
Message-ID: <20200914114029.44b7f292@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tAmxs+g7HRi280xCd+CxMV1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tAmxs+g7HRi280xCd+CxMV1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: In function 'common_nfc_set_geo=
metry':
drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:514:3: warning: initialization d=
iscards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  514 |   nanddev_get_ecc_requirements(&chip->base);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  950c7c7026ca ("mtd: rawnand: Use nanddev_get/set_ecc_requirements() when =
relevant")

--=20
Cheers,
Stephen Rothwell

--Sig_/tAmxs+g7HRi280xCd+CxMV1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9eyg0ACgkQAVBC80lX
0Gw83wf+PNXqPUyCWPz54ZgSMvBMrAS6dJG1dso02gJsTtydwfqUPDSj8jF+f7k+
akqCuYUdSzSwGAZXjmZSUBl/SYCPaaD9jjxwfT1p3o75VUJyP++jQh3OEnpeqnmL
OmD5Phtcrd+P8V8TNDUYYMi3heSLq5o5SWLsfly6wEGN7nS49AAI1KhdPL3P1PWB
DjPxi31l9qAhQ086QYeKL5A2RsKgNLR7ShYzOCMSEW1xIJqBuiyZ6XABxMR220cl
EXMOAusNbstPQIHKopAjnWFeh9K876CJclf3mF42uPCFbc72UyfcFt/qIlEMYsf3
rGI4LxhHkvqQVH1EqTXRKZNNlOy+Ww==
=bAie
-----END PGP SIGNATURE-----

--Sig_/tAmxs+g7HRi280xCd+CxMV1--
