Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3B1C4338F
	for <linux-next@archiver.kernel.org>; Thu, 19 Aug 2021 12:00:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 641306112E
	for <linux-next@archiver.kernel.org>; Thu, 19 Aug 2021 12:00:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238360AbhHSMBE (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 19 Aug 2021 08:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238105AbhHSMBE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Aug 2021 08:01:04 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21568C061575;
        Thu, 19 Aug 2021 05:00:28 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gr3HY0bgLz9sRf;
        Thu, 19 Aug 2021 22:00:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629374425;
        bh=OCa7BZNi6CQjW4gp5BQB4RigU91hPy2R/nxrD1Q5B80=;
        h=Date:From:To:Cc:Subject:From;
        b=oRER3yC1YccBii1pfFSBVejAvQvJQ7yXHCJhDfwSXBgSyzCxw1F3HVOXJW+PUbD1q
         fRePimst+KQSF4a1EESB5P+dJGW5ngMV785IMApDvJThu1R7JQ8jvra6404TDnVlgz
         dKG5sZqeGXrewPUQviO6enQ/DAOuwUIqDm6OY7pwm7jQvMsqcGQgsK52tDnvupTA1/
         XSBkgdgZl+esfyD7nfNGyEunQE4lamiRrGiaIEKcfMiMSxmJrpE94A1lzdc/27IDGW
         J18Pn6tOTeiRxRfSPstFtA/GCrlnT6UZRmFhvqGkQRlt8BqhJ3c0Vj1cUptzhMn2P4
         lK371Vr7D3/Cw==
Date:   Thu, 19 Aug 2021 22:00:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the aspeed tree
Message-ID: <20210819220023.7b828d3a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mC5i/OxZBhZcgnQxD7yh=Ma";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mC5i/OxZBhZcgnQxD7yh=Ma
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2f9b25fa6682 ("soc: aspeed: Re-enable FWH2AHB on AST2600")

Fixes tag

  Fixes: deb50313ba83 ("soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600=
")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 5042d3f278de ("soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600")

--=20
Cheers,
Stephen Rothwell

--Sig_/mC5i/OxZBhZcgnQxD7yh=Ma
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEeR9cACgkQAVBC80lX
0GwcsQf/UFPrw2l/8w3NTxfyQKmsRltW8znvUr1TO96fxGGiqFP6CfUbIpqWI885
797g9xG75oZZ0vRhKRj83CJQssq7BPmKPXByKnXHp3int3hLNu9OJ7Wtc6vX8JI6
SxmC/Jq5/uAePKo//38xDu34Xh8slrGZK69kLI4SH+nVxLV38OXz/T6y/nyGphkd
+9jW2vFx0DATrORKbu7PK+aQrOH3UD2EaEuR5k8aju0rdO9W+bC/j3y0rvZv5MuO
+Xbz2G9aaPGsRmHcWxEOBkEXyaiMaKZx4/cHdAIITKWKWfdi/Ul1ztgQeHliPONL
AQdYjwVPC9KDhRjvYfvSmPIU92PW5g==
=8Dn5
-----END PGP SIGNATURE-----

--Sig_/mC5i/OxZBhZcgnQxD7yh=Ma--
