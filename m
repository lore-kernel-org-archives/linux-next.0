From: Alexandre Courbot <gnurou@gmail.com>
Subject: GENERIC_GPIO considered deprecated
Date: Thu, 21 Mar 2013 11:15:20 +0900
Message-ID: <CAAVeFu+QUw1WmzwaJDfjyw75PrStd3p3PHs1MU5BC7_WXMB7kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:44623 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755358Ab3CUCPl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Mar 2013 22:15:41 -0400
Received: by mail-ie0-f172.google.com with SMTP id c10so2997365ieb.3
        for <linux-next@vger.kernel.org>; Wed, 20 Mar 2013 19:15:40 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Romain Naour <romain.naour@openwide.fr>
Cc: linux-next <linux-next@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>

Hi Romain,

I have submitted a series of patches that deprecates the use of
GENERIC_GPIO as a first step towards the consolidation of GPIO around
gpiolib. The goal of this set of to remove all "select GENERIC_GPIO"
instances and it should be merged into linux-next starting from today.

I noticed that your patch "ARM: S3C24XX: Add samsung-time support for
s3c24xx" adds two new selections of GENERIC_GPIO - would you mind
changing them to "select ARCH_REQUIRE_GPIOLIB" for consistency with my
change? The result should be the same on your side.

Thanks,
Alex.
