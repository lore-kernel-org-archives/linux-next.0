From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
Date: Wed, 30 Aug 2017 15:19:30 +0200
Message-ID: <20170830131930.bvu6furm7dlhes3i@piout.net>
References: <20170830230712.55db7911@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:41181 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751733AbdH3NTc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Aug 2017 09:19:32 -0400
Content-Disposition: inline
In-Reply-To: <20170830230712.55db7911@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Rezvanov <dmitry.rezvanov@yandex.ru>

On 30/08/2017 at 23:07:12 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   1a9f9af07e80 ("ARM: dts: at91: at91sam9g45: add AC97")
> 
> is missing a Signed-off-by from its author.
> 

Oh crap, it was the only one not in linux-next... iThe original
submission had the SoB:
https://patchwork.kernel.org/patch/9794803/

Olof, how do you want to proceed?

> -- 
> Cheers,
> Stephen Rothwell

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
