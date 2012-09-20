From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the
 sound-asoc tree
Date: Thu, 20 Sep 2012 15:01:44 -0700
Message-ID: <20120920220143.GI28835@atomide.com>
References: <20120920160637.7f9065225982468c25fa1952@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-04-ewr.mailhop.org ([204.13.248.74]:31810 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752293Ab2ITWBx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Sep 2012 18:01:53 -0400
Content-Disposition: inline
In-Reply-To: <20120920160637.7f9065225982468c25fa1952@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>

* Stephen Rothwell <sfr@canb.auug.org.au> [120919 23:07]:
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got conflicts in
> sound/soc/omap/igep0020.c, sound/soc/omap/omap3beagle.c,
> sound/soc/omap/omap3evm.c and sound/soc/omap/overo.c between commit
> 152c6e56f6a8 ("ASoC: Remove obsolete OMAP3 machine drivers") from the
> sound-asoc tree and commit 2203747c9771 ("ARM: omap: move platform_data
> definitions") from the arm-soc tree.
> 
> The former removed the files, so I did that and can carry the fix as
> necessary (no action is required).

OK thanks again.

Tony
