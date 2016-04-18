From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the regulator tree
Date: Mon, 18 Apr 2016 13:43:51 +1000
Message-ID: <20160418134351.087823c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the regulator tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/msm/dsi/dsi_host.c: In function 'dsi_regulator_init':
drivers/gpu/drm/msm/dsi/dsi_host.c:329:3: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
   if (regulator_can_change_voltage(s[i].consumer)) {
   ^

and several more ...

Introduced by commit

  6a0028b3dd67 ("regulator: Deprecate regulator_can_change_voltage()")

In the future, please fix up all the current users of an interface
*before* marking it deprecated.  All these extra warnings just muddy the
"real" warnings ...

-- 
Cheers,
Stephen Rothwell
