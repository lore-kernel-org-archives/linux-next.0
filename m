Return-Path: <SRS0=PxEu=DN=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6FFC41604
	for <linux-next@archiver.kernel.org>; Tue,  6 Oct 2020 05:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51F5A208B6
	for <linux-next@archiver.kernel.org>; Tue,  6 Oct 2020 05:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZvBQcmAK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgJFF3D (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Oct 2020 01:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgJFF3D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 01:29:03 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DD5C0613A7;
        Mon,  5 Oct 2020 22:29:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C55cF0SFHz9s1t;
        Tue,  6 Oct 2020 16:29:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601962141;
        bh=F+1rPI31EQ0Yp6CTlJrktkE9AdgfgC4kNv8vVKKJhyE=;
        h=Date:From:To:Cc:Subject:From;
        b=ZvBQcmAKqqxxUUQiMM+Jmg5T/CogRGVcpPyHFoBw/aY//SkCA8jT7TDcI3Z6YpeWw
         HI7hX8X1TT2c2fn1uR7qIaPQqJVExYg8n77DhORor0N+utf666hgYA9ymubGByKff/
         uLnn0wq2L1JNvzzccDXQiCUeNdPnIu8WbxjEAe3o2uh6FPi+wdXNHJnAU2oCmsvUf+
         pFHmW9NzDCxWLhWXEzCcdm3R83CepFF1yfUDk2YVDYeKM76jb9h3oysWLLD6sYFxyN
         eFXK9Wq0OLYiqtB4egH2MgX/BPQfqK0ZiDJSf8j6oh0PLmE31+YDVI+/MZwTTHIfvl
         mvLaKdEcRPJzA==
Date:   Tue, 6 Oct 2020 16:29:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Raul E Rangel <rrangel@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mmc tree
Message-ID: <20201006162900.40f67920@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8taTh5X6EUuHwNuuNpD6e6C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8taTh5X6EUuHwNuuNpD6e6C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/mmc/host/sdhci-acpi.c: In function 'amd_select_drive_strength':
drivers/mmc/host/sdhci-acpi.c:562:39: error: 'SDHCI_PRESET_DRV_SHIFT' undec=
lared (first use in this function); did you mean 'SDHCI_PRESET_DRV_MASK'?
  562 |   (preset & SDHCI_PRESET_DRV_MASK) >> SDHCI_PRESET_DRV_SHIFT;
      |                                       ^~~~~~~~~~~~~~~~~~~~~~
      |                                       SDHCI_PRESET_DRV_MASK

Caused by commit

  e9b80bb74fdd ("mmc: sdhci-acpi: AMDI0040: Allow changing HS200/HS400 driv=
er strength")

I have used the mmc tree from next-20201002 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/8taTh5X6EUuHwNuuNpD6e6C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl98AJwACgkQAVBC80lX
0GxQSwf+Jxjfn1Jt87/SOdDPeyd7ILWRp50SH2k+SHHOHYVAsHSIYsbgcUyaC2Mp
Av6DACiT5LH6Pm3aFk6SeRQuvWpQuagZbxWOmT1bH/Dy+G9h1sFvqU77HxY/SzCQ
2Vh0qyoKByX83JahjyUl4bnntnw/WkrSeoJfv5FyDqZZn5MXb0oQtOtjeETC0En0
+1ebBrnorb0/oi569CJTjuXVcXlPmrKXZx5ZgFx2tBon4OTja018ooOzkeBcuo/f
tFS/J2oya/xT2Qw8ZpudGszU9O0+CDTmc+x9XmRh+Uj16HGaGthbj+SKb/SIIFxw
gM8XiIOwXsgl6FH46JkykC7t/wyImQ==
=MbRs
-----END PGP SIGNATURE-----

--Sig_/8taTh5X6EUuHwNuuNpD6e6C--
