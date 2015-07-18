From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: ASoC: cs4349: Add support for Cirrus Logic CS4349 breaks on multiple
 arch
Date: Sat, 18 Jul 2015 15:28:22 -0400
Message-ID: <20150718192822.GB4477@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:48220 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752090AbbGRT22 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Jul 2015 15:28:28 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: tim.howe@cirrus.com
Cc: broonie@kernel.org, linux-next@vger.kernel.org

Hi Tim,

This commit:

e40da86a37f64c73b810bc7a63d77c44dc61accb is the first bad commit
commit e40da86a37f64c73b810bc7a63d77c44dc61accb
Author: Tim Howe <tim.howe@cirrus.com>
Date:   Thu Jul 16 14:51:40 2015 -0500

    ASoC: cs4349: Add support for Cirrus Logic CS4349

    Signed-off-by: Tim Howe <tim.howe@cirrus.com>
    Signed-off-by: Mark Brown <broonie@kernel.org>

is showing up in linux-next build failures for mips, parisc and s390.

sound/soc/codecs/cs4349.c:300:2: error: implicit declaration of function
'devm_gpiod_get_optional' [-Werror=implicit-function-declaration]
sound/soc/codecs/cs4349.c:301:12: error: 'GPIOD_OUT_LOW' undeclared
(first use in this function)
sound/soc/codecs/cs4349.c:306:3: error: implicit declaration of function
'gpiod_set_value_cansleep' [-Werror=implicit-function-declaration]

Here are a few examples:

http://kisskb.ellerman.id.au/kisskb/buildresult/12465322/
http://kisskb.ellerman.id.au/kisskb/buildresult/12465445/
http://kisskb.ellerman.id.au/kisskb/buildresult/12465246/

I'm guessing it needs some tighter Kconfig dependencies to block it
from being selected on arch that don't have/enable gpio stuff.

Paul.
