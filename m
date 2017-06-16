From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: linux-next: bad commit in the mvebu tree
Date: Fri, 16 Jun 2017 08:59:13 +0200
Message-ID: <87tw3g5sfy.fsf@free-electrons.com>
References: <20170616055732.4114daed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:53150 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752441AbdFPG7P (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Jun 2017 02:59:15 -0400
In-Reply-To: <20170616055732.4114daed@canb.auug.org.au> (Stephen Rothwell's
        message of "Fri, 16 Jun 2017 05:57:32 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stephen,
 
 On jeu., juin 15 2017, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
>
> I noticed that commit
>
>   c6f4e66bd0f4 ("arm64: marvell: dts: add xmdio nodes for 7k/8k")
>
> has no Signed-off-by for its comitter.

Thanks for the warning, I fix it right now.

Gregory


>
> -- 
> Cheers,
> Stephen Rothwell

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
