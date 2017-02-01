From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the regulator tree
Date: Wed, 1 Feb 2017 13:42:21 +1100
Message-ID: <20170201134221.7a413d9b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47633 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751180AbdBACmY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Jan 2017 21:42:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

Hi all,

After merging the regulator tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/regulator/anatop-regulator.c: In function 'anatop_regulator_probe':
drivers/regulator/anatop-regulator.c:310:24: error: assignment of member 'enable' in read-only object
    anatop_rops.enable  = regulator_enable_regmap;
                        ^
drivers/regulator/anatop-regulator.c:311:24: error: assignment of member 'disable' in read-only object
    anatop_rops.disable = regulator_disable_regmap;
                        ^
drivers/regulator/anatop-regulator.c:312:27: error: assignment of member 'is_enabled' in read-only object
    anatop_rops.is_enabled = regulator_is_enabled_regmap;
                           ^

Caused by commit

  524d339a9d6b ("regulator: anatop-regulator: constify regulator_ops structure")

I can only assume that this patch has been rebased since it was tested.

I have used the regulator tree from next-20170131 for today.

-- 
Cheers,
Stephen Rothwell
