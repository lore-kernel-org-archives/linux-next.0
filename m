Return-Path: <SRS0=AjV7=V3=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21A5C433FF
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 13:28:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4BCC20644
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564493319;
	bh=XpWkFolxoM1QBzhbjz+wPLbK0rVXLuEzqUTJVYli1pE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0Uq7DO2W7ZhVj+oG6labSkk7L7uImNbL80WQmUTNt29t5TGhJIaN5xcAIbdlU2CZs
	 gltqmNhZVyEEkP+Gv77NswXmcSjHJEu/op8+8+oDQ4QB1UwxADQiV/6l9b7DAFPWms
	 LMS1RWuUupqu/YhMklfGs27rMncJp79KBsc3cbF0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbfG3N2j (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 30 Jul 2019 09:28:39 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:43590 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727681AbfG3N2i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Jul 2019 09:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=walLL9B2ctUvGn9VSOEMf5RfdhWokjcJ8sftsI3u0oE=; b=JBmq85+IrCD5UTa4/ev5Idm9x
        hftU0Smw6FZju2dNnYJHyjA/2JYQUP1ZdAOYnHOMtxR9SCC8EctW3F0LK9F7lzBbYpJYp+uDXd1jm
        3gH5zvdh8P5LftzAxOSjOB6QXGpoVx/EROyFADXD4MqvZevZlnfO5S8vcs4c+55n+YGwA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hsSB7-0007ZD-O5; Tue, 30 Jul 2019 13:28:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id CD4ED2742CB5; Tue, 30 Jul 2019 14:28:32 +0100 (BST)
Date:   Tue, 30 Jul 2019 14:28:32 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Tri Vo <trong@google.com>
Cc:     kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Matt Hart <matthew.hart@linaro.org>
Subject: Re: next/master boot: 265 boots: 17 failed, 184 passed with 64
 offline (next-20190730)
Message-ID: <20190730132832.GD4264@sirena.org.uk>
References: <5d403574.1c69fb81.14163.65d3@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Content-Disposition: inline
In-Reply-To: <5d403574.1c69fb81.14163.65d3@mx.google.com>
X-Cookie: Times approximate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2019 at 05:17:56AM -0700, kernelci.org bot wrote:

> next/master boot: 265 boots: 17 failed, 184 passed with 64 offline (next-20190730)
> Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/kernel/next-20190730/
> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/next-20190730/

For a while now all arm64 big endian clang built kernels have been
failing, the kernel mounts the root filesystem but is unable to execute
init due to an inability to understand the executable format:

08:55:25.999629  <6>[  226.077194] Run /init as init process
08:55:31.066490  <4>[  226.086518] request_module: kmod_concurrent_max (0) close to 0 (max_modprobes: 50), for module binfmt-464c, throttling...
08:55:31.085167  <4>[  231.135458] request_module: modprobe binfmt-464c cannot be processed, kmod busy with 50 threads for more than 5 seconds now
08:55:35.745340  ShellCommand command timed out.: Sending # in case of corruption. Connection timeout 00:01:54, retry in 00:00:11
08:55:35.846536  #
08:55:35.849523  #
08:55:36.185339  <4>[  231.154208] request_module: kmod_concurrent_max (0) close to 0 (max_modprobes: 50), for module binfmt-464c, throttling...
08:55:36.208673  <4>[  236.255449] request_module: modprobe binfmt-464c cannot be processed, kmod busy with 50 threads for more than 5 seconds now
08:55:36.209013  <3>[  236.269366] Failed to execute /init (error -8)
08:55:36.210161  <6>[  236.285459] Run /sbin/init as init process
08:55:41.306737  <4>[  236.294490] request_module: kmod_concurrent_max (0) close to 0 (max_modprobes: 50), for module binfmt-464c, throttling...
08:55:41.331547  <4>[  241.375455] request_module: modprobe binfmt-464c cannot be processed, kmod busy with 50 threads for more than 5 seconds now
08:55:41.331837  <3>[  241.389316] Starting init: /sbin/init exists but couldn't execute it (error -8)

(binfmt-464c is binfmt-misc, the fallback for unknown executable
formats).  The same kernel version built with GCC boots fine.

You can see a bunch of reports here (all the big endian failures):

	https://kernelci.org/boot/all/job/next/branch/master/kernel/next-20190730/

It's possible that there's some infrastructure error that's causing the
wrong ramdisk to be sent to the boards only for clang but I'd be a bit
surprised.

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1ARgAACgkQJNaLcl1U
h9DFbgf+KqXb8a9Ph8jjvciYHVMRk/1noLRaTxS02sx0KuuFAWpZt0LN72ou4vKq
Lxn59VKfK2aCp7f8Dul5PW4sPRWF4S+PlTEzURic0Cvho09GIOWrgfE2LDsAJ8wj
Z9w1wLWY+IJj3eaJI0CnUMuyhbzqgD4XLig6F4dTYt/MU1aHtYWZ6T7b1iPN90gk
6dJS8EXTbWquHHhXs0tf9OnPxYhG+TryzBeT6NmB7Jx+cE8Qte2ppiTHrrOdIzFn
+p4ky3406620ZXu08g78GURRoY6EeCerACq3hRXTQ41KVIC4aSjDgMGhDY6Wibp5
z7xqVe3dA6UODHmwiSHkod06K8H3lw==
=AzxX
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
