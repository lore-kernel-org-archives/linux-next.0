Return-Path: <SRS0=XJrD=DP=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188BFC4363C
	for <linux-next@archiver.kernel.org>; Thu,  8 Oct 2020 04:28:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48ECA20789
	for <linux-next@archiver.kernel.org>; Thu,  8 Oct 2020 04:28:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FOwuKhlP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgJHE2k (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 8 Oct 2020 00:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgJHE2k (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 00:28:40 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBED6C061755;
        Wed,  7 Oct 2020 21:28:39 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6J9Y5gQ1z9sSn;
        Thu,  8 Oct 2020 15:28:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602131316;
        bh=wn57Flg+Wo/BvNZqX3WPr9gyEJEnw4lViz2zKYq7DT8=;
        h=Date:From:To:Cc:Subject:From;
        b=FOwuKhlPzTPCDeGi2+GvaDdBoCRJn3dX6Uaj0UG0dZvlvjvotRvwMmcqEv3fmrh/f
         Dg7mduXYz01Qku4OBt5l/Tz5sq2BAoEackiV+BRRRo+VNW1I5HDYFQQw8SX939KR9P
         nndKx4q/WsEl24CZDLLqhBmqg0tj4lAuwq5kwfb1sJXmD71xxR2JwZD+MKbleuVxY6
         ujqvr9cDT1xgum6MM7gc2WooF31p/qkG6L0LjJYYFdMSZEbCMJIYUqq+510p7Ht08w
         8aYeVwG1mCQ4gn9gI/xWHwbkiEw5pLmFpJV6MDQ2z5M6WzMF+3SK8KZXQxnvgJ8IW8
         X7iBBsH2crisA==
Date:   Thu, 8 Oct 2020 15:28:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20201008152832.32e390da@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w6t9gwt9MR1m_e.D.lhnwg0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/w6t9gwt9MR1m_e.D.lhnwg0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: modpost: EXPORT symbol "copy_mc_fragile" [vmlinux] version generat=
ion failed, symbol will not be versioned.

Probably introduced by commit

  ec6347bb4339 ("x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, =
kernel}()")

--=20
Cheers,
Stephen Rothwell

--Sig_/w6t9gwt9MR1m_e.D.lhnwg0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9+lXEACgkQAVBC80lX
0GzzJgf/d0cUV7/RtRy7TqAUzqq+4kLtOa9fZxJTRATDnI/jziP2yEteyRFOyv1m
zChk70/WWNCYsNfqXOV0s8OQm8uooYY8x/bdE1/HHmr7NaM7YgNR+uhD2meSFRnc
lr7pkWAzXC3arwEXDn6/fg5v0TpUVxadC8YDfvL3/8UhyiA1wahB5NF9+gJkRkN6
zhx7p/kXWrqLId0gaEz8Fo1GN7Sf6PFq21hiI7NYIWLsjPzfAjHWfptEzUqqf8eS
7m8K6odsY/rQfBffyYS7pwwg6b6FPIp4YGHvztMmtA7t7P1HKAY6kDk+2KmRHwzF
0hdF8OWHd/RbAneCK/EutfMfm3Nz9A==
=xNpf
-----END PGP SIGNATURE-----

--Sig_/w6t9gwt9MR1m_e.D.lhnwg0--
