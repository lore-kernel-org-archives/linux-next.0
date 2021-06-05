Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE9CC4743C
	for <linux-next@archiver.kernel.org>; Sat,  5 Jun 2021 02:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3322A610A0
	for <linux-next@archiver.kernel.org>; Sat,  5 Jun 2021 02:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhFEC21 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 4 Jun 2021 22:28:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49999 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230169AbhFEC21 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Jun 2021 22:28:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fxk5x5gCbz9sT6;
        Sat,  5 Jun 2021 12:26:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622859990;
        bh=QivWC1dcQeNJcbmVkKf7LuWjCr/ixyTQQ7gbnm07TKc=;
        h=Date:From:To:Cc:Subject:From;
        b=RUysbMEWEIpw/Ju9CYlHAISJ3Tlh24JUufh5B/ZM294Iq64sORvoeQXBgVXIFGGZo
         xSAky2DVXgTLPFWKfs3s2llhd0fGaN8ykXvUZKEFwG5POExpDLLnZzGprdu0VVewRD
         F2RfFsIUTQFIUhGXuspDgUEVs5Re9mUqr6N59ghHApbAp06i+3J+4dT0cYmSM+J5x1
         3L49zagtAeccWOjYWLNVhfoCI0divNCITvWBE6mTHGGXbVeA9A5urozbcH9qaVXZlu
         NMh7iI10RkSWonahaX6w/sOKMdZ/Qf1no242puYHjIookFD7o7RVj7Yc4SI5DyX4dA
         Y8U3ev8pLPwbw==
Date:   Sat, 5 Jun 2021 12:26:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Eric Huang <jinhuieric.huang@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210605122627.0650db4b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q4H.HZ4OiJUasYIPdFcxplb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q4H.HZ4OiJUasYIPdFcxplb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, yesterday's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1838: warning: Function parameter or=
 member 'table_freed' not described in 'amdgpu_vm_bo_update'

Introduced by commit

  891069653f51 ("drm/amdgpu: Add table_freed parameter to amdgpu_vm_bo_upda=
te")

--=20
Cheers,
Stephen Rothwell

--Sig_/Q4H.HZ4OiJUasYIPdFcxplb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC64NMACgkQAVBC80lX
0GxDMggAiz9eGb8/JjJjsmCnu/day+iBcJV9G51RIUnUIj9MGk7efyYqy2XbNzWK
BTlEGFM5bj/nxpzEZX1WA3Ao48q7vrzz8ZPkq+HZFZ4rdbQobr1isbX4VpcFi+C4
Mnr5Du3LVQNgvMnLTqWQDhwfDTZKXMzvLrbwuZ87DDtWcSKpwklSrne2a+SXTmDL
DYiZZSOp2kVwaegJYbIrMHEQFzigOC5pWZtGijD1gHYWBhLzuMu69eh852pyoFQc
SEiUJMOV159E7XOEFQEJ6Sj4nzc3HBTzEcSV4NYKHaUH+60ZOOt+Y6P3+0VinMc1
tXcFIM48/Dd5SvnG7rKez96kIRmr4A==
=VnXd
-----END PGP SIGNATURE-----

--Sig_/Q4H.HZ4OiJUasYIPdFcxplb--
