Return-Path: <SRS0=jfJ0=WB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EF6C41514
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 11:12:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 588B921734
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565003536;
	bh=NRrLn51QR0WDETLf8Wf3gMrvZU8NJXPiP38IOiqwuc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xQZ+CizAMDhsQWiLdEs/FrdgPzilb6atsHtxQ+k1H3WNp4w3pmVVK91KUCRkhbsyu
	 ACF2kcERIQt68bZmu9zlKSDaAnChTtKkDAcfZgnSPtmpddlLf4KgR9vhk6RBMnWsRE
	 CD33+5c1J4B/inXxRyO2ynt/1WLP+lwSxqotm/Zc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfHELMP (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 5 Aug 2019 07:12:15 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44554 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfHELMP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Aug 2019 07:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=K4Aat8AT+6tYW8UP9Bp0lYfZhLOGe429fHYIBSshOXA=; b=i+hQmhPyAnXuKrxgrdyNGvu5Z
        rdXYA9jTPHqEhzd0yklVGCUut72A3c3rjaKnylc58wr0k/GyqUaGyC23VXXP07OGiEKKcyIZvkUzx
        vfFVK1K7F6hftZ+zGhPbDefsvqhjSDu2jN91D/IKG/CydHqgNUjUglKribqQ3cuYiYiUY=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1huauM-0008IA-Rb; Mon, 05 Aug 2019 11:12:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id C258A2742D06; Mon,  5 Aug 2019 12:12:05 +0100 (BST)
Date:   Mon, 5 Aug 2019 12:12:05 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Zhou <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Tao Zhou <tao.zhou1@amd.com>,
        Dennis Li <dennis.li@amd.com>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-next@vger.kernel.org
Subject: Re: next/master build: 230 builds: 5 failed, 225 passed, 6 errors,
 1344 warnings (next-20190805)
Message-ID: <20190805111205.GB6432@sirena.org.uk>
References: <5d47f990.1c69fb81.a5d88.ee1f@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline
In-Reply-To: <5d47f990.1c69fb81.a5d88.ee1f@mx.google.com>
X-Cookie: Place stamp here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 02:40:32AM -0700, kernelci.org bot wrote:

Today's -next fails to build an arm allmodconfig due to:

> allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 16 warnings, 0 sectio=
n mismatches
>=20
> Errors:
>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit dec=
laration of function 'readq'; did you mean 'readb'? [-Werror=3Dimplicit-fun=
ction-declaration]
>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit dec=
laration of function 'writeq'; did you mean 'writeb'? [-Werror=3Dimplicit-f=
unction-declaration]

due to 4fa1c6a679bb0 (drm/amdgpu: add RREG64/WREG64(_PCIE) operations)
which introduces use of readq() and writeq().

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1IDwQACgkQJNaLcl1U
h9ARMQf8CpKTcEPj9AoJAXRS0EO8wCrctRVwqRqJ4Vb13LXHkmNV9a15IgiKoEM7
OHHTwl/t/mBlajYsyoghxsgB0aIXckM5rJ77d+GEFQln4rkjx3ZmxFwZKhUNNbcE
3Jn5jYj3B37pbnzB7aYJK1ESO9lKOHY45ZcywGG+cvgqWuRHu8jdCuQXE3xFbNBM
CdDJh3JK5ihmP97JCGSUvGZCJS8StLHsLzJ0G2/K7wCYM86N3NxIYKeDuwYtXgna
tWl6ZwwsnV70LLjGueAHIUC3kk/2vi9UHpjLpUr8PZI9f3WKJZfibW+7JqqYgp/5
S6J7mggMrr4WljGwRgLwbuKFDmPKkw==
=mwnn
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
