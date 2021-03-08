Return-Path: <SRS0=KbLx=IG=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,LOCALPART_IN_SUBJECT,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F82C433E0
	for <linux-next@archiver.kernel.org>; Mon,  8 Mar 2021 00:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C543564F29
	for <linux-next@archiver.kernel.org>; Mon,  8 Mar 2021 00:56:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233433AbhCHAz4 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 7 Mar 2021 19:55:56 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44125 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233428AbhCHAzr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 7 Mar 2021 19:55:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dv0J65DCXz9sW5;
        Mon,  8 Mar 2021 11:55:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615164934;
        bh=lAoNnVquxY6nwJgpM2YVKYalHJCt0RLvsEZRklITuIs=;
        h=Date:From:To:Cc:Subject:From;
        b=hUsoJDC+8VPjIjGgkvHEb0wh5yprVH34S3o5ezgI0WrPc2YA3FOQ/McDupica3rf8
         qk4m8nUQhDurLCkQbZkSWhEscZ67Bwzh+2UsiZGfe28x1D+XzKYDRaEDT+dgHZQ7Up
         xXvqcLU8yQ9GpVgbk4nUAf6AFnjsdsilPSEbHD9ZfwQw3A6ZQphvuGr4BNl8HO0qTr
         Mexk3ZYTyMgVtJLE8UrEeTmlT2ThXP2HkTje5sIyfljKiK7LjosvoCRTm33SD/IbJp
         4932dgskUX1P8Vw/JoJ4Ofhs0kYdFGFC0+fDLfMJfLRSTbSvyjS4cE9YPK5yJdYkpk
         qZLsjbgSReUYA==
Date:   Mon, 8 Mar 2021 11:55:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release today
Message-ID: <20210308115532.4f2a85a6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+XweyJFt4Vk_F+YNOhnJGyO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+XweyJFt4Vk_F+YNOhnJGyO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next release today.  Normal service should resume
tomorrow (Tuesday).

--=20
Cheers,
Stephen Rothwell

--Sig_/+XweyJFt4Vk_F+YNOhnJGyO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBFdgQACgkQAVBC80lX
0GxMtQgAof1kk5q2ZoG6mGAy41Cq6DQpopOmotJtOUGLjgzHKwkMCw7ym0ZhZrTT
GCmUP5eU0FKS9vichPhUKRgxN4MHwxc7kWyqUccoWLFo3i5Yt20ClYREOa6zxQq7
zfXR7lvtpttCYQZKcRcGbmtLowypy5gHS7YS0JysKSS5GHE4ye70kQbtNnVbZbLr
aY3VMCiJMLc/83qEueKMSlO0Nj4Gr5uEoUg29sP5/kvyftPf/FEYLXkC5PqYuzWV
NYOk7DsdWlyFmuzOmv1n6eympX4510CxWHgNke8jBSxk3hd3NI7AKh0mKJa84Eu9
ljH0oH/aTh09b+2HW7S+z2rFARgvIQ==
=7w1F
-----END PGP SIGNATURE-----

--Sig_/+XweyJFt4Vk_F+YNOhnJGyO--
