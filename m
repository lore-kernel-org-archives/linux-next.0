Return-Path: <SRS0=AjV7=V3=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93E2C433FF
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 13:00:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BE192087F
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564491656;
	bh=k+xfyxeDQrzgv2pVOt1kpZziSeY/kciXmsKb6Qa7BRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wv3/J8g8VBAUzJ9H8tU3qHDI7ViDu6limdjrK+FbllBq56DAHTIPS8dArd59jEKtR
	 fr8OxkmOf/X+cx3SmSUSAhaeGRtLXbFXJcC9bxFsJ5DneQWgIGX7G/t/lF0iAagAnL
	 r/MkdX6Z0XxjUvkUHxuTXyfc1ojcQbjqqibwsA4o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbfG3NA4 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 30 Jul 2019 09:00:56 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53532 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbfG3NAz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Jul 2019 09:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=R/SyRq6FyELxtxiORJjLbvIf0Y67FRULyN5eHL7APCE=; b=TSc8MgeA+4AglHkUpwuoCE7yM
        Ekffh0gSHlCpNHED7yw8ZuR+jj/bX5/Fxlmx51J4EUuFni/t6CBKgn37C2b81hRIHf69fQzhnoKOX
        z7FsljtFmaxza50MuxWymGgWOMNMtMTPSMC245xt1EMr5lBk2ClcAlibc4MoBl/KALxH8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hsRkG-0007Vi-CY; Tue, 30 Jul 2019 13:00:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 80F6C2742CB5; Tue, 30 Jul 2019 14:00:47 +0100 (BST)
Date:   Tue, 30 Jul 2019 14:00:47 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc:     kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: next/master boot: 265 boots: 17 failed, 184 passed with 64
 offline (next-20190730)
Message-ID: <20190730130047.GC4264@sirena.org.uk>
References: <5d403574.1c69fb81.14163.65d3@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <5d403574.1c69fb81.14163.65d3@mx.google.com>
X-Cookie: Times approximate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2019 at 05:17:56AM -0700, kernelci.org bot wrote:

The previously reported issues with booting -next on
meson-gxm-khadas-vim2 are still present today, though seemingly only
manifesting with CONFIG_RANDOMIZE_BASE and not defconfig (there are
failures with big endian too but they don't look device specific):

> arm64:

>     defconfig+CONFIG_RANDOMIZE_BASE=y:
>         gcc-8:
>             meson-gxm-khadas-vim2: 1 failed lab

It looks like it gets to userspace and then hangs (end of the log
below).  More details at:

	https://kernelci.org/boot/id/5d40069859b5148b3931b2bf/

The last message in the log indicates it was initializing the Panfrost
driver:

08:53:47.332143  <6>[   15.172833] panfrost d00c0000.gpu: clock rate = 666666666
08:55:40.299880  ShellCommand command timed out.: Sending # in case of corruption. Connection timeout 00:04:14, retry in 00:02:07

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1AP34ACgkQJNaLcl1U
h9Csfwf/XsFzkhd2FswYbeGTTmMLf9k5KdI/kIbIqm9iw0JA6z8okdcGhwiUIRXA
fzrZI0iAXkijMLlUHPHWuNZYRu1zra5/a6jxxP01F8SoYCl88urfZ4sTBkQdAunE
1Gvu8vgxkkqxfHMaEldGMEaKu6xHh7vyYW+XjHJ1XWAeiMZYbL25GoSER+EH5XOy
4T/7RglA/lKrz96R2q4femYzT2Mb/f1//gmaXyu0m15yDSNd7aNPy8aTgEpNoNgL
3E8XMKtSJ0/lNFZPOgSah808rAqOr2wEM+V7DEJ13mCDrXyJS4HWmvGKN6VwZUq2
RMk9zVuGeA0v09fh8Q5dU8pOWF+9Cw==
=N+Ek
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
