From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Tue, 26 Apr 2016 01:54:20 +0200
Message-ID: <8018210.3MZgHs9g7Q@wuerfel>
References: <20160426094331.64032731@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:60828 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456AbcDYXyw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Apr 2016 19:54:52 -0400
In-Reply-To: <20160426094331.64032731@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 26 April 2016 09:43:31 Stephen Rothwell wrote:
> Hi all,
> 
> After merging the arm-soc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "of_flash_probe_versatile" [drivers/mtd/maps/physmap_of.ko] undefined!
> 
> Caused by commit
> 
>   b0afd44bc192 ("mtd: physmap_of: add a hook for Versatile write protection")
> 
> I used the arm-soc tree from next-20160422 for today.
> 

Ah, sorry about that. I think I fixed it up just as you pulled it in.
If you don't mind, could you try pulling the tree once more on top
of what you have?

	Arnd
