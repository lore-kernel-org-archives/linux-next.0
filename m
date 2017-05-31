From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rtc tree
Date: Wed, 31 May 2017 14:33:49 +1000
Message-ID: <20170531143349.561d5e77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54955 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750779AbdEaEdx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 31 May 2017 00:33:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Lowe <dave-lowe@ntlworld.com>, Heiner Kallweit <hkallweit1@gmail.com>

Hi Alexandre,

After merging the rtc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/rtc/rtc-ds1307.c: In function 'ds1307_probe':
drivers/rtc/rtc-ds1307.c:1410:29: error: 'struct ds1307' has no member named 'client'
   if (chip->alarm && (ds1307->client->irq > 0 ||
                             ^

Caused by commit

  345b89453dda ("rtc: rtc-ds1307: enable support for mcp794xx as a wakeup source without IRQ")

interacting with commit

  11e5890b5342 ("rtc: ds1307: convert driver to regmap")

I have used the rtc tree from next-20170530 for today.

-- 
Cheers,
Stephen Rothwell
