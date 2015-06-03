From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: compile fail with "soc/tegra: fuse: Unify Tegra20 and
 Tegra30 drivers"
Date: Wed, 3 Jun 2015 12:08:08 -0400
Message-ID: <20150603160808.GM29898@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:36710 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755549AbbFCQIh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2015 12:08:37 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <treding@nvidia.com>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Thierry,

This commit:

  commit 436b6428b9cc97f61721f335eb9d8010751a337e
  Author: Thierry Reding <treding@nvidia.com>
  Date:   Wed Apr 29 16:54:04 2015 +0200

    soc/tegra: fuse: Unify Tegra20 and Tegra30 drivers

in linux-next, in combination with my pending init cleanup

http://marc.info/?l=linux-kernel&m=143327626201054&w=2

will cause a compile fail because 43b642 is relying on an
implicit include of <linux/module.h> to provide the fcn for:

   +module_platform_driver(tegra_fuse_driver);

which in turn causes:

drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

Can you add the include to your tree please?  I think it makes
more sense to be there vs. me preemptively adding it to mine.

BTW, I think we can look at converting your driver to use the alternate
fcn builtin_platform_driver later, once that branch is merged.

https://lwn.net/Articles/643854/

Thanks,
Paul.
