From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the thermal-soc tree
Date: Thu, 5 Nov 2015 16:01:13 +1100
Message-ID: <20151105160113.5d6f73f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40954 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750981AbbKEFBQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Nov 2015 00:01:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eduardo Valentin <edubezval@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Caesar Wang <wxt@rock-chips.com>

Hi Eduardo,

After merging the thermal-soc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/thermal/rockchip_thermal.c: In function 'rockchip_thermal_suspend':
drivers/thermal/rockchip_thermal.c:641:2: error: implicit declaration of function 'pinctrl_pm_select_sleep_state' [-Werror=implicit-function-declaration]
  pinctrl_pm_select_sleep_state(dev);
  ^
drivers/thermal/rockchip_thermal.c: In function 'rockchip_thermal_resume':
drivers/thermal/rockchip_thermal.c:679:2: error: implicit declaration of function 'pinctrl_pm_select_default_state' [-Werror=implicit-function-declaration]
  pinctrl_pm_select_default_state(dev);
  ^

Caused by commit

  7e38a5b1daa1 ("thermal: rockchip: support the sleep pinctrl state to avoid glitches")

Probably just a missing include file.

I have reverted that commit for today.



-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
