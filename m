From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the regulator tree
Date: Wed, 7 Oct 2015 13:45:03 +1100
Message-ID: <20151007134503.48dd5084@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50658 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752667AbbJGCpH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Oct 2015 22:45:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>

Hi all,

After merging the regulator tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/regulator/core.c: At top level:
drivers/regulator/core.c:139:13: warning: 'regulator_lock_supply' defined but not used [-Wunused-function]
 static void regulator_lock_supply(struct regulator_dev *rdev)
             ^
drivers/regulator/core.c:159:13: warning: 'regulator_unlock_supply' defined but not used [-Wunused-function]
 static void regulator_unlock_supply(struct regulator_dev *rdev)
             ^

Introduced by commit

  9f01cd4a915e ("regulator: core: introduce function to lock regulators and its supplies")

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
