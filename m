Return-Path: <SRS0=XbQ9=V6=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F36C32750
	for <linux-next@archiver.kernel.org>; Fri,  2 Aug 2019 13:04:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B35992087C
	for <linux-next@archiver.kernel.org>; Fri,  2 Aug 2019 13:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="w9ApgwGK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404114AbfHBNEG (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 2 Aug 2019 09:04:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44182 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404109AbfHBNEF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Aug 2019 09:04:05 -0400
Received: by mail-wr1-f65.google.com with SMTP id p17so77086712wrf.11
        for <linux-next@vger.kernel.org>; Fri, 02 Aug 2019 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=4tYADAgGqRhGr5S50MX3nQS4EBniZFY08V7kKLYCB+Y=;
        b=w9ApgwGKeQXLHzJSlYpzr0J2NcxiAJotChgFQe6J1QWac6kYRpk1ch+DrCjSfMI9UQ
         Q+nFyoO7Wo5wQrmhYlu6vw8omI7lm2mwWuTD5ROOS/aDrXJS5gXUaNVzbopQkkJaa5fU
         NmwQ2JvjjuHAH6ubY7aNxvr0oauOkCO4j2+NnYITjlMklgKakyrJVlD584ax1MriNkc5
         rlLrqYk/yYcYi2E4yPuT8WSyEBFb403VR9zSpi9ELx13ixvWQHPZmkZEjAZr76cCeUl5
         xpqHbjriDGvlpcYPs7amqi8V32YpJGcrJyH/Cj2nrLl66mGD14KTmWPZ6iTsS5a2afgu
         f3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=4tYADAgGqRhGr5S50MX3nQS4EBniZFY08V7kKLYCB+Y=;
        b=Bl6P9ux+SAU50JhkfLaiYRv6h1hne2WPSisLhCSvi0tZvVuMe9re7kJdL+Rd9v166w
         Uy651Xc6jNhWmOgfMJMs0Sv9hzHUDMuQQO4OFBTfUEVX/EfKsczhu1j8YOtEqrxBPu5m
         kuXmtMJQsA25LfRez7fe/q365BBlVJzz1OTshvAvGoCUMxp/FBtjFEqqp/sK+37bZa2A
         irR86GEOTSEUws8zJWHdUIVfxYJxtE3TILFeQQFgqGdaxfb/GdpF/n7xcFp+Iigbjd4x
         ZEkawgecK0LWo5wQGCO2QAPPGT9bcnMUcvH8O9IYeu0RvTsbg7P2TjU8cCCEWU0krIW0
         6sAw==
X-Gm-Message-State: APjAAAXvICdmJx4xAoc/yg5jcyQBCpOCQgi4M2/T8L+Q55XrQjgfjB+X
        L4HbortCPGSE6HzqA5j4Ds5/7l1Z2q8FKA==
X-Google-Smtp-Source: APXvYqxVPcdwCbB5z844xeunow0/PIVbBdDt6vn5NimF225MM4CeGE+dbM3syR3/NaNtlIoN9OZBOA==
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr151680412wro.33.1564751042715;
        Fri, 02 Aug 2019 06:04:02 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 5sm62349561wmg.42.2019.08.02.06.04.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 06:04:01 -0700 (PDT)
Subject: Re: next/master boot: 265 boots: 17 failed, 184 passed with 64
 offline (next-20190730)
To:     Mark Brown <broonie@kernel.org>, khilman@baylibre.com
Cc:     kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        linux-oxnas@groups.io
References: <5d403574.1c69fb81.14163.65d3@mx.google.com>
 <20190730123425.GB4264@sirena.org.uk>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <71c56763-2786-e864-cb34-852a1c830dda@baylibre.com>
Date:   Fri, 2 Aug 2019 15:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730123425.GB4264@sirena.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="1xEsepQlYxTzZZMYdhZrc2UY4qLKzxJ9Z"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1xEsepQlYxTzZZMYdhZrc2UY4qLKzxJ9Z
Content-Type: multipart/mixed; boundary="HW9FyrmIe8F3Yah5As3FxUbs2BUGi4652";
 protected-headers="v1"
From: Neil Armstrong <narmstrong@baylibre.com>
To: Mark Brown <broonie@kernel.org>, khilman@baylibre.com
Cc: kernel-build-reports@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
 linux-oxnas@groups.io
Message-ID: <71c56763-2786-e864-cb34-852a1c830dda@baylibre.com>
Subject: Re: next/master boot: 265 boots: 17 failed, 184 passed with 64
 offline (next-20190730)
