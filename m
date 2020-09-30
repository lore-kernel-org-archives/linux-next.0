Return-Path: <SRS0=tbLQ=DH=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F6FC4727E
	for <linux-next@archiver.kernel.org>; Wed, 30 Sep 2020 13:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A780120738
	for <linux-next@archiver.kernel.org>; Wed, 30 Sep 2020 13:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BPHaZKlY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgI3NS6 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgI3NS6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Sep 2020 09:18:58 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE83C061755;
        Wed, 30 Sep 2020 06:18:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C1cKC2CYTz9sSC;
        Wed, 30 Sep 2020 23:18:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601471935;
        bh=FkDTgKkdMZkN5NHC27aOBiKvLMyBdJbffOKlNeZGAWg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BPHaZKlYX732fbsVavb+Z7tCtAbp+DuQ0S9eM93tw8/rfbAwxp7OeJxukmTn0RtiW
         mdCocFo8X3Pej083TSdLHKIzCwHhCsi1YD+I/3J6Jd286PgB1njy4ohvr67EaRg0P9
         WsHk9jaeexOQuydeZQSSjkYbWHwFfPEjZc5uCBmMigcw3Xe4uwftcJ3bxyNjHPRXlK
         6t24Mm0EfiX3plm5ADWpFzvugCs+Sf+Y7siic1UeRKs036pRAUIaoeTUt/LvObGoZJ
         2N4d2EcwVT99uLv4LYKIZgSKtP9dIanUGTbAMfvdy4ZXAcC9Ypi9EovjDQ1lAiFbpv
         7Hty9ys3DJ1KA==
Date:   Wed, 30 Sep 2020 23:18:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
Message-ID: <20200930231854.0ce0de19@canb.auug.org.au>
In-Reply-To: <20200930230119.4ca24210@canb.auug.org.au>
References: <20200930230119.4ca24210@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rbalI3ONL5eX0sbd1CMFIJK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rbalI3ONL5eX0sbd1CMFIJK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 30 Sep 2020 23:01:19 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Just use
>=20
> 	git log -1 --format=3D'Fixes: %h ("%s") <commit>'

git log -1 --format=3D'Fixes: %h ("%s")' <commit>

sorry :-)
--=20
Cheers,
Stephen Rothwell

--Sig_/rbalI3ONL5eX0sbd1CMFIJK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl90hb4ACgkQAVBC80lX
0Gw5qwf+PQFnelYHkdtd/iykyRW9B8oDK53BDGDSjSBE0vHP1S2Km5ntImubM+4g
6OLL9FrYBvXuZ98cTFF2aiFEBaxmkbK03Kdg1RNbmAI9+PNsu/suWPEz+uO++/hi
n+2YZ4qPuXsyu2+tpcJWAJSdhT74hU+i4rLbSE+yprckWtCvveWi/G8b+ssxCvnc
ulSqcNeCxqIryrkmnJhK//rJwmm/7bYu0WhfPWonlWZ6GGnB/BrfMUrKR8FPwrbK
VYlo5otGP6114dnEzVqMCLlSWYRptLxnXPjdCuNENyxk9w6YddVX4lyF8DQH6Hxt
wF8vnw6eJ2NUOhWMzSyICbuY3x2puQ==
=gVIx
-----END PGP SIGNATURE-----

--Sig_/rbalI3ONL5eX0sbd1CMFIJK--
