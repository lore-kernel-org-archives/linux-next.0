Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF89AC2BB3F
	for <linux-next@archiver.kernel.org>; Fri,  4 Dec 2020 05:46:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99876225AC
	for <linux-next@archiver.kernel.org>; Fri,  4 Dec 2020 05:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgLDFpq (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 4 Dec 2020 00:45:46 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:49671 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728248AbgLDFpp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Dec 2020 00:45:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CnM9B2LnJz9sWv;
        Fri,  4 Dec 2020 16:44:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607060687;
        bh=6O/asPoKiqDNxjd0zwwcYijb3K5XsJ9IawiTZiwNU2U=;
        h=Date:From:To:Cc:Subject:From;
        b=PhkPWBsbgg0Flaj8u6ReLzlhMMobKngSmcT6haQ5iG2QVdltM1ZmljF/QZg2KSPH3
         oXSgoigSL2gCKqQwOodJcLfLQIq7gWxhB0IzOToIgvF+MfaSHQ+jjGOd1/JD8iWxZU
         2nrSEfoCtDlwoFUEn/lUwRV0E+rMNi9zWK8jIr6tFtprAgTTVH/o5/1Pk+2A6Ahq6h
         aQ/tHFYw2IFsa1Fq+RbO2iuPW8EXaFS/4AL1SzSlHWUFaNr5JWDN9aHn/rgHTxojvC
         o1TkK89gOom+GwdJBoQK8Jk6idDFbOsqTjPmwpOP0qiqfHg16NZ4ASKSHA+OXa/o4v
         8oGN0fn2cKJbw==
Date:   Fri, 4 Dec 2020 16:44:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     David Brazdil <dbrazdil@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20201204164445.6f0cdfc3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NEPiHCkghc9kHV=9ellWg6g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NEPiHCkghc9kHV=9ellWg6g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/kernel/head.S

between commits:

  2ffac9e3fdbd ("arm64: head.S: cleanup SCTLR_ELx initialization")
  d87a8e65b510 ("arm64: head.S: always initialize PSTATE")

from the arm64 tree and commit:

  9c322020286c ("arm64: Extract parts of el2_setup into a macro")

from the kvm-arm tree.

I have no idea how to fix this up, so I just used the kvm-arm tree from
next-20201203 instead for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/NEPiHCkghc9kHV=9ellWg6g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/JzM0ACgkQAVBC80lX
0GzdHwgAjL1umJosOC1kVXIx7L2np89kYKRCBF3z4EQZTvRWxCCmtFRsAPIlJSVc
0u99TMWq6fNFgqJJFMNRyOhVVRJ+MYYJuzeklgRiW7eYVO3xdQEjc00zXI8iExRS
/awqlRZtUaJKdsIVQSYKny2rF02Afkg0pJbK844Hu6zeIdKpEGu5q6DW1cIn/UrQ
cUZm5Vn6WWoG1tmIHMW1bpGfbVWaO2xLks3KdLUREpLjtPPQrRtJrYz3OK7BSHbh
i/is9iKvrwzHV/5gmlFvfx4ziyllsfnrCPUNVs0QNrAxnMz4yGp4V4QPttjBpaWD
rqnkkTu40CnZxlV2bODNxIDFlwoW5g==
=SjF6
-----END PGP SIGNATURE-----

--Sig_/NEPiHCkghc9kHV=9ellWg6g--
