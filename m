From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (ux500-core tree related)
Date: Thu, 2 Jun 2011 18:25:06 +0200
Message-ID: <BANLkTikm=bBM=E5LtCxOg29U-nwniqx0WQ@mail.gmail.com>
References: <20110602115045.41815756.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:58303 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752316Ab1FBQZH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Jun 2011 12:25:07 -0400
In-Reply-To: <20110602115045.41815756.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rickard Evertsson <rickard.evertsson@stericsson.com>, Daniel Willerud <daniel.willerud@stericsson.com>, Deepak Karda <deepak.karda@stericsson.com>, Bengt Jonsson <bengt.g.jonsson@stericsson.com>

2011/6/2 Stephen Rothwell <sfr@canb.auug.org.au>:

> After merging the final tree, next-20110601 build (arm u8500_defconfig)
> failed like this:

Oh crap, I thought that patch was independent but it wasn't. I'll
take it out.

Thanks for noticing this Stephen,
Linus Walleij
