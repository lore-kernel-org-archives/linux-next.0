From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mmc-uh tree
Date: Thu, 31 Dec 2015 14:53:29 +1100
Message-ID: <20151231145329.63b42c86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41505 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755186AbbLaDxc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Dec 2015 22:53:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lucas Stach <dev@lynxeye.de>

Hi Ulf,

After merging the mmc-uh tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/mmc/host/sdhci-tegra.c:361:38: error: redefinition of 'sdhci_tegra210_pdata'
 static const struct sdhci_pltfm_data sdhci_tegra210_pdata = {
                                      ^
drivers/mmc/host/sdhci-tegra.c:343:38: note: previous definition of 'sdhci_tegra210_pdata' was here
 static const struct sdhci_pltfm_data sdhci_tegra210_pdata = {
                                      ^
drivers/mmc/host/sdhci-tegra.c:370:42: error: redefinition of 'soc_data_tegra210'
 static const struct sdhci_tegra_soc_data soc_data_tegra210 = {
                                          ^
drivers/mmc/host/sdhci-tegra.c:354:42: note: previous definition of 'soc_data_tegra210' was here
 static const struct sdhci_tegra_soc_data soc_data_tegra210 = {
                                          ^
drivers/mmc/host/sdhci-tegra.c:372:14: error: 'NVQUIRK_DISABLE_SDR50' undeclared here (not in a function)
  .nvquirks = NVQUIRK_DISABLE_SDR50 |
              ^
drivers/mmc/host/sdhci-tegra.c:373:7: error: 'NVQUIRK_DISABLE_DDR50' undeclared here (not in a function)
       NVQUIRK_DISABLE_DDR50 |
       ^
drivers/mmc/host/sdhci-tegra.c:374:7: error: 'NVQUIRK_DISABLE_SDR104' undeclared here (not in a function)
       NVQUIRK_DISABLE_SDR104,
       ^

Caused by patch

   "mmc: tegra: Add Tegra210 support"

turning up in two trees (mmc-uh and tegra) as separate commits and then
further changes to this file in the mmc-uh tree.

I used the version of the file from the mmc-uh tree.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
