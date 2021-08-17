Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FA6C4338F
	for <linux-next@archiver.kernel.org>; Tue, 17 Aug 2021 21:58:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC29661056
	for <linux-next@archiver.kernel.org>; Tue, 17 Aug 2021 21:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbhHQV67 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 17 Aug 2021 17:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhHQV66 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 17:58:58 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454A9C061764;
        Tue, 17 Aug 2021 14:58:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gq4fP1vf8z9sWd;
        Wed, 18 Aug 2021 07:58:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629237501;
        bh=XIFY2/pnbFMynEgdVDaDlRg7mIPeme4ip3ceBUCsuVo=;
        h=Date:From:To:Cc:Subject:From;
        b=ae4bhMiU6WKqn4nD41H6YooaFZVRy5qIJPCSrQF8lz4cYUlpmXa7ACUKUPyjW6wHv
         k5xUtBjBzOuaydNKebHiQvRq4FxLQBu1bL549jNABStXLwqT0bK98hNkdtX9E3IEEb
         WYsvQ9GcO6JW21Btz02vMJ/SwBHHfFdnLOSV0ztuynZZYPN3lyZPUhZ7ovLbwcEJa6
         gxtnHcmboZQlita/pkhHZnbw91fVSu4uk5pAxUVvLNA5ZPRaTAtFPLDHVLuvbr6A01
         0rCGHrogxHu2HVHrIIqC3s4jx7tUAOFNAZSZT5rs5ygjQZlYmjjs1s/t6uXYjK4/nV
         R4Z+BgOzubRaA==
Date:   Wed, 18 Aug 2021 07:58:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard.weinberger@gmail.com>
Cc:     Zhihao Cheng <chengzhihao1@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mtd tree
Message-ID: <20210818075820.702c0230@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DcfiD+SSadF9cjPzubCI50s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DcfiD+SSadF9cjPzubCI50s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a89d69a44e28 ("mtd: mtdconcat: Check _read, _write callbacks existence be=
fore assignment")

Fixes tag

  Fixes: 2431c4f5b46c3 ("mtd: Implement mtd_{read,write}() around ...")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

So:

Fixes: 2431c4f5b46c ("mtd: Implement mtd_{read,write}() as wrappers around =
mtd_{read,write}_oob()")

--=20
Cheers,
Stephen Rothwell

--Sig_/DcfiD+SSadF9cjPzubCI50s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEcMPwACgkQAVBC80lX
0GwwGAf/d0E+EmQXR2/1WpmHAMmcQMPGMGAhnfGDskNfjWZAuvKC674Z5DYz5h1r
ctF8n3KNAYBB6VzYLFlt5RZEhbpi6hQhym8x2Blp3Yq6jwc3GkbxexApnL8kt3SY
1uoNGuqQKy+hkZVzrm51yC3E24GMLFd5qpjR/kR/nFrO3l529gKzPLkTASqfOjLn
f1hmY/a47HVCzCfdjVlLQqIy593mkOBnHsFvueej2LLcAOUW1zVNIOydLWQJaWc+
EraApst4KvsXohvuW/jWrRY711uq3lXUPMMdIHNqD9sEdfkiljBAoIIIF69sAPga
H/yPIdFQCHtfI7UdbmHahAMkhqu0Dw==
=lDZN
-----END PGP SIGNATURE-----

--Sig_/DcfiD+SSadF9cjPzubCI50s--
