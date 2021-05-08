Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF15CC433B4
	for <linux-next@archiver.kernel.org>; Sat,  8 May 2021 02:18:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE02361414
	for <linux-next@archiver.kernel.org>; Sat,  8 May 2021 02:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhEHCTX (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 7 May 2021 22:19:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35487 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229775AbhEHCTX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 May 2021 22:19:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FcWFR5yrZz9sWp;
        Sat,  8 May 2021 12:18:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620440301;
        bh=CjQrIxbrXwpVfS670ULLfHpPrpiyyUux2prmmYQUz5w=;
        h=Date:From:To:Cc:Subject:From;
        b=Yp3R1ivEFNUxCzmZ24Ovlhfu3f4W3hIFUzpokwBQyi4KJ1tAcrEiPb+6jSPFFUwri
         Rkn/s1vAIilsKhktcMYd3CDexkd5liNyVWyt7o7UjrvRZZuP3TiYB2ydxB6UvTloL7
         S+EJ6OVOBUXtyDghnZM3hCCQFhqKE4v+ulaG1Rd9h8H5shRv4Ei6Cxe3dU02c1WXlX
         jYnLIhW8oRMh9gBLl1jKsHjBNfzCvLKc7DjaGPq3/Xlrk/g5WR2TfC7Epby3IdnJhy
         +mg3jhKAO/5qIt4rcOemiTq3hRG0oIKrGFxSWiOiEvimRUY1iHUoeD/H1HvHywjiAN
         GGUVO2tgEAW0w==
Date:   Sat, 8 May 2021 12:18:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Barry Song <song.bao.hua@hisilicon.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20210508121819.1a451d54@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3/V94oZHgtawu4MYEV8Mf4h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3/V94oZHgtawu4MYEV8Mf4h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  19987fdad506 ("sched,doc: sched_debug_verbose cmdline should be sched_ver=
bose")

Fixes tag

  Fixes: 9406415f46 ("sched/debug: Rename the sched_debug parameter to sche=
d_verbose")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/3/V94oZHgtawu4MYEV8Mf4h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCV9OsACgkQAVBC80lX
0GybDgf+PL1L2GFUsT3JT8Zt8lzTpYhu7sUS1swf5YsSSP6kOKHjP4ddQJgV4Rv+
M+7ubhjAN/ogjfcmxsGRkmyJMJJu5B6OjU5RnRAyVdqdiSEnc1tm9t2pZe7DFJdo
3foJ5kRUd4b3qeu/ZEawPPKQs85E5BvKeu0JmEtZTGtJuqwdwhDff4cm9nW9Eo+q
kZRWu4nmLZwKfYwFL7fVSFfDNxz+NR7swexEcAAd2dADjo2rUOhNFS5jXk4SlgCT
J7Kv84Nw2co5frWT8kqzDLat3+kiNtVU44D4ViAlfPGoE2LPg1el5ZZl/r5x9axJ
fjW23MymAdfFeasdp8aJp8pstqr04g==
=QrX8
-----END PGP SIGNATURE-----

--Sig_/3/V94oZHgtawu4MYEV8Mf4h--
