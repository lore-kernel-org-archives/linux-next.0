Return-Path: <SRS0=PU4T=EL=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB46C2D0A3
	for <linux-next@archiver.kernel.org>; Thu,  5 Nov 2020 01:50:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FB6620729
	for <linux-next@archiver.kernel.org>; Thu,  5 Nov 2020 01:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DlfWIKhX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728784AbgKEBub (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 4 Nov 2020 20:50:31 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48793 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgKEBub (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Nov 2020 20:50:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRRLF0LVPz9sTv;
        Thu,  5 Nov 2020 12:50:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604541029;
        bh=Mnxa79fuSL3tbrhtyzo4azkG4okB3ssiobq0b38MV4k=;
        h=Date:From:To:Cc:Subject:From;
        b=DlfWIKhXKN804nuaPjLyYsEP2Ni0rFRQtGRUHF0ziV0/AP8moUJsJzbCFy4T9WfNT
         bCVVIUdNhi1pEza3kqnMwibj9ENmVHt25Bs7Q4gw5FjSlTBN+EJGF8hVoMPdzJrTLp
         3UvUXKBU24b2/Me81GA4kMhTKQra+p9F1YF8wAwpz28C2h8i9QZDjkAL8HpXKBqxXM
         p9LKpKHYab3I1eVO9XKcXzRp24Fk1uLIZmc1ywLWMyIQtr0+srtGOA7gKNd6HMtnr5
         ZYjhSrXbm15Ej7SXG+PabDW+CDILjMrKTQE3y4/QTgzsQrjHBrLU07c4ESzm3ZbpE+
         pDNuekOrcFqAA==
Date:   Thu, 5 Nov 2020 12:50:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mfd tree
Message-ID: <20201105125027.1f4b6886@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8KlPu4B/pU0Y9AFAERItKqh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8KlPu4B/pU0Y9AFAERItKqh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mfd tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpio/gpio-tps65910.c: In function 'tps65910_gpio_get':
drivers/gpio/gpio-tps65910.c:31:2: error: implicit declaration of function =
'tps65910_reg_read' [-Werror=3Dimplicit-function-declaration]
   31 |  tps65910_reg_read(tps65910, TPS65910_GPIO0 + offset, &val);
      |  ^~~~~~~~~~~~~~~~~
drivers/gpio/gpio-tps65910.c: In function 'tps65910_gpio_set':
drivers/gpio/gpio-tps65910.c:46:3: error: implicit declaration of function =
'tps65910_reg_set_bits' [-Werror=3Dimplicit-function-declaration]
   46 |   tps65910_reg_set_bits(tps65910, TPS65910_GPIO0 + offset,
      |   ^~~~~~~~~~~~~~~~~~~~~
drivers/gpio/gpio-tps65910.c:49:3: error: implicit declaration of function =
'tps65910_reg_clear_bits' [-Werror=3Dimplicit-function-declaration]
   49 |   tps65910_reg_clear_bits(tps65910, TPS65910_GPIO0 + offset,
      |   ^~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  23feb2c3367c ("mfd: tps65910: Clean up after switching to regmap")

I have used the version of the mfd tree from next-20201104 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/8KlPu4B/pU0Y9AFAERItKqh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jWmMACgkQAVBC80lX
0GzXZQf/fEXP067ExoAHA93d552vwdHoWE/lTC62qersbjuLm0Cd3Lj00h6rhHo0
xDJW6OeUjoVPStPwrScCFuI07WAuPfGjIVSK20xOh2OABOjjvlvZwwDl8+VQ3AmY
HiIO8N42ofd1LdhdhU3qGzzZil8A37ur3grX1iujiyr1iluBShPgXqOsB4sxV1oB
pRW2lrmUVsTEx5vM2BgAqjsg50Zh3dJJWj8+YpDFXbWHjNLhjULDT+3oTbl1G2Kq
zv1zjvzSmL7+y3/n80NI6AWVqbzplgr72bMlQQ8u9u5mHiWzJ9HeyhchE/6Wjhut
oJdJCIrEo/NUaePOOguHHy48+9E6Aw==
=1YxB
-----END PGP SIGNATURE-----

--Sig_/8KlPu4B/pU0Y9AFAERItKqh--
