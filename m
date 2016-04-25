From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the arm-soc tree
Date: Tue, 26 Apr 2016 09:43:31 +1000
Message-ID: <20160426094331.64032731@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38132 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752313AbcDYXne (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Apr 2016 19:43:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Hi all,

After merging the arm-soc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "of_flash_probe_versatile" [drivers/mtd/maps/physmap_of.ko] undefined!

Caused by commit

  b0afd44bc192 ("mtd: physmap_of: add a hook for Versatile write protection")

I used the arm-soc tree from next-20160422 for today.

-- 
Cheers,
Stephen Rothwell
