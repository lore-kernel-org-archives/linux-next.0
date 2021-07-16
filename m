Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17816C636C8
	for <linux-next@archiver.kernel.org>; Fri, 16 Jul 2021 03:30:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC170613E6
	for <linux-next@archiver.kernel.org>; Fri, 16 Jul 2021 03:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbhGPDc7 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 15 Jul 2021 23:32:59 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47949 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231230AbhGPDc6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jul 2021 23:32:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GQxZK5b1Qz9sWc;
        Fri, 16 Jul 2021 13:30:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626406202;
        bh=PYbqnxbNuWiTD13swbLkCAMMOY+K9iEPoVYjYdy/zpI=;
        h=Date:From:To:Cc:Subject:From;
        b=nVwK5AnnzvhAEMSTxyJiZqKd5koiWg7t5/Y5zvtvV5lagCTIjH/oW0Bp7AYQosJco
         86gXgUX7uEhgGxgG+UGDwGQok1xKqFSSv5CcgBC8KO0Snvaxd/AIXbiH1ahMhcZn3w
         82aTEOqYrdqTNAl+DSoM+pa5+6Dbxo61yEIC6ZJkbrQtxXO+ns6O5axvo4Lve597xF
         O+169CLnr/+eGIWLkXcNhZLeY8gM2jY2tgtHoNUCgjnn9q+iJmGbr99J4bRbp3+i3Z
         mowg6/f8gTob+9pF0AL83x03zLT/2QKeDWPJkra8KJunlPw09DX5wV1ihQbXJArbc7
         OQ9546h2+qOdQ==
Date:   Fri, 16 Jul 2021 13:29:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Lars Poeschel <poeschel@lemonage.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the auxdisplay tree
Message-ID: <20210716132958.51240693@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gmru+J3Ir=KTAO/QuILnPcj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gmru+J3Ir=KTAO/QuILnPcj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cff03367b6f8 ("auxdisplay: hd44780: Fix oops on module unloading")

Fixes tag

  Fixes: 718e05ed92e ("auxdisplay: Introduce hd44780_common.[ch]")

has these problem(s):

  - SHA1 should be at least 12 digits long

Probably not worth rebasing to fix, but can ve avoided in the future
by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/gmru+J3Ir=KTAO/QuILnPcj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDw/TYACgkQAVBC80lX
0GxpLQgAnb8l63V1M9AmBs3vfREWTxnw/HmwYLLKmeDBvgN3Ipt75jmb7eXVCvhY
h8lwItqLG7zBw0SsauW5k11jwvvxfyLxLMo4++XjnDjzXMiPy76/1rDE+qisxm2C
OfXas4k/7KBgxTlbbBSjgjB340Df81g3FiiIhhfZHY9f5ZQR3ikPs2D+dwO3rQV9
UqaUfSnwgGtmtbDo68M5S/SNx/VwCeI4mxCAI9hYt2IhrhPGYBLsAVKweedTfiZV
Pnu5rnv44Q4t9JyirjbCArYKnqUnlVNxANS6e+woiY3Il0Sq86kOJEW+NLHDjoJk
f64IeqUQoOpho5NmWvkL9VP2pFUyvg==
=XvzA
-----END PGP SIGNATURE-----

--Sig_/gmru+J3Ir=KTAO/QuILnPcj--
