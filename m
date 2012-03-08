From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the omap_dss2 tree
Date: Thu, 8 Mar 2012 16:16:12 +0000
Message-ID: <201203081616.12510.arnd@arndb.de>
References: <20120308170048.f1a992bca2ca2d93fa9747bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:62745 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756780Ab2CHQQX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Mar 2012 11:16:23 -0500
In-Reply-To: <20120308170048.f1a992bca2ca2d93fa9747bf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Tony Lindgren <tony@atomide.com>

On Thursday 08 March 2012, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-omap1/board-palmtt.c between commit ddba6c7f7ec6 ("OMAP1:
> pass LCD config with omapfb_set_lcd_config()") from the omap_dss2 tree
> and commit 2e3ee9f45b3c ("ARM: OMAP1: Move most of plat/io.h into local
> iomap.h") from the arm-soc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Hi Stephen,

Thanks for fixing up all the conflicts between arm-soc and omap_dss2.
I think we should make sure they are resolved in one of the trees before
the merge window.

Tomi, what are your plans for the omap_dss2 branch to get merged?
Do you think you should send it to Linus first and we merge it into
arm-soc to resolve the conflicts?
Or do you want to merge it through the arm-soc tree?
Or should we go first and you fix up the conflicts by pulling in the
necessary topic branches from arm-soc into your tree?

	Arnd
