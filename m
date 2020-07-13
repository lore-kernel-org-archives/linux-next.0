Return-Path: <SRS0=zMnM=AY=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163E2C433E0
	for <linux-next@archiver.kernel.org>; Mon, 13 Jul 2020 15:48:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DED592075B
	for <linux-next@archiver.kernel.org>; Mon, 13 Jul 2020 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594655313;
	bh=BJRdS8UDSmuQA6iSp4Z2DXAA/LuYlKm8QLzZPV9K8d0=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=poNLxEY+Tt4sIf2R2kz4nL0pyB9fBmyy5ncUiEmE+GEJCgvW9c1xL8CE4KljKH4/4
	 hj3javIE6priCG5q8FVPB9qb4mOeXmZbchHiDvYfeJ5pgtvOpVRocnwQ35o//USwOL
	 eqmy1oKNfxdF9s3Ro9DfbmJ0JN+3oJO2rSW/ZEzs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbgGMPsc (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 13 Jul 2020 11:48:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:43338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729492AbgGMPsb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jul 2020 11:48:31 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4D8A207BC;
        Mon, 13 Jul 2020 15:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594655311;
        bh=BJRdS8UDSmuQA6iSp4Z2DXAA/LuYlKm8QLzZPV9K8d0=;
        h=Date:From:To:Cc:Subject:From;
        b=ZI2198ArFH0Gd9UaAkcLHTg3HwttIBXrb1KmrmBz4C13L/JI5TYO6c0eJSmphLr62
         hs8Q0BW0h+vO4cQGU9Zdt3Vw2chCeTVIylVxDhiOYYHc0Balv3ICWC0ZQNx8yi6j0L
         PK4IkXJ7YIn77vuHYpaa8fk7adnxGna6h47pOUJA=
Date:   Mon, 13 Jul 2020 16:48:22 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Alex Elder <elder@linaro.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org
Subject: Build failures in -next in qcom_common.c
Message-ID: <20200713154822.GC4420@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Since Friday -next has been failing to build various arm and arm64
configurations with:

drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
        info = kzalloc(sizeof(*info), GFP_KERNEL);
               ^
drivers/remoteproc/qcom_common.c:210:7: warning: incompatible integer to pointer conversion assigning to 'struct qcom_ssr_subsystem *' from 'int' [-Wint-conversion]
        info = kzalloc(sizeof(*info), GFP_KERNEL);
             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 warning and 1 error generated.

caused by 5abfe5cf0b8358b8ad0 (remoteproc: qcom: Add per subsystem SSR
notification) which adds a use of kzalloc() without ensuring that it is
prototyped.

--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8MgkUACgkQJNaLcl1U
h9BH4gf8De7vCWX00YgvyZplg/HHYNr+cszcZZDHXRrmgWpPTBJjNu2SAVV0KVns
jKNjuaWAQ48x3dP0Ph4EsRGSA0o0Uzpncd2+rVKRTJuIAJpBe77gxhQNaOTqM0br
4QwNtwhvrFJIAUkyk1xaUR/VRl8WWwhj3XX3s7iVjXx7Qi53X8MCQuCqmpJy9n8C
4CQ1poAqR+A4Eo7gqAKljtVB9TYU0iNshsWeiaFsqjgXFaiM0pBLj5ARlcvTmZUh
KWVdjSw48kdZYeoa/wpEJTpg2RIPusHcWcSsgKCThR1eEi/gS3mGkLMI1SF6iyIF
AaPW+qHI8WcbrEYG8hj9799Df7PBCg==
=42W5
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
