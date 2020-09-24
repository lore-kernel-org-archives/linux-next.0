Return-Path: <SRS0=pyx6=DB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936CDC4346E
	for <linux-next@archiver.kernel.org>; Thu, 24 Sep 2020 06:16:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B46720702
	for <linux-next@archiver.kernel.org>; Thu, 24 Sep 2020 06:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HYvNVW/K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726850AbgIXGQx (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 24 Sep 2020 02:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgIXGQx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2020 02:16:53 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED7EC0613CE;
        Wed, 23 Sep 2020 23:16:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BxlDw4X06z9sTM;
        Thu, 24 Sep 2020 16:16:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600928209;
        bh=vIEPy/d+ouY1HAsMITJ2LBk3ast64x0SEFEfKuM2ToE=;
        h=Date:From:To:Cc:Subject:From;
        b=HYvNVW/KQT220hVWs6sn+TM8Gs+4aPIS8hQRbP3OVITCNF4A+goGdJQONcyc1Bi5L
         VRoZ1mWeWF2QgDTTlxSx3nUCttBCqFgI5yAkPfWg+yc+4Il9FNXZL8i8I/KfWAQTSc
         AStFCeIqXSXnIczI+fvIFYcz4ZkeYfWO5wP1nIgi1tvtZUOwiO/Dc1VkHsZ+DTDzkv
         gKxuT6m6cWH8brUUCwtKaU5ETEqgI3lAUF3EsuB90eoa/Yr9clsw/A2icPzcovfPOs
         S8lZa1APdS4huJC5vwMPRDAk6i3HjN6sOG80uYethOckNHf5wwVIofWtJGsJdQZn1d
         GWyQgaTPNWuBg==
Date:   Thu, 24 Sep 2020 16:16:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the pwm tree
Message-ID: <20200924161647.39d44a7c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E=q3ubulOBpTUtt5.QlDmxo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E=q3ubulOBpTUtt5.QlDmxo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pwm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/pwm/pwm-intel-lgm.o

Introduced by commit

  9fba318f0f7f ("Add PWM fan controller driver for LGM SoC")

--=20
Cheers,
Stephen Rothwell

--Sig_/E=q3ubulOBpTUtt5.QlDmxo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9sOc8ACgkQAVBC80lX
0Gxxbwf+MLRDw9xhaw8V0qUyU1/qJOsJjVF3akcdKnOfYA8prwPmbZzFYSdDpQAI
aIwgJIg9eOL+EWJMBQe3MMa0MJLkrYVVlmmLNb8t2GQvFsuV5qzkt6Cub3KqSWn1
WBJuClflNeIbXP38u3seWoyNsbPAU612VgaSnGAc3wSpp3s2B6rIwAYGFWnqBAVq
FxgAgqR26YKx3o57PS4g379zdGRkKh3G64OWxDMmZyHUC5oXXbGTVsWwvFrea8of
WOpGWboK+Tw5bddRuED6qV0KcuTWX07vxv6x1DmKpOYN40XzcpL3scY1Q+lMpgmr
LroqYxsdnMNxxLFe469w7QGFsvQFag==
=8jyX
-----END PGP SIGNATURE-----

--Sig_/E=q3ubulOBpTUtt5.QlDmxo--
