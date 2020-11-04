Return-Path: <SRS0=3FhQ=EK=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92B2C2D0A3
	for <linux-next@archiver.kernel.org>; Wed,  4 Nov 2020 20:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EAEC20709
	for <linux-next@archiver.kernel.org>; Wed,  4 Nov 2020 20:41:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dE92vS8H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731333AbgKDUlV (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 4 Nov 2020 15:41:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730407AbgKDUlV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Nov 2020 15:41:21 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1954EC0613D3;
        Wed,  4 Nov 2020 12:41:21 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRJTS5cXHz9sTL;
        Thu,  5 Nov 2020 07:41:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604522477;
        bh=9tuejbhlNYVpm6DtiIZCOBp12CXoMw3K9gLO/QNrOh8=;
        h=Date:From:To:Cc:Subject:From;
        b=dE92vS8HXbE1C08kuEt+733w4MG9NG3/76bAm6ijP4xFp3w1XCq2setEaEfKA9U0O
         aFZTbjIEzi8i0ddi+TsF9AKIhby2hm3RY2O9t/Lv4AY1LdEV71Z7NfCjxXjeTkqRWR
         XdCJZ0DL7C5GxEeQcxaAkGBhmbHXsPxtHsYdmS/TYzmirhjeIBY22EBlGjqooS+AtJ
         /CP0yU9U5XXw8MGFF8ST1HC5dTdIGSp501oOuqJvbSYK9DFYZ5mCT7fJ7A7ugI99Zr
         +Bx035fvUAUhEZuJiBd+3RWWXWFhB0FPrUOaoYsEZa3EJ/WeJTG88K5zMeTDDEbpZp
         I7K6v769Fqnrw==
Date:   Thu, 5 Nov 2020 07:41:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20201105074116.3bd4e927@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gamacw1epmQc=d6EORWqEvt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gamacw1epmQc=d6EORWqEvt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a0b21e0ad294 ("drm/msm: Add missing stub definition")

Fixes tag

  Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/gamacw1epmQc=d6EORWqEvt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jEewACgkQAVBC80lX
0Gxuewf+ITqspJwfcA/YOThxH0hZLW5HO+FS2vBrDyUWJAO7Bsf5o+RecS2YToxc
Xw4gMnKM7s452IA4nN+hXF2JBNbDZDy5NLmbKdaTUpQOd253fKpc76dlxTA+saiK
E6bdJVmQtXasHnaiuY1erFkOihfNOijwIe3nbz/EbhC2G0pVI64J/K6JUYxbRbBe
LS9SbrIE1dxbDicplbRNbhfO9vvroFiC+jv1HDBBulk6u8BMA/PRIxitIBPAovub
Wor6zRPwAZEJRfK7Fo4b7VAnR/OlKbhWhrsX2N3PA0Lhld4XMdYZ5JJXv1/vlxVm
ddPLd7vfkXKvgFZmuRxUMex+1oaxrA==
=/CBQ
-----END PGP SIGNATURE-----

--Sig_/gamacw1epmQc=d6EORWqEvt--
