Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711F4C2B9F4
	for <linux-next@archiver.kernel.org>; Fri, 25 Jun 2021 04:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48B976140F
	for <linux-next@archiver.kernel.org>; Fri, 25 Jun 2021 04:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhFYEVJ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 25 Jun 2021 00:21:09 -0400
Received: from ozlabs.org ([203.11.71.1]:52717 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229458AbhFYEVI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Jun 2021 00:21:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GB3fH1gyKz9sTD;
        Fri, 25 Jun 2021 14:18:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624594727;
        bh=ikfYLnjPlLd+16TrxJyxnsOauAGnGc0HzllFk0+kFQg=;
        h=Date:From:To:Cc:Subject:From;
        b=qr4VM32SHdtXQtpLAn4wt7u7pwHGcEcx5zZDZG1mGAHrs6t1Gs4sYlQn1NWiLQFoC
         VLg5j15SRzsKDRinoOiTHj2Rpy+DJMCWVEha2Rh8CsBEE6idO8iKBCkO/NGVcH2tjP
         4lqTj49RalIDmxtJeAJhAa04cFoxN81ixs3ZbajGrJxYLHx8J7BLUrijwlHOEpicgM
         C7CntQjZSXWTWAdrpqGKBVbni4rua5x3q5EayKIQZ6AxZARBnyLWOf5+TiH1xufuoS
         Ov1BB6PiyZo8IctQCkwXUNc9KB0vWwSBCbo7OgITD2t9eMROMF/08ZUBybLcftrW0N
         6At/8XlW0ax2Q==
Date:   Fri, 25 Jun 2021 14:18:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the rcu tree
Message-ID: <20210625141844.2f196aeb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KzyL5UbGINWFyPN/FlOnA6X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KzyL5UbGINWFyPN/FlOnA6X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  c6f5e7e1ac95 ("tools/nolibc: Implement msleep()")
  d7c47ea32af0 ("tools: include: nolibc: Fix a typo occured to occurred in =
the file nolibc.h")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/KzyL5UbGINWFyPN/FlOnA6X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDVWSQACgkQAVBC80lX
0GydSgf40c1XCZG4umdyorsrcTicJ21aKghAcfYp+WavcK+0935lD5UOI/Fc6yFA
Z0aItjAKnZ8NFazrugWIXspmrvzKifzTOQPL8y0fjmWEQ3OvBZ8FUXCxx99nLob2
jA0MOnQz8S63n6956+EPG1FEKYr2Dk/BRJCLE8x95NMeMGwgexxGF99iWe91Bkso
uAvwcZQYW7OxoNZEeh+uDs6omzqjbBRvn07skGmeQMlwLbCO6vYOG6zttTC3IyBg
TgUC17rRXnEZoAjsImzOupVo20jeSqxkPuWx7ZYtxB0AlLl03Toj0WJG2P/jrTj6
U3aFqrMiKUO24510qmoxw99ttGjT
=2nd1
-----END PGP SIGNATURE-----

--Sig_/KzyL5UbGINWFyPN/FlOnA6X--
