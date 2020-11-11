Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B90C388F9
	for <linux-next@archiver.kernel.org>; Wed, 11 Nov 2020 06:20:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4266C2078E
	for <linux-next@archiver.kernel.org>; Wed, 11 Nov 2020 06:20:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="t1n+6sQw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgKKGUs (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 11 Nov 2020 01:20:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgKKGUr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2020 01:20:47 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98D8C0613D1;
        Tue, 10 Nov 2020 22:20:46 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CWF3J6MmGz9s0b;
        Wed, 11 Nov 2020 17:20:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605075645;
        bh=G/sLN+bge1UMOknjkYmz1l1u5lIQPHl0lMUV/OwH5VQ=;
        h=Date:From:To:Cc:Subject:From;
        b=t1n+6sQwBW1apddTnUl8URKCFeRkA7kEFK9KF6tgsDDKDWmmiuFx77okxCwJ1BIj9
         JzJoDJ4jngIu+DNMK6gmjK3Pv1/mezEDtF5VtfFOPOxMD1aHEKau68hbyfvcAYN/Vg
         V4CpWFdd93qpeYe99BS6McaJXPvJcqfgbZVqAd7dGdheZXkdLNGioll9I9CKRgUDpY
         ZhL+KJ/OIIsUJJLp/UEyy3J9+Wha3qyzwcb35waK7XzDtBSmYDLxogOqOebbLyDKJN
         C/e9+yHO3TkkZlVKp9h2x59yr+CSm/ZjFF2tvgH/vQsxwLR+QG47gq2mePy8GKUZsr
         h0VRIKmguhpFQ==
Date:   Wed, 11 Nov 2020 17:20:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20201111172043.6e56cc71@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DIQ9vsIWFgMC6mDnU+Wc54r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DIQ9vsIWFgMC6mDnU+Wc54r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

mm/kasan/shadow.c: In function 'kasan_poison_memory':
mm/kasan/shadow.c:88:6: error: implicit declaration of function 'is_kfence_=
address' [-Werror=3Dimplicit-function-declaration]
   88 |  if (is_kfence_address(address))
      |      ^~~~~~~~~~~~~~~~~

Caused by commit

  97f3d663343a ("kasan-split-out-shadowc-from-commonc-fix")

I have applied this fix patch for today:

=46rom e96c5bb419a2042483dcc914750e4e903d73e70e Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 11 Nov 2020 17:16:35 +1100
Subject: [PATCH] kasan-split-out-shadowc-from-commonc-fix2

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/kasan/shadow.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 1f8d713fa8a3..f45442ef42b1 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -14,6 +14,7 @@
 #include <linux/kasan.h>
 #include <linux/kernel.h>
 #include <linux/kmemleak.h>
+#include <linux/kfence.h>
 #include <linux/memory.h>
 #include <linux/mm.h>
 #include <linux/string.h>
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/DIQ9vsIWFgMC6mDnU+Wc54r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+rgrsACgkQAVBC80lX
0GyyBAf9Fp/5QOysmNJ5SE6qgAOdV/lZuaPTVM/mKsm/G93WQ/pe1BSKVTd4ooXJ
LMDGKPbeDkHzBgsxn/vkDP67Jtxz5TJMMKJUVg30L0hPr3P3xmSun4E6jdU8Upzk
bJaktyDGAYqv+Glxt5twynTRD2pTZeyIfBmyLTbBNGIwGbqTcAT6PcO6lMuoOIXe
6ckqObvO5z3p027mGTlmxKxf2k1O0eWVg9dC7LgasjxgAgHxI7fEQbQrpS8bMTI1
YjGmf4AdRNKX61JREMK0UvnQxl/lhbiafpiWM2JpQBKLf48NACj6e3UkmvtQDi4R
1TwWlVWdwhAus/O/wVQdyBjI4ACaHQ==
=b3bX
-----END PGP SIGNATURE-----

--Sig_/DIQ9vsIWFgMC6mDnU+Wc54r--
