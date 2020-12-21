Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4595C433E0
	for <linux-next@archiver.kernel.org>; Mon, 21 Dec 2020 05:16:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B98E522CAF
	for <linux-next@archiver.kernel.org>; Mon, 21 Dec 2020 05:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgLUFQy (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 21 Dec 2020 00:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbgLUFQy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Dec 2020 00:16:54 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94280C0613D3;
        Sun, 20 Dec 2020 21:16:13 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CznkL1D17z9sVj;
        Mon, 21 Dec 2020 16:16:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608527770;
        bh=3WYqAmonIO5BuVKKwyGhTsf+OZlydrWxJ2Vjt4cdtwE=;
        h=Date:From:To:Cc:Subject:From;
        b=oJvpD+yJWXlJlaej7KEKKQzOe/u2vI6rmJHpYp2N7Dc/OWcKOsN0gou0NLWTWLhvX
         7YpIdVfIDlbwphnM0gM3pj9PtzkHydq+HL8IguoAsD4Sf7JfztpiMOPcO0FCba5kFU
         5CnXWL+/pWxdgHq8jIfesJ2vKU617tfSZ5Uyv78WFShpvhavWTTDRZBhllG/SnRoyO
         1P70zXTKPp3cFWK8Jqxzx/AES9YQQGP83TlBg1lkAe7RUHqzJeq/gYRvBxC4wOofAw
         4UWrYXhtnD8nh96R5hxs+ttuo5Ke1Fg5x5Z+rvvJUHuwGObpkz0IZ5h59E99Kc+UWI
         0rmNeZFtAhNhQ==
Date:   Mon, 21 Dec 2020 16:16:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        "kernelci.org bot" <bot@kernelci.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20201221161608.417ea4b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P6HCIq4y4T7NZSZP5b99B_G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P6HCIq4y4T7NZSZP5b99B_G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (arm64 allmodconfig)
failed like this:

./include/uapi/asm-generic/unistd.h:867:27: error: array index in initializ=
er exceeds array bounds

Caused by commit

  390e5073c473 ("arch, mm: wire up memfd_secret system call where relevant")
  d098835811e0 ("arch-mm-wire-up-memfd_secret-system-call-were-relevant-fix=
")

Reported-by: kernelci.org bot <bot@kernelci.org>

I will apply the following patch tomorrow:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 21 Dec 2020 16:10:40 +1100
Subject: [PATCH]  arch-mm-wire-up-memfd_secret-system-call-were-relevant-fi=
x-fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/uapi/asm-generic/unistd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/u=
nistd.h
index 72b94deb8cf1..26125974a8a2 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -869,7 +869,7 @@ __SYSCALL(__NR_memfd_secret, sys_memfd_secret)
 #endif
=20
 #undef __NR_syscalls
-#define __NR_syscalls 443
+#define __NR_syscalls 444
=20
 /*
  * 32 bit systems traditionally used different
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/P6HCIq4y4T7NZSZP5b99B_G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/gL5gACgkQAVBC80lX
0GwRfAf+MTITunKAhXM2kkMb0O5F9TCJ9519Lw3QeWyJs8J+b/bO6A+yrEXQzR55
JHAidylzFv7xK54HORGEHnqx3NekzUyDSqxrVgo2vU2FRAzi0Rd7xacUPdOUYQBN
tL3RyUBV1RvIFZb7lh3vOq2p40VPNjG9dR47VvEc+pY5FK0Mi3T32XKGDWKfKad6
pvFJkjK+mr5n9cqIwwgCVh4JYC0cNbF/5POZJTRy1esgsEuJGNGFfC3TCeXG63ER
ciYTsc0nN7+pmRkMemLGUAtkaIGMU6zzVJfvqfarU2VVE9plqWbsPtsY/ZEp6rk7
e5fv/MHj4TVwXdF1F2JcHpAGT0rCTA==
=Tau2
-----END PGP SIGNATURE-----

--Sig_/P6HCIq4y4T7NZSZP5b99B_G--