References: <5d403574.1c69fb81.14163.65d3@mx.google.com>
 <20190730123425.GB4264@sirena.org.uk>
In-Reply-To: <20190730123425.GB4264@sirena.org.uk>

--HW9FyrmIe8F3Yah5As3FxUbs2BUGi4652
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On 30/07/2019 14:34, Mark Brown wrote:
> On Tue, Jul 30, 2019 at 05:17:56AM -0700, kernelci.org bot wrote:
>=20
>> Boot Failures Detected:
>>
>> arm:
>>     oxnas_v6_defconfig:
>>         gcc-8:
>>             ox820-cloudengines-pogoplug-series-3: 1 failed lab
>=20
> For some time now -next and mainline have been failing to boot on
> Pogoplug 3 with the oxnas_v6_defconfig, the kernel seems to start fine
> but fails to parse the ramdisk it's passed:
>=20
> 08:50:02.086589  <6>[    7.719854] IP-Config: Complete:
> 08:50:02.087213  <6>[    7.723330]      device=3Deth0, hwaddr=3D0a:a2:8=
9:27:10:1b, ipaddr=3D10.201.4.144, mask=3D255.255.0.0, gw=3D10.201.0.1
> 08:50:02.087413  <6>[    7.733409]      host=3D10.201.4.144, domain=3D,=
 nis-domain=3D(none)
> 08:50:02.088056  <6>[    7.739499]      bootserver=3D10.201.1.1, rootse=
rver=3D10.201.1.1, rootpath=3D
> 08:50:02.088248  <6>[    7.739504]      nameserver0=3D10.201.1.1
> 08:50:02.129966  <5>[    7.752025] RAMDISK: Couldn't find valid RAM dis=
k image starting at 0.
> 08:50:02.130381  <4>[    7.759616] List of all partitions:
> 08:50:02.131333  <4>[    7.763363] 0100           65536 ram0=20
>=20
> Possibly an issue with the ramdisk getting overwritten or something?

Thanks for reporting, it's my suspicion since my multiple bisect runs all=
 point to
this merge commit :
a318423b61e8 Merge tag 'upstream-5.3-rc1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/rw/ubifs

This merge doesn't introduce notable changes for the oxnas_v6_defconfig, =
but disabling UBI entirely makes
it work again.

Continuing my investigations...

Neil

>=20
> Full details for today's -next can be seen here:
>=20
> 	https://kernelci.org/boot/id/5d4004bb59b51489d631b28d/
>=20



--HW9FyrmIe8F3Yah5As3FxUbs2BUGi4652--

--1xEsepQlYxTzZZMYdhZrc2UY4qLKzxJ9Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAl1ENMAACgkQd9zb2sjI
SdHMwA//axa7tmbR0dsz3Iqp06C4UyGU9fIFNO5NtsbywqxrwEDkje7VBlLoli6q
HvtBHRE/Pge8Wn/Rlq+J1LbkwQACP3CCIDtTCxTKDHyFnIoiIaccesN4y1PC/MNe
YhB2VGvriqcUVsl7kGBzZjG12A+LCxhSa2gy8CWBTSt48JnW/ZO4T2fFNGgnVSHa
B1gffyY1Ma2SNLFnQ/Q+sp61vWsry6XyFLABv2x6yk7/RCtwooAUzOsIoVn8tadZ
C2vpCUaRMOyFhbBSBOwF0Tkyv/PK2AsE89qvjASYwEEUh/568JZXYtiWEXn7HX3Y
Mj9xWGH+mmS5UwbBk0rtoIjtzSXwVLGNBaZ0JFqMFvWETub9KkpXFwKd5HrH0udH
1xd3DHngpVrPIBC/nFBO2hYWREVZ26fPmizlYXrNoi2mKMPrWxDUtT9p96VAA3nY
hmQ8Z4W+VnPojBkGK+eCPuuvs/dzuawItdlroEQxD2hRRCFXJV4PjnJIRJX4aJfO
LVRqT60tNLKCoy/osc50k/cWjBMHmr+DMtkSFobi2QLo54reBZb16F8rd98LykYx
+jWV6Cr1wK4xmdP+5+eqLJZNEAPgpkeaDz4VnXG1jqywx+B/RjD8DDzLq2q+Y7qV
Q7NlBMdGXMcm0aENcQ+atP97svoJxtdvTtszPe+6RGDw+yaOK4Q=
=XbQu
-----END PGP SIGNATURE-----

--1xEsepQlYxTzZZMYdhZrc2UY4qLKzxJ9Z--
