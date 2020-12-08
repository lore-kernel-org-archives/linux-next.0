Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA50C4361B
	for <linux-next@archiver.kernel.org>; Tue,  8 Dec 2020 11:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D649A23A3C
	for <linux-next@archiver.kernel.org>; Tue,  8 Dec 2020 11:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgLHLkL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 8 Dec 2020 06:40:11 -0500
Received: from ozlabs.org ([203.11.71.1]:34673 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727839AbgLHLkL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Dec 2020 06:40:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cqyrc2Y8kz9sWR;
        Tue,  8 Dec 2020 22:39:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607427568;
        bh=iwmK9bHuxz5cOxlpg1CFMwvGpAin/JFOj0dBjaqX478=;
        h=Date:From:To:Cc:Subject:From;
        b=rhvP1HWpUXVquoO2E54sJ5Dwgem7qpfnVuCevdR9gUDQ/0RY3upGzkNGjkpTAP845
         4rscjCZwKdgXauhWOStB0tYXE73SMdKw4kPCkRcB2MFCHPTZ3r0KyUqot/ZEA3BsyJ
         X2jO9k07U5/pcoZgYLYvyUo2nsKuTNrbLHMa0vHaXUXyhfS5u/re/BR1CHAq+rhVKF
         xiBQDU3Cm5M94D0yxWKAP0N/KYOUwFg+UCevjv4L+DwN8qPGXLvh1IHZd5mxmusyOd
         W+e75p/nEf5lmKzdYz9dx4i8KjjpGezo9nryZHTaUehXa84zA57NAqssd2usq/ONsP
         2GSOVOzVbPcfw==
Date:   Tue, 8 Dec 2020 22:39:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the arm tree
Message-ID: <20201208223919.18a80092@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g1ARew/zmjZfcqbR+owvSOC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/g1ARew/zmjZfcqbR+owvSOC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4812d516af55 ("ARM: 9027/1: head.S: explicitly map DT even if it lives in=
 the first physical section")

Fixes tag

  Fixes: 149a3ffe62b9dbc3 ("9012/1: move device tree mapping out of linear =
region")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 7a1be318f579 ("ARM: 9012/1: move device tree mapping out of linear r=
egion")

--=20
Cheers,
Stephen Rothwell

--Sig_/g1ARew/zmjZfcqbR+owvSOC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/PZecACgkQAVBC80lX
0GySWwf9FXh32KYLrb0Ba+zOmQVUSBaDBYd4uEpUlc7e3LfJBoIwZzdz2SwpA3jo
nyhUxU005aFD0H/QTji8A78yEru3cSMqjccQo7Toh1ZBAqqCy2sIyd78FoZ22jb3
/CZV3wVjVvV8PMxxc+2PAObXcq6b0XoG0mjn+n0eZeE+y+pt7w6kU4V1gyNAX8kq
NkmKNXlPHzsbo4rh0AFV15T70DO95uZkJv0VvS5wx3AMHRgDe2yJ/EoJSEaA7Ayp
4s3l/jyCZJxQgKt6VGZgG9llv3cvVQawonzB85nMg/heUeX5G3AYqcPSaClMXErl
i3GzAqGadGIuz78ifw2S2kEYulDPXA==
=Sk42
-----END PGP SIGNATURE-----

--Sig_/g1ARew/zmjZfcqbR+owvSOC--
