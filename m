From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the i2c tree
Date: Tue, 25 Aug 2015 10:51:02 +1000
Message-ID: <20150825105102.742ff687@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37951 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751352AbbHYAvI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Aug 2015 20:51:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vignesh R <vigneshr@ti.com>

Hi Wolfram,

After merging the i2c tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "of_irq_get_byname" [drivers/i2c/i2c-core.ko] undefined!

Caused by commit

  efb6a10b761e ("i2c: allow specifying separate wakeup interrupt in device tree")

I have used the i2c tree from next-20150824 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
