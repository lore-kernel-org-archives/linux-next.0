Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3BBC2D0E4
	for <linux-next@archiver.kernel.org>; Tue, 17 Nov 2020 04:12:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 011C42469C
	for <linux-next@archiver.kernel.org>; Tue, 17 Nov 2020 04:12:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oI4rfedW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbgKQEMa (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 16 Nov 2020 23:12:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727188AbgKQEMa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 23:12:30 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17856C0613CF;
        Mon, 16 Nov 2020 20:12:30 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZswV2yygz9sT6;
        Tue, 17 Nov 2020 15:12:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605586346;
        bh=d7GAmyjiegBzV3JAcUGPU5HieHk4/RFJ3NQYF5JYiAM=;
        h=Date:From:To:Cc:Subject:From;
        b=oI4rfedWtmEoqGZHYamOHZhTnZzZaE2SVvz4u7xAcpFlTMmUiOjnC22Z8Gx5YHS07
         xByK/SRBLmw1FRkJ+I8XHAoLvqnomFlh4qLm41MXxYRhaG1CFNJOeEEoh4/mjhxRqZ
         v60fmnBpzFJ2nYZFmlDm74ycR1TzubbTJNUHIK6M288pQCXb8bKxrWJ2yFKHo44mT9
         hsT1dOmmJZBts3ZvmLfVTYcvUCt1GUQWSSJvQ4u0uDhrgJzntwt9Bh1K6+taT5UL13
         y3rWI1r2fRqFlO6qSs6qMvkIv2+fNp7MGwUWBKy2Vgskd0pCGlvnXSbCMdD4Lo6ZAM
         Pp0I7WbYD0aGA==
Date:   Tue, 17 Nov 2020 15:12:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mhi tree
Message-ID: <20201117151225.6a50abf8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kr5GD.ghTM1kevu1_5kZ4Uf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Kr5GD.ghTM1kevu1_5kZ4Uf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mhi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/net/wireless/ath/ath11k/mhi.c:27:4: error: 'struct mhi_channel_conf=
ig' has no member named 'auto_start'
   27 |   .auto_start =3D false,
      |    ^~~~~~~~~~
drivers/net/wireless/ath/ath11k/mhi.c:42:4: error: 'struct mhi_channel_conf=
ig' has no member named 'auto_start'
   42 |   .auto_start =3D false,
      |    ^~~~~~~~~~
drivers/net/wireless/ath/ath11k/mhi.c:57:4: error: 'struct mhi_channel_conf=
ig' has no member named 'auto_start'
   57 |   .auto_start =3D true,
      |    ^~~~~~~~~~
drivers/net/wireless/ath/ath11k/mhi.c:72:4: error: 'struct mhi_channel_conf=
ig' has no member named 'auto_start'
   72 |   .auto_start =3D true,
      |    ^~~~~~~~~~

Caused by commit

  0cc1f3a385b2 ("bus: mhi: Remove auto-start option")

I have used the mhi tree from next-20201116 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Kr5GD.ghTM1kevu1_5kZ4Uf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+zTakACgkQAVBC80lX
0GxQQQf/Yb5EKThmd2nKKxg+N7AKOXWnFRAPs/A2JyM6D0IAUcXZdtrTVe+6NNbW
umbHy/dPOu3ZpPM4xmuPHL2n1hKi6bNbiywEk6hHWDZP7Mq3+MxVyvPYuZiWh0O9
q09u/BiHXzgHy7DC+DoWLi+rhRL5DUpUCFmfieYNuUhZNsMm6lvu9Ke01wfsBvIX
FLRJxm3aCUZIN9KL9BKcRk/rWlOfSN/HTH3alo25cjHNr0D9hazbiog92n/Ghkpw
y7pleMHPjh0rEEX1OmN98AaA2YsSQoZb15sA5NBNIEBt1OtIuMSx0fwoF3eMOkT0
LfgOf+emAaxFvYSim/TPGRfhnnXUaQ==
=yiRm
-----END PGP SIGNATURE-----

--Sig_/Kr5GD.ghTM1kevu1_5kZ4Uf--
