From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Subject: linux-next: Tree for July 16 - Build failure
Date: Mon, 16 Jul 2012 10:29:10 -0300
Message-ID: <CAAAP30FQYPzScZiQqoYz3_Dv4+7sN+f1VBpbF=AeuwJsi-U5sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:62815 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751888Ab2GPN3L (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jul 2012 09:29:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org

Hi,

I am getting errors building lpc32xx defconfig on linux-next tree for
next-20120716 tag.

Here are the errors:
drivers/built-in.o: In function `of_clk_get':
drivers/clk/clkdev.c:42: undefined reference to `of_clk_get_from_provider'
make[1]: ** [vmlinux] Erro 1

Any suggestions?

Thanks.
