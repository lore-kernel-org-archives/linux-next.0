From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tegra tree with the renesas tree
Date: Wed, 18 Nov 2015 10:15:12 +1100
Message-ID: <20151118101512.0691d12f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>, Simon Horman <horms@verge.net.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <damm+renesas@opensource.se>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tegra tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  727e8d0126e3 ("arm64: defconfig: renesas: Enable Renesas r8a7795 SoC")

from the renesas tree and commit:

  0a31289369f8 ("arm64: defconfig: Enable serial-tegra driver")

from the tegra tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm64/configs/defconfig
index a260e3a46f01,3852c51330e2..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -118,9 -116,7 +118,10 @@@ CONFIG_SERIAL_SAMSUNG=
  CONFIG_SERIAL_SAMSUNG_UARTS_4=y
  CONFIG_SERIAL_SAMSUNG_UARTS=4
  CONFIG_SERIAL_SAMSUNG_CONSOLE=y
 +CONFIG_SERIAL_SH_SCI=y
 +CONFIG_SERIAL_SH_SCI_NR_UARTS=11
 +CONFIG_SERIAL_SH_SCI_CONSOLE=y
+ CONFIG_SERIAL_TEGRA=y
  CONFIG_SERIAL_MSM=y
  CONFIG_SERIAL_MSM_CONSOLE=y
  CONFIG_SERIAL_OF_PLATFORM=y
