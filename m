From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the crypto tree with Linus' tree
Date: Mon, 7 May 2012 08:09:21 +0000
Message-ID: <201205070809.21709.arnd@arndb.de>
References: <20120507121137.bdfc96ed31649040506d9c75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:58451 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755497Ab2EGI5X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 May 2012 04:57:23 -0400
In-Reply-To: <20120507121137.bdfc96ed31649040506d9c75@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Westin <andreas.westin@stericsson.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>

On Monday 07 May 2012, Stephen Rothwell wrote:
> + static void __init u8500_cryp1_hash1_init(void)
> + {
> +       db8500_add_cryp1(&u8500_cryp1_platform_data);
> +       db8500_add_hash1(&u8500_hash1_platform_data);
> + }

This is actually not correct any more because of the
other changes: each device addition should also pass the parent
pointer so the device is created in the right position.

Stephen, your fix is ok for linux-next and I expect everything
to still work, but we should not merge it into v3.5 this way.

Thanks for the fixup.

	Arnd
