From: "Kim, Milo" <Milo.Kim@ti.com>
Subject: RE: linux-next: build failure after merge of the regulator tree
Date: Thu, 21 Jun 2012 08:13:15 +0000
Message-ID: <A874F61F95741C4A9BA573A70FE3998FC074@DQHE02.ent.ti.com>
References: <20120621132738.6e797593acc58b3e30902f69@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:40378 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754488Ab2FUINW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jun 2012 04:13:22 -0400
In-Reply-To: <20120621132738.6e797593acc58b3e30902f69@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Axel Lin <axel.lin@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "Girdwood, Liam" <lrg@ti.com>

> Caused by commit 809d310c7e69 ("regulator: lp872x: Don't allow modular
> build") but that was done to fix a different build problem.

Sorry for this conflict.

Build config of lp872x driver has been changed as tristate.
And related undefined symbol error has been fixed.
(don't use devm_gpio_request_one() at this moment because it can not be exported.)

Please check patches below.

[PATCH 1/3] regulator: enable module build config for lp872x
[PATCH 2/3] regulator: replace devm_gpio_request_one() for loaded module

Thanks & BR
Milo -
