From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the crypto
 tree
Date: Mon, 14 Jan 2013 09:22:22 -0800
Message-ID: <20130114172221.GU14149@atomide.com>
References: <20130114134908.094003722be0612c20574338@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-04-ewr.mailhop.org ([204.13.248.74]:19841 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756023Ab3ANRWa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Jan 2013 12:22:30 -0500
Content-Disposition: inline
In-Reply-To: <20130114134908.094003722be0612c20574338@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Mark A. Greer" <mgreer@animalcreek.com>, Herbert Xu <herbert@gondor.apana.org.au>

* Stephen Rothwell <sfr@canb.auug.org.au> [130113 18:52]:
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/crypto/omap-sham.c between commit dfd061d5a8f5 ("crypto:
> omap-sham - Add code to use dmaengine API") from the crypto tree and
> commit a62a6e98c370 ("ARM: OMAP2+: Disable code that currently does not
> work with multiplaform") from the arm-soc tree.
> 
> I fixed it up (the former removed the include that the latter protected)
> and can carry the fix as necessary (no action is required).

Thanks, yes the crypto tree changes fixed up things so the changes
coming from arm-soc tree are not needed any longer.

Regards,

Tony
