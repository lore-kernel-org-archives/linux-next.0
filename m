From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pinctrl tree
Date: Fri, 30 Jun 2017 14:56:01 +1000
Message-ID: <20170630145601.441b4994@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38717 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751715AbdF3E4E (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jun 2017 00:56:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/pinctrl/pinctrl-rza1.c: In function 'rza1_pinctrl_probe':
drivers/pinctrl/pinctrl-rza1.c:1260:5: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
  if (ret)
     ^

Introduced by commit

  5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")

-- 
Cheers,
Stephen Rothwell
