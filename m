From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the regmap tree
Date: Mon, 6 Nov 2017 11:54:59 +1100
Message-ID: <20171106115459.563e021a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35337 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751454AbdKFAzB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Nov 2017 19:55:01 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Mark,

After merging the regmap tree, today's linux-next build
(arm_multi_v7_defconfig) produced this warning:

drivers/base/regmap/regmap.c: In function '__regmap_init':
drivers/base/regmap/regmap.c:1121:1: warning: label 'err_map' defined but not used [-Wunused-label]
 err_map:
 ^

Introduced by commit

  f25637a6b89e ("regmap: Add a config option for hwspinlock")

-- 
Cheers,
Stephen Rothwell
