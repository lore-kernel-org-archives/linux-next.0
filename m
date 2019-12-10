Return-Path: <SRS0=lNcl=2A=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1BBC43603
	for <linux-next@archiver.kernel.org>; Tue, 10 Dec 2019 23:26:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 529D520663
	for <linux-next@archiver.kernel.org>; Tue, 10 Dec 2019 23:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e8odf4UB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfLJX0U (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 10 Dec 2019 18:26:20 -0500
Received: from ozlabs.org ([203.11.71.1]:32897 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726881AbfLJX0T (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Dec 2019 18:26:19 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Xbm92z6dz9sPK;
        Wed, 11 Dec 2019 10:26:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576020377;
        bh=PGytk0PfzVdkLEf6e9KsALuc4b61O72lS9bV3C5P31o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=e8odf4UBSzkLyMxfLiFsa1XzCmzTAu7pBJ32E8DP+EMZmx603tF+R2vqPeGiK2+uj
         x9VaDg7wAzY/TwJngQ/YTssPJeGSWfCCMeogVUkF6cORGCzvIMxa9ShggpK/5ByZ0n
         ewnWGVC7fyd/H5TmCz//DL2Fve9VA4EDzMDpx5yJzrYed6DUh5/Ae0GgPbi4fWIxKs
         4r2uiEG2Rov5Cu6aVh+AdpGS1HgxMF2U0mlu4y+SIHRwVe9J2yGDtJZk1MjgXA+Jaf
         YF0XaboblaODKxjqc6mpSyTMoyQcA6LQhCC890bcGsWWD80CcWw+2Aa67UrhS9Sdcj
         GTPXDEDHOW+Hg==
Date:   Wed, 11 Dec 2019 10:26:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-next@vger.kernel.org
Subject: Re: next/master build: 214 builds: 10 failed, 204 passed, 17
 errors, 57 warnings (next-20191210)
Message-ID: <20191211102616.3cfb8fb5@canb.auug.org.au>
In-Reply-To: <5def8fc0.1c69fb81.d0c08.f4f4@mx.google.com>
References: <5def8fc0.1c69fb81.d0c08.f4f4@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P8w/IirQNjehtCCOAOZAWDY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P8w/IirQNjehtCCOAOZAWDY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 10 Dec 2019 04:29:52 -0800 (PST) "kernelci.org bot" <bot@kernelci.o=
rg> wrote:
>
> next/master build: 214 builds: 10 failed, 204 passed, 17 errors, 57 warni=
ngs (next-20191210)
>=20
>     3    drivers/net/ethernet/8390/8390p.c:48:15: error: conflicting type=
s for =E2=80=98eip_tx_timeout=E2=80=99
>     3    drivers/net/ethernet/8390/8390p.c:44:6: error: conflicting types=
 for =E2=80=98eip_tx_timeout=E2=80=99

These will be fixed today.

--=20
Cheers,
Stephen Rothwell

--Sig_/P8w/IirQNjehtCCOAOZAWDY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3wKZgACgkQAVBC80lX
0GyIlQf/cPeWIkWRW5uXRDmnknu9CSzN00qm394Ux1KD6iIpq5J48CAjHXZNWwaq
K1B+NshfN7DByzJX4XTkOGeZXFGkUdq5MFwaDuLzQDKFlIaH7RJWZLOZ0XvuFxU3
0jAmREQDusSt7x2NFarWdPi+Fn735jStNNtpnGR5NPkUuoxlpRE8xrB3tPL/T0PR
Hp94vmA/TlXx5tsxlL6WACbd2H3GyLb7ShvWlnIGHVELS/yR1L59jbB6WnyOQcjZ
o4MZyn7fjiosBJow5FCPSfdBvDkfIkl+S/8DQzePe57cPZF1j+R7mSsqcH4sRq+a
NlxAc37U6QebRAtSVq49enFGc8FSug==
=TzY9
-----END PGP SIGNATURE-----

--Sig_/P8w/IirQNjehtCCOAOZAWDY--
