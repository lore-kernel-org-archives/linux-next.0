From: Linus Walleij <linus.walleij@linaro.org>
Subject: Next: please switch the GPIO tree to mine
Date: Thu, 5 Jul 2012 16:04:09 +0200
Message-ID: <CACRpkdb+5ATkMQrW4jBDUyWn2cSRnvyoFyGnFEJQJAO9XkdM2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:46022 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756506Ab2GEOEL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Jul 2012 10:04:11 -0400
Received: by qcro28 with SMTP id o28so4805233qcr.19
        for <linux-next@vger.kernel.org>; Thu, 05 Jul 2012 07:04:10 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>

Hi Stephen,

Grant asked me to take over the GPIO tree for a while.
(See: https://lkml.org/lkml/2012/7/1/220)

Can you please replace Grants tree:
gpio-current    git     git://git.secretlab.ca/git/linux-2.6#gpio/merge

With this one:
gpio git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#for-next

Until further notice.

I have a few patches for the rc:s there, as well as some stuff for the
next merge window, so would be really nice to get some rotation on
this.

Thanks!
Linus Walleij
