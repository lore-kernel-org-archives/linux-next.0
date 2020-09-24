Return-Path: <SRS0=pyx6=DB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4247AC4346E
	for <linux-next@archiver.kernel.org>; Thu, 24 Sep 2020 08:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43D35206FC
	for <linux-next@archiver.kernel.org>; Thu, 24 Sep 2020 08:30:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GCTyVhVl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgIXIao (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:30:44 -0400
Received: from ozlabs.org ([203.11.71.1]:42011 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727046AbgIXIao (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Sep 2020 04:30:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BxpCQ3ssRz9sTN;
        Thu, 24 Sep 2020 18:30:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600936242;
        bh=LRmGIax4dalz/UGz8d4SkRxKBlzjQ3EaT2pKFE6JCVY=;
        h=Date:From:To:Cc:Subject:From;
        b=GCTyVhVlw4pcxLjg9XAd2nKYguMZt56PFeqCUaULY2JYt3blylX5BJO12ufzkb80g
         obU6sUptThY8I27ouvXGQwcKT3YYlV7pxVJwCejsEiuzHgIQ5G+mLtZpa3FAcPbZkK
         es0InT7D2f10atKzgdZ83PxNkLrRZwcWwpPtep0KTu7nO/Cjy1h2O+RnP1sOpgud4s
         stNkvifJPcwt9M93GOca/00sJFtU74wZj1bVJyS0xV1GHe/lvzeCJPDSihVcNvFS9u
         d5DDpCohiLocLek5ZHKSIHjwdn6n3dHoUO6JKx00ZOPnr0AnjlxSU6F/qwzM+YSVa7
         QnlhlvPjZXN+w==
Date:   Thu, 24 Sep 2020 18:30:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@suse.de>
Subject: linux-next: build failure after merge of the vfs tree
Message-ID: <20200924183038.3c6da86e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GDv44smj=nUa+/WgA8CwQxw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GDv44smj=nUa+/WgA8CwQxw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (x86_64 allnoconfig)
failed like this:

arch/x86/include/asm/barrier.h: Assembler messages:
arch/x86/include/asm/barrier.h:41: Error: operand type mismatch for `cmp'
arch/x86/include/asm/barrier.h:41: Error: operand type mismatch for `cmp'

and many more ...

Caused by commit

  e33ea6e5ba6a ("x86/uaccess: Use pointer masking to limit uaccess speculat=
ion")

I am not exactly sure why (but reverting it fixes the build).

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/GDv44smj=nUa+/WgA8CwQxw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9sWS4ACgkQAVBC80lX
0GxmRAf/TYX4R2adWmPplzadr5+Wa9dR2gae6g1XAtlZp+TQ16InkZGD4IaDa5B1
2TaS1r0vS3OE5AXtLrHGw1K257FnXERr1C7z6tcsINxQ5cHbpIdigZX6QW2+aqH5
nB70hkniMpFJqVfQoNcXJIouARAdo2qfddgm36dkOTSFT2InAIsqxvCLp5j2qpFU
9NHe5Z0N3sbahLqtVzsRKNBu8mDUqzcgpsctFSoooT/h8rcsUgY+1h3SMboH8U1N
yTh4gq8/IfvY4UxXpvIEjOoJTVzn0sJrYyv/g+YYcuSqAiubN5FriW5NnQu6V9EL
iki/l8ViyTn54vSKysuNN4KQaW8ENg==
=yBbZ
-----END PGP SIGNATURE-----

--Sig_/GDv44smj=nUa+/WgA8CwQxw--
