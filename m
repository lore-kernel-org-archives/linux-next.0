Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8ECC433C1
	for <linux-next@archiver.kernel.org>; Wed, 31 Mar 2021 03:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74F0361962
	for <linux-next@archiver.kernel.org>; Wed, 31 Mar 2021 03:43:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbhCaDmu (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 30 Mar 2021 23:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232805AbhCaDmS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 23:42:18 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CE5C061574;
        Tue, 30 Mar 2021 20:42:16 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9Bvn19HVz9sWQ;
        Wed, 31 Mar 2021 14:42:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617162133;
        bh=6Wg6ZTMT5Qiu9ZgB8C4BQb4sd79FfOSQr1dzyW7o2WI=;
        h=Date:From:To:Cc:Subject:From;
        b=ghykNrlMYGmfQfKVvpN0lAs8QZiTMbvZ18s8lA7UyVJrireRI8Sq19ftMMtTOWomq
         /n/HeEyGpHROHg65ROEEiHGwtwfV+GlJ4pG6gQUtgqRaw08QEGWIxYmnhifg7SGOFC
         U2zg50LnY1t/22fwWaSTrwofxqjMU6SQ5NTPuJgHWxC9gs9XcUra6NiNGW4VOoXHB/
         492mCUKKrbmQkefpzX1BMUbnXR7Z8f4ypS+pcTmvdtnAVLK+l7GBxGCXn9fv5AiW4w
         amerOu/MOoi/ExNEr9w6Sp6t+vR3rn84rcj94/J9ovjrLidXwjpDNjZi263Tk5CibD
         azX200nJ06unw==
Date:   Wed, 31 Mar 2021 14:42:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-tegra tree
Message-ID: <20210331144210.7d97cc49@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oMM1hhsnNarp=tva/B5ND8H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oMM1hhsnNarp=tva/B5ND8H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-tegra tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/tegra/dc.c: In function 'tegra_cursor_atomic_update':
drivers/gpu/drm/tegra/dc.c:883:6: warning: unused variable 'dma_mask' [-Wun=
used-variable]
  883 |  u64 dma_mask =3D *dc->dev->dma_mask;
      |      ^~~~~~~~

Introduced by commit

  647779e7270a ("drm/tegra: dc: Implement hardware cursor on Tegra186 and l=
ater")

--=20
Cheers,
Stephen Rothwell

--Sig_/oMM1hhsnNarp=tva/B5ND8H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBj75IACgkQAVBC80lX
0GzYRAgAo0mC41qJyWNKTCemcTTqYQPOyU91LpfIGCXlyP9hBD2a7KnkbaGAtd9B
LX4ddtKSL87ZRwAUF1RKUNZHaFJbmlB0RGbipz8neNsaSsc3SunSTEEgGoc4GL4Q
Kx+F/9K6CU94X35d2gM5WtHdAxyT4IPuXlT4RC/A6xgR4o0Hv5BYd7kxHQ5GTtNF
p88nsZLLX18BI5ZhoKtFPBYZ8ecyMWm4oYry3/9nPan0Kbg8vmwBSzo9E/4qOsPX
vGkSl2lUA6WlEJfBabaF5nPPd1wD2AjWcwsWgRk5GLzGFxHM9pXbUSRX1Qfb644D
0+8o+7ofmGZJefZT5mEB66QOha59ng==
=WOf1
-----END PGP SIGNATURE-----

--Sig_/oMM1hhsnNarp=tva/B5ND8H--
