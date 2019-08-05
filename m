Return-Path: <SRS0=jfJ0=WB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203F8C0650F
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 14:24:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7A1B2086D
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565015070;
	bh=aZQiyvO7jST1S1/fPKZsNvahLZuunRH0n5WMss+U7W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IwVpm2l8Y4CY5plo5l+JgLVTOWdo4PkgPpY+1c1m+SEL6kJ9QLeP/rZ5U/LX6CJlv
	 RERGpHLVuj3VUu1H74N5QnyIlwmANIXN01zcDP20VGN+2l4/7KzCmQMQFlr0rIgHFm
	 atsWJiR6POU1oBw5RacULiaRnj62hIxMgzYbCxaY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729267AbfHEOY3 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 5 Aug 2019 10:24:29 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:56992 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbfHEOY3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Aug 2019 10:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=eezTYuaFJ41p0FglAAUo5tvk+Sx5H8RKlkZBQZJqI70=; b=c+8Gs6izRpppEiEy5we2d0+s5
        e9wNcmVsZY+G38bitfDDVtPisIhbQISLOfpDKX96g14/ir7OYK2mrxGGjPSjPoWnMNq12bzQC1lgs
        mxN6yPBOpYeXa346cSHNOs7YHYAe/0rWqdrjFsFAQ4Ay+QlPwJIDXdFabQB+Tj6t7QAOc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1huduS-0000SS-BK; Mon, 05 Aug 2019 14:24:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 4F08C2742D06; Mon,  5 Aug 2019 15:24:23 +0100 (BST)
Date:   Mon, 5 Aug 2019 15:24:23 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Tri Vo <trong@google.com>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        Matt Hart <matthew.hart@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: next/master boot: 256 boots: 6 failed, 177 passed with 72
 offline, 1 conflict (next-20190805)
Message-ID: <20190805142423.GG6432@sirena.org.uk>
References: <5d482ab9.1c69fb81.684ee.d95e@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0qt3EE9wi45a2ZFX"
Content-Disposition: inline
In-Reply-To: <5d482ab9.1c69fb81.684ee.d95e@mx.google.com>
X-Cookie: Place stamp here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--0qt3EE9wi45a2ZFX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 05, 2019 at 06:10:17AM -0700, kernelci.org bot wrote:

> arm64:
>     defconfig+CONFIG_CPU_BIG_ENDIAN=y:
>         clang-8:
>             meson-gxl-s805x-p241: 1 failed lab
>             meson-gxl-s905x-khadas-vim: 1 failed lab
>             meson-gxl-s905x-libretech-cc: 1 failed lab

We're still seeing failures with all clang builds failing to understand
the executable format of /init in big endian arm64 builds; GCC builds of
the same configuration boot successfully.  This has been going on for
about as long as we've been trying to boot clang builds AFAICT, it's a
huge proportion of the failures we're seeing in -next.

I did notice one similar failure for v7 GCC today:

	https://kernelci.org/boot/id/5d4807f559b514d97f31b28e/

which is also happening for other trees so that one at least looks
suspiciously like infrastructure.

--0qt3EE9wi45a2ZFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1IPBYACgkQJNaLcl1U
h9DJ9wf/eULOFpWLQMqMSmShmTXK9umOcrPzPr1NGR6JJ8IedQQ7PC62x34VOxVt
KZ46WEs0VlZelSi+xbXaQw2D0PuNcMJFAfG1PMtsOAoWwqfpg00W/tLK3R9U2nAP
CVbZ/FTkIWeQ4cV93guigIkNGbBELRch3GHGHCnYFC3OcWJ26XUSKE9FWzJjUnYE
Yw/ZopQCVv97225/BwWMInnwyvMM9+dcA1rbtIlM6o8uBZZW2QVrlJj69miBs1hm
Lb5RN+1bYvE03IdwJ5eoFixaF0rSB2Co+DjxrHN5+4oH/0GgVPIAqvTSZe6yGFI6
jAN33ORfpqn8vVMmv08aRfDwd2FBaQ==
=5kgP
-----END PGP SIGNATURE-----

--0qt3EE9wi45a2ZFX--
