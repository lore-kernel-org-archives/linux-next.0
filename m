From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the l2-mtd tree
Date: Wed, 30 Sep 2015 15:16:33 +1000
Message-ID: <20150930151633.1577eea1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55040 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751351AbbI3FQh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Sep 2015 01:16:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>

Hi Brian,

After merging the l2-mtd tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/mtd/nand/vf610_nfc.c: In function 'vf610_nfc_resume':
drivers/mtd/nand/vf610_nfc.c:859:2: error: implicit declaration of function 'pinctrl_pm_select_default_state' [-Werror=implicit-function-declaration]
  pinctrl_pm_select_default_state(dev);
  ^

Caused by commit

  456930d80a2d ("mtd: nand: vf610_nfc: Freescale NFC for VF610, MPC5125 and others")

I have reverted that commit (and the following one) for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
