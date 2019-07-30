Return-Path: <SRS0=AjV7=V3=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A35C0650F
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 12:34:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2F3E206E0
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564490072;
	bh=1UjhES2iGbFTnNijmZHs5fyhgQ8oro399sm3BfiuAD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=A1tp6PjpbnQHPWyr2lom1DZ5X0wc8vcy/uvt5Y2+dYsMQg6dSwZ1mlNVTZFNpnCb7
	 yipE1njsshjCqVKsLVfUDSBE5QAScqT2GAuwrgxfXiDbuWTl1u+jmJ0Hdyi0eOf/sr
	 JgeNhq44XZ6u9/czoktosgu8IvmlIM87kI+MXTrg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbfG3Mec (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 30 Jul 2019 08:34:32 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37364 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbfG3Meb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Jul 2019 08:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=D2YPQJSssFXG6XJhGCQI9LtrGRYEbm9Vq4RoLp19BNU=; b=rHu2BycLd+YYaFD2GZaq7O3Et
        jHoKHhun6/D56t5jU2t8Omk80fN8N1YT451NzhorKaNVhIVSUxc+oswCEnESSIxvKvfipUg4/CmC9
        4ul/BXAb+qPSQrXBvaxhiYElXkXup2Ti43+8SXJFU2OVk8eyiw2JHLabnsnqDAAB+tO5Y=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hsRKk-0007Qu-Ca; Tue, 30 Jul 2019 12:34:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 8BEEC2742D06; Tue, 30 Jul 2019 13:34:25 +0100 (BST)
Date:   Tue, 30 Jul 2019 13:34:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        linux-oxnas@groups.io
Subject: Re: next/master boot: 265 boots: 17 failed, 184 passed with 64
 offline (next-20190730)
Message-ID: <20190730123425.GB4264@sirena.org.uk>
References: <5d403574.1c69fb81.14163.65d3@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline
In-Reply-To: <5d403574.1c69fb81.14163.65d3@mx.google.com>
X-Cookie: Times approximate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2019 at 05:17:56AM -0700, kernelci.org bot wrote:

> Boot Failures Detected:
>=20
> arm:
>     oxnas_v6_defconfig:
>         gcc-8:
>             ox820-cloudengines-pogoplug-series-3: 1 failed lab

For some time now -next and mainline have been failing to boot on
Pogoplug 3 with the oxnas_v6_defconfig, the kernel seems to start fine
but fails to parse the ramdisk it's passed:

08:50:02.086589  <6>[    7.719854] IP-Config: Complete:
08:50:02.087213  <6>[    7.723330]      device=3Deth0, hwaddr=3D0a:a2:89:27=
:10:1b, ipaddr=3D10.201.4.144, mask=3D255.255.0.0, gw=3D10.201.0.1
08:50:02.087413  <6>[    7.733409]      host=3D10.201.4.144, domain=3D, nis=
-domain=3D(none)
08:50:02.088056  <6>[    7.739499]      bootserver=3D10.201.1.1, rootserver=
=3D10.201.1.1, rootpath=3D
08:50:02.088248  <6>[    7.739504]      nameserver0=3D10.201.1.1
08:50:02.129966  <5>[    7.752025] RAMDISK: Couldn't find valid RAM disk im=
age starting at 0.
08:50:02.130381  <4>[    7.759616] List of all partitions:
08:50:02.131333  <4>[    7.763363] 0100           65536 ram0=20

Possibly an issue with the ramdisk getting overwritten or something?

Full details for today's -next can be seen here:

	https://kernelci.org/boot/id/5d4004bb59b51489d631b28d/

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1AOVAACgkQJNaLcl1U
h9ALMgf/UsXvdF4Sayi9hNUwwm0wCOJ9dB1n8L76v9DjPI1cN8MvrF+3M3HS7M7S
6jNyB7dFoxrMILacFV4Co45NcBMF+ZgeJjPcWDHpF/vwj0XsV8d2C9aIvdLpqdVy
Jh65+wIkFnTPWhrjTzFUxAlWclv/6i7ZBBe42oC79SInfsieyNH5V1OMoO01XI7i
CyTqDXmbQL72Nmp2r5jCi/SwrC5Sh1xYWVFynDoyGVZieOr8oQOIsRyaDzqAj+nc
Zqw0nmzkVJzkBYqqSs+P4IaD5BKrWUwiofTMspxnAPXt8X5K57GfXvgswGxBNvhE
4ut4elXlKKD4+AwZAiwwAe05rE3iCA==
=+oW9
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
