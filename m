From: Kevin Hilman <khilman@kernel.org>
Subject: Re: next-20150729 build: 2 failures 49 warnings (next-20150729)
Date: Wed, 5 Aug 2015 13:27:53 -0700
Message-ID: <CAMAWPa8n2fdAQFU+D6tm1e1Bv=uNKUimpB1OQjym6Nea-yhwWg@mail.gmail.com>
References: <E1ZKPJk-0007VU-Fg@optimist>
	<20150729124410.GE20130@sirena.org.uk>
	<20150804173849.GD20873@sirena.org.uk>
	<17C303E7-B358-486E-9E0F-83CF58F28481@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:44540 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753204AbbHEU15 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Aug 2015 16:27:57 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id D78D4203E1
	for <linux-next@vger.kernel.org>; Wed,  5 Aug 2015 20:27:56 +0000 (UTC)
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com [209.85.212.181])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9165E205D1
	for <linux-next@vger.kernel.org>; Wed,  5 Aug 2015 20:27:54 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so223316280wib.0
        for <linux-next@vger.kernel.org>; Wed, 05 Aug 2015 13:27:53 -0700 (PDT)
In-Reply-To: <17C303E7-B358-486E-9E0F-83CF58F28481@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, kernel-build-reports@lists.linaro.org, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, linux-next@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Will Deacon <will.deacon@arm.com>

On Tue, Aug 4, 2015 at 12:12 PM, Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
>
> On August 4, 2015 7:38:49 PM CEST, Mark Brown <broonie@kernel.org> wrote:
>>On Wed, Jul 29, 2015 at 01:44:10PM +0100, Mark Brown wrote:
>>> On Wed, Jul 29, 2015 at 12:14:36PM +0100, Build bot for Mark Brown
>>wrote:
>>
>>> Today's linux-next fails to build an arm64 allmodconfig due to:
>>
>>> >    arm64-allmodconfig
>>> > ../include/linux/platform_device.h:245:1: error: type defaults to
>>'int' in declaration of 'module_init' [-Werror=implicit-int]
>>> > ../include/linux/platform_device.h:250:1: error: type defaults to
>>'int' in declaration of 'module_exit' [-Werror=implicit-int]
>>
>>> caused by c84e358718a66f76 (soc: Mediatek: Add SCPSYS power domain
>>> driver) which does not include module.h.  Arguably platform_device.h
>>> should do that, though it's only an issue if the macro is used so...
>>
>>This is still breaking the build and the fix should be trivial - is
>>there any ETA for a fix getting into -next?
>
> I send a fix to arm@kernel.org but no reply yet. (sorry I'm not in front of a computer so I can't send you the link right now).
>
> I will send a pull request tomorrow, let's see if that helps...

Fix was applied today.

Kevin
