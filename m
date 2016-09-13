From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the gpio tree
Date: Tue, 13 Sep 2016 13:18:18 +1000
Message-ID: <20160913131818.3d7bf391@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38936 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752999AbcIMDSV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Sep 2016 23:18:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Alistair Popple <alistair@popple.id.au>, Jeremy Kerr <jk@ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-aspeed.o

Introduced by commit

  361b79119a4b ("gpio: Add Aspeed driver")

-- 
Cheers,
Stephen Rothwell
