From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [next] ASoC fsl-ssi change breaks mpc85xx_defconfig build
Date: Wed, 11 Jun 2014 17:55:17 -0400
Message-ID: <5398D045.3060906@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:36971 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752657AbaFKVzP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Jun 2014 17:55:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Michael Grzeschik <mgr@pengutronix.de>, Mark Brown <broonie@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Markus,

A bisection shows that this commit:

432481220101166a0b33dc6f951b38a8af3d281c is the first bad commit
commit 432481220101166a0b33dc6f951b38a8af3d281c
Author: Markus Pargmann <mpa@pengutronix.de>
Date:   Tue May 27 10:24:25 2014 +0200

    ASoC: fsl-ssi: Use regmap

found in linux-next causes the 85xx powerpc build to fail with:

sound/soc/fsl/fsl_dma.c: In function 'fsl_soc_dma_probe':
sound/soc/fsl/fsl_dma.c:926:34: error: invalid use of undefined type 'struct ccsr_ssi'
sound/soc/fsl/fsl_dma.c:927:34: error: invalid use of undefined type 'struct ccsr_ssi'

You can see the failure here as well:

http://kisskb.ellerman.id.au/kisskb/buildresult/11308076/

Paul.    
