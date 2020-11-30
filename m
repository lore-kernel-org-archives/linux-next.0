Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E377C63777
	for <linux-next@archiver.kernel.org>; Mon, 30 Nov 2020 21:21:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCC982073C
	for <linux-next@archiver.kernel.org>; Mon, 30 Nov 2020 21:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="llwJc+HW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388429AbgK3VVv (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 30 Nov 2020 16:21:51 -0500
Received: from ozlabs.org ([203.11.71.1]:47319 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387531AbgK3VVv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 16:21:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ClJ7S61Kcz9sRK;
        Tue,  1 Dec 2020 08:21:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606771269;
        bh=XqKodccR1tpLcMTJknZG9lniVguv5DgB4nrJ7vdb9xk=;
        h=Date:From:To:Cc:Subject:From;
        b=llwJc+HWIORt7xKBPQ05uwAY27tiMs/48B/PnVLJhhrj+kBF80QlxENeqxvPjotWG
         l4/pDU1uYN4EJLvLLNsdI31uPU4n2uQKFCQLOKljMM5dEkTQ+1AmEGACUEdJ4FfXij
         Nx7KDQ4IA/hw3mCY/qB/Buobbnuh5sTlzC6W+jUpLFeM7s7qnwTHgvhqKEg7FJ6+Vf
         UYhxgPIgf6mMnm/UGZ5V87ycNNhAJBQhLOxnuvARADKZapFojGHQdSqUfMYm1jK0ox
         8K9ZFFMrAtkOxToEAzFbMSoiNcAeYh/gO/uwp9pvtf4B5Ke7KQSBJUJI9D280aBIlC
         uKaWYPuXI+gNw==
Date:   Tue, 1 Dec 2020 08:21:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rockchip tree
Message-ID: <20201201082107.5f3658be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o212C6x+MjcDTBbAt+B7XF=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/o212C6x+MjcDTBbAt+B7XF=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f166ed782080 ("arm64: defconfig: Enable RTC_DRV_HYM8563")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/o212C6x+MjcDTBbAt+B7XF=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/FYkMACgkQAVBC80lX
0GwuCQf7Bxb2sDSn0W6JAGrvVlvg01fH2J4hBNqyAXxTUYssd4kHFtxLHqapSdv9
XdnRm5RnCMxJylFwyRYPNUYX1eX8bNI/LU9s25VrPRNQd9kMhClY5ij10un7x4RH
ssqxg/Tt0zpx7TCSZqQ5AJJdLu3nIc0G6rxyrcdb7sq3AdNDNobS3jIuJtMnCIf/
hsPf644FXMqDCFPH9bxwuyDKj4WEz2Px+3GfuwEBnuRMfapFg2IS2V7Du2PF/Wzg
0JhZzYvqJm3866LQLRTDLF3336xKAeFkRTnFRBrlk866EDzCYGHqj4JwoZuAop5N
hpCmzaOitanUcYsOl4Ws/LZiVx9Eeg==
=eeuD
-----END PGP SIGNATURE-----

--Sig_/o212C6x+MjcDTBbAt+B7XF=--
