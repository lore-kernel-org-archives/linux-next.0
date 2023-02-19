Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EEFC05027
	for <linux-next@archiver.kernel.org>; Sun, 19 Feb 2023 22:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbjBSWNn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 19 Feb 2023 17:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbjBSWNn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Feb 2023 17:13:43 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B34113FC;
        Sun, 19 Feb 2023 14:13:42 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKfvl1Bzyz4x7y;
        Mon, 20 Feb 2023 09:13:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1676844820;
        bh=MtmZXFnOG0dkXY80bS7ds/ZXPpFMhc5/CZXVQaJX7U8=;
        h=Date:From:To:Cc:Subject:From;
        b=FqLmZcYRZDGZW49t2JhsYC3VMLlSTaggQT5Ih0vHjpHAx0MzZuTF+frNem82Mi4Yd
         XwjyXVGC4ntTt3N4n4dgdLVh8ZrUsr81xPTFOZv44Bixs9Xg9rG71m1S4+f+V+vjWp
         dRvxrjTAg1pVRxRFeLL2OaBGhnxbS5g785VW5iRKwoxGJfkPa3I6V9pC4TvLqR5hNW
         ZuTZTVnjdgcPQYSlvZmjb5SUuPdJuNkZeuAPWCfGZwrK9iwVLz9XWL1kcECGXqnS8x
         cEMoBcsAVi7Bqua6nOAXJLpZZdawXwD2Kncr9iJM+hjKISaHt2Dvhtw5P4DTQ4xFLe
         1hScDpNxFjmIQ==
Date:   Mon, 20 Feb 2023 09:13:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc:     ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the davinci tree
Message-ID: <20230220091338.1608ab57@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RqYn8pIejbNs=dhf+bG=LbK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RqYn8pIejbNs=dhf+bG=LbK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  eaafab7e8e26 ("MAINTAINERS: make me the maintainer of DaVinci platforms")

This is commit

  88941ddefc2a ("MAINTAINERS: make me the maintainer of DaVinci platforms")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/RqYn8pIejbNs=dhf+bG=LbK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPynxIACgkQAVBC80lX
0GzKdAf/Tqto67Sq0VRGAwoZi4Dw+qG83ysSmYYZ0ytcCnly1x+msoBy0i+cVqEf
GYAllqLjn40efS88I1LYJFJTpIcC8b/UnwfY8mVU4YhjOFlikvs5OKK5xCmF2q7W
vQG3Poku1jVTJFgSphRurMDv7xVw9estS1T8gC9WDDZnsFWn+x1hLzFMX2Gve84E
ETUn8TYDONfP9YCJ9v/sph3dIzLBgxmUTfb8S9G9BUgiKdsZObsKI0oBE6F8m6wd
8zXbQ8mB6+JgTbWGdtCORvFElCYYUn84S1FnrBchx54FJ5MGwv852ZxRcz052SpX
+oPeg30D8CoFa9F9CYWgfdQPThqc1A==
=UVM0
-----END PGP SIGNATURE-----

--Sig_/RqYn8pIejbNs=dhf+bG=LbK--
