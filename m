From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Thu, 4 May 2017 08:33:36 +1000
Message-ID: <20170504083336.35ed36ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44909 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751908AbdECWdj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 May 2017 18:33:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: ": Dave Airlie" <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>, Sean Paul <seanpaul@chromium.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Sorry that I did not notice this at the time ... This is now in Linus'
tree.

After merging the drm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

arch/arm/configs/multi_v7_defconfig:596:warning: symbol value 'm' invalid for ROCKCHIP_ANALOGIX_DP
arch/arm/configs/multi_v7_defconfig:597:warning: symbol value 'm' invalid for ROCKCHIP_DW_HDMI
arch/arm/configs/multi_v7_defconfig:598:warning: symbol value 'm' invalid for ROCKCHIP_DW_MIPI_DSI
arch/arm/configs/multi_v7_defconfig:599:warning: symbol value 'm' invalid for ROCKCHIP_INNO_HDMI

Introduced by commit

  8820b68bd378 ("drm/rockchip: Refactor the component match logic.")

-- 
Cheers,
Stephen Rothwell
