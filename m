From: Tony Prisk <linux@prisktech.co.nz>
Subject: Re: linux-next: manual merge of the arm-soc tree with the gpio-lw
 tree
Date: Tue, 09 Apr 2013 21:04:50 +1200
Message-ID: <5163D9B2.9060603@prisktech.co.nz>
References: <20130409174747.873a9c9cad1cd6a4dbe4014f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from server.prisktech.co.nz ([115.188.14.127]:62148 "EHLO
	server.prisktech.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934875Ab3DIJEs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Apr 2013 05:04:48 -0400
In-Reply-To: <20130409174747.873a9c9cad1cd6a4dbe4014f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

On 09/04/13 19:47, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/gpio/gpio-vt8500.c between commit 808c513ee64b ("gpio/vt8500:
> Convert to devm_ioremap_resource()") from the gpio-lw tree and commit
> dc1010860b03 ("gpio: vt8500: Remove arch-vt8500 gpio driver") from the
> arm-soc tree.
>
> The latter removed the file, so I did that and can carry the fix as
> necessary (no action is required).
>
That's the correct solution

Regards
Tony P
