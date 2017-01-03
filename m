From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pinctrl tree
Date: Tue, 3 Jan 2017 15:37:01 +1100
Message-ID: <20170103153701.79e58cab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33823 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755686AbdACEhF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Jan 2017 23:37:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>

Hi Linus,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/pinctrl/pinctrl-amd.c: In function 'amd_gpio_dbg_show':
drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
   for (; i < pin_num; i++) {
   ^
drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
  unsigned int bank, i, pin_num;
                     ^

Introduced by commit

  3bfd44306c65 ("pinctrl: amd: Add support for additional GPIO")

-- 
Cheers,
Stephen Rothwell
