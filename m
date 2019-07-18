Return-Path: <SRS0=DNjb=VP=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076C2C7618F
	for <linux-next@archiver.kernel.org>; Thu, 18 Jul 2019 16:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE8C021850
	for <linux-next@archiver.kernel.org>; Thu, 18 Jul 2019 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563466810;
	bh=IwmdrbNMEEaFvm+uEBYI28R68gpVIygST3+7m732p80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JvBTy97BMCmSW/+RbPJ0PQ684HidDB5C8b7TOqlgegUi6Ehe62xrTRejkyyGiE1z5
	 tHUBqKiLh0qBZFc+ulQj3Kuo6RwjiHOXJwZ+nrA1CYZ+9rerppCrzQDfGn6fuZMr/b
	 0M/InzGhXnEdEGlCzgAA4jj2Rvb+pEhRyrekdSPY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbfGRQUK (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 18 Jul 2019 12:20:10 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40202 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfGRQUK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jul 2019 12:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=GEMJ79gll8fP32MQKMulFqjgp+NR3HbjScGjmbnKEQc=; b=qExq3ELCPLlqIUuyQOUpjrWKT
        FZb4jSgNAU0UuviR0DrHWXyKkaP74MjQiOnZNiLav2El6hlQnKq//ba5IImoMzNAawUf7ZJTJynLx
        zDjV0E3Sc5HRF+3Amt/yoLHyAi2/sK5QHkzxk1BLxmZskny912PxiCSN5HmBE7HTc4kxw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1ho98Y-0005YS-BR; Thu, 18 Jul 2019 16:20:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id A2E5F274175C; Thu, 18 Jul 2019 17:20:05 +0100 (BST)
Date:   Thu, 18 Jul 2019 17:20:05 +0100
From:   Mark Brown <broonie@kernel.org>
To:     khilman@baylibre.com, Heiko Stuebner <heiko@sntech.de>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        linux-rockchip@vger.kernel.org
Subject: Re: next/master boot: 285 boots: 16 failed, 264 passed with 3
 offline, 1 untried/unknown, 1 conflict (next-20190718)
Message-ID: <20190718162005.GF5761@sirena.org.uk>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline
In-Reply-To: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com>
X-Cookie: Oh, wow!  Look at the moon!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:

Today's -next started failing to boot defconfig on rk3399-firefly:

> arm64:

>     defconfig:
>         gcc-8:
>             rk3399-firefly: 1 failed lab

It hits a BUG() trying to set up cpufreq:

[   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 200000 KHz
[   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 408000 KHz
[   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 12000 KHz
[   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set clock rate: -22
[   87.491881] cpufreq: __target_index: Failed to change cpu frequency: -22
[   87.495335] ------------[ cut here ]------------
[   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
[   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP

I'm struggling to see anything relevant in the diff from yesterday, the
unlisted frequency warnings were there in the logs yesterday but no oops
and I'm not seeing any changes in cpufreq, clk or anything relevant
looking.

Full bootlog and other info can be found here:

	https://kernelci.org/boot/id/5d302d8359b51498d049e983/

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0wnDQACgkQJNaLcl1U
h9AJLAf/QOWPPRySQV2t0p6i7pkJ5HN1H8EXj6vGqUAcVNcLzFKwST9mV6iDuvhh
wLJTSe4sTaBVxyMzUHJvXrGJ9G28cpymST0ltXQ6F+7kilwWZXUeuZlKx0v08QRM
EMU3U/731EN5qYY0ueC5CFMS5uW4iMtf7/hVUFE3weRM9hp7bd173ZK/8RmctDOX
o4PBdEWl1I+UOgZQUS7bDiR8ii6wZG302Cylr377u2URMnFSob9UWQHSDtWWo/TN
aFhIrR9xdAMWRNgsI3PTYH8KCwxLAnHTeV/dNVEi1YN2hsaLTvKIoEUyJr8En6nA
QW3BmP2IrH/NaMKOmn0+9lznApOrAQ==
=umHc
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
