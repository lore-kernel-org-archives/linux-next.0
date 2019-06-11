Return-Path: <SRS0=lqV3=UK=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3F5C4321A
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 16:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C7862086A
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 16:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560271564;
	bh=ueAoN7Qn18foCm3GGKx/4b2+/pjNiWU1hV1BoW+KR2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2BeBQND5IdTUv5RTYHhk5gLvZMsrlDhV+0zjiFwHqF+tVkM8Gwwwfk3sQInMVOqvN
	 5DrOjNU3By5rtCTL4UI8bR/P4NbWAw87NOLTaT31MYQ1nJs5RhhChtuRxltom5Bzgz
	 4FkW1PFnT3DetKGHWUVTj/JeAaqgAMqbX5DMCJrs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388030AbfFKQqD (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 11 Jun 2019 12:46:03 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46968 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388229AbfFKQqD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Jun 2019 12:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=W5gQPkVM7jP5xtb25GOh+1waT6S1jB2k3sECOmQS//0=; b=gdB3Jhme4SlvBW20mWywREPEZ
        mFId6MoV4WnkU0xiMq4pXhnet3crBNeigS7fF96GCf6WT1pR/nPlf0dUyJKceXnNv2QZ7DuZ9cYrs
        gYzavJEA/L2UXi1KZddc2o/O2L+UHH6YfaI6ghYgOuTdonv9LHRaROCuGcygkj/c7JTOA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hajuG-0000Bo-LP; Tue, 11 Jun 2019 16:45:56 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id D6694440046; Tue, 11 Jun 2019 17:45:54 +0100 (BST)
Date:   Tue, 11 Jun 2019 17:45:54 +0100
From:   Mark Brown <broonie@kernel.org>
To:     James Qian Wang <james.qian.wang@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     kernel-build-reports@lists.linaro.org,
        linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
Subject: Re: next-20190611 build: 1 failures 20 warnings (next-20190611)
Message-ID: <20190611164554.GD5316@sirena.org.uk>
References: <E1haipo-0003Ae-CW@optimist>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline
In-Reply-To: <E1haipo-0003Ae-CW@optimist>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2019 at 04:37:16PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:206:30: error: passing argument 3 of 'd71_layer_update_fb' from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:385:30: error: passing argument 3 of 'd71_layer_update_fb' from incompatible pointer type [-Werror=incompatible-pointer-types]

due to 75f3b7efacb8e (drm/komeda: Add format support for Y0L2, P010,
YUV420_8/10BIT) which introduces those two calls.

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz/2r8ACgkQJNaLcl1U
h9CyqggAgloTZxQRgBpbsluShw1SLkikwibJx0Qo17XyH/PBIwVi4+IiPSiE4IsA
4qiQ/RJZpkO39LG/RsetgzVTGha6mXVVZ2IWFhM4b1Pz71h2gvknhsTm62oKwx1H
bibBN915JPTCjg+RF+ry3Id4Ez/q5E8JUM7vyKns72IOPjJCsdD7HCcUCXhPWF08
c3MfiRcuAUm3JuX1LILSiiVSBf+5VrX+uV9uBwSk2gtFGLYICkSKNqpVsOMnaH8+
rABEqyGFJc135bEbfBXGjKAJemCJe0/UZkpmF0O3S8JHstbtngSL8e19nrFQTt0y
aZUAV0+AJxTzh4dFl6Qpj+0xhquONw==
=WEo4
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
