From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 15 Jan 2018 12:08:51 +1100
Message-ID: <20180115120851.52621958@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/tegra/sor.c

between commit:

  d780537f9b49 ("drm/tegra: sor: Fix hang on Tegra124 eDP")

from Linus' tree and commit:

  1087fac18b8e ("drm/tegra: dc: Use direct offset to plane registers")

from the drm tree.

I fixed it up (I just included the comment from the former) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
