Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A14C61DA4
	for <linux-next@archiver.kernel.org>; Fri, 10 Feb 2023 00:14:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjBJAOJ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 9 Feb 2023 19:14:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjBJAOI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Feb 2023 19:14:08 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D411F5DC0C;
        Thu,  9 Feb 2023 16:14:05 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PCZ3G436vz4xGR;
        Fri, 10 Feb 2023 11:14:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1675988044;
        bh=2yHKY9aFyNlmViZI0EwmA59DXVXoVYQUY+c8M1ZgJPk=;
        h=Date:From:To:Cc:Subject:From;
        b=aKm3jykJ+++qsZNF6TFyZnaYx0BMxUw6R03LXsvNz7+UtOypPwJsJw9gW7bgrGkok
         ZGwZYSo2M49X8/QbSYxfJqXXV0wzZfLvxcCMmZCIMq7ncFufDYXWy9zmMblb3L/2Ns
         DIgRTxychHe3xGV0sHtSR8Ft9cijlCftWUWwn7wY1JmngOsAWu6/SwuLIpjOZSA4DW
         7GBQBv/IHdsgWgCQ4HrZ3LUCuuqg0TgwJxnI3YAJbGZK+gULopkxWMoUUufRmbcGgi
         f57H/qzRnFLBmRAitytIY1+9/fYEHBTr3N4/4oksaW2vm1h4AwURx0cKXl0cJERkAs
         tLWvHdA3oo01g==
Date:   Fri, 10 Feb 2023 11:14:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Cong Dang <cong.dang.xn@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the drivers-memory tree
Message-ID: <20230210111401.7b22765c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1C_pOKEamel15TCxDy_KJsE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1C_pOKEamel15TCxDy_KJsE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  cb1ed99d9520 ("memory: renesas-rpc-if: Remove redundant division of dummy=
")

This is commit

  637581ce6040 ("memory: renesas-rpc-if: Remove redundant division of dummy=
")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1C_pOKEamel15TCxDy_KJsE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPljEkACgkQAVBC80lX
0GycHQf/TKqL4oXG+LqaKmEr3RqZtypXOk0pN/MNOJ/kurFxN2vOr3Rdx/rbHLWb
20/ws9giuqKuUoYN8y9YSaLv2u3/jD/S3xayEnMzqm9yzSL7Ubt0c3m977a2SnzE
NJWs5VoFrJ5IHbkLLAdt4culn8k7lTSrpxAJFysFEXKYva0E9wo66AbLHQf7tg87
+szvbWJPk3u45faxbA0BiP0dGYb12m6CB/FhClcVvjiP7ZqUpdNvQsM2T9iUJyV6
RQ0vgmVHojkOg43h2+0Ak5a71dI9CxsueRieN7efXZr/FxWMg7L0dBWgCpL8fdup
cfWIYivA/SL/hXtC09/Xqah+gL+waw==
=lzsV
-----END PGP SIGNATURE-----

--Sig_/1C_pOKEamel15TCxDy_KJsE--
