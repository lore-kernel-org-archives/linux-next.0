From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tty tree
Date: Mon, 6 Feb 2017 15:22:09 +1100
Message-ID: <20170206152209.0819e332@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40999 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750873AbdBFEWM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Feb 2017 23:22:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>

Hi Greg,

After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "of_device_uevent_modalias" [drivers/tty/serdev/serdev.ko] undefined!
ERROR: "of_device_get_modalias" [drivers/tty/serdev/serdev.ko] undefined!

Caused by commit

  cd6484e1830b ("serdev: Introduce new bus for serial attached devices")

I have used the tty tree from next-20170203 for today.

-- 
Cheers,
Stephen Rothwell
