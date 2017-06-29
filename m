From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rtc tree
Date: Thu, 29 Jun 2017 15:42:07 +1000
Message-ID: <20170629154207.21587306@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40393 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751638AbdF2FmK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jun 2017 01:42:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Markus Mayer <mmayer@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>

Hi Alexandre,

After merging the rtc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/rtc/rtc-brcmstb-waketimer.c: In function 'brcmstb_waketmr_settime':
drivers/rtc/rtc-brcmstb-waketimer.c:142:6: warning: unused variable 'ret' [-Wunused-variable]
  int ret;
      ^

Introduced by commit

  9f4ad359c801 ("rtc: brcmstb-waketimer: Add Broadcom STB wake-timer")

-- 
Cheers,
Stephen Rothwell
