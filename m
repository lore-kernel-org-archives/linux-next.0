From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: next-20170518 build: 1 failures 4 warnings (next-20170518)
Date: Thu, 18 May 2017 19:16:55 +0800
Message-ID: <C252950D-15D8-48DB-9149-799546627FC2@aosc.io>
References: <E1dBFeZ-0004Qr-Jp@optimist> <20170518103607.u7l7vr2rnv3rsysu@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:45396 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934606AbdERLRB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 May 2017 07:17:01 -0400
In-Reply-To: <20170518103607.u7l7vr2rnv3rsysu@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org



于 2017年5月18日 GMT+08:00 下午6:36:07, Mark Brown <broonie@kernel.org> 写到:
>On Thu, May 18, 2017 at 08:15:19AM +0100, Build bot for Mark Brown
>wrote:
>
>Today's -next fails to build an ARM allmodconfig due to:
>
>> 	arm-allmodconfig
>> Error: ../arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts:69.17-18
>syntax error
>
>caused by ff175ef29e9069ac46 (ARM: sun8i: v3s: add support for Lichee
>Pi
>Zero w/ dock board).  

I sent a fix and Maxime said that he has squashed it into the
original patch.

P.S. I also forgot to write the dtb file into Makefile, so it passed
my local build. Does the CI build have different build system
for DTBs?
