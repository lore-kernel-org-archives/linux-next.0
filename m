From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rtc tree
Date: Thu, 6 Jul 2017 14:24:07 +1000
Message-ID: <20170706142407.71e3b513@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47987 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750977AbdGFEYK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Jul 2017 00:24:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>

Hi Alexandre,

After merging the rtc tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/rtc/rtc-ds1307.c: In function 'ds1307_get_time':
drivers/rtc/rtc-ds1307.c:342:26: warning: unused variable 'chip' [-Wunused-variable]
  const struct chip_desc *chip = &chips[ds1307->type];
                          ^

Introduced by commit

  436c93db60a4 ("rtc: ds1307: factor out century bit handling")

-- 
Cheers,
Stephen Rothwell
