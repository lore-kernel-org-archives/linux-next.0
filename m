From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the akpm tree with the arm-soc tree
Date: Tue, 12 Mar 2013 12:48:24 +0000
Message-ID: <201303121248.24736.arnd@arndb.de>
References: <20130312144714.39749c5b0bd1aea14c4d2ff8@canb.auug.org.au> <CAOesGMgSzn+uCVEMKZgtorcNkdzzvntmnfoej5vN-AjF43pnyQ@mail.gmail.com> <20130312115339.GF12700@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:64584 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754785Ab3CLMss convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Mar 2013 08:48:48 -0400
In-Reply-To: <20130312115339.GF12700@titan.lakedaemon.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: Olof Johansson <olof@lixom.net>, Andrew Lunn <andrew@lunn.ch>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, linux-arm-kernel@lists.infradead.org

On Tuesday 12 March 2013, Jason Cooper wrote:
> I chose to keep them together to maintain bisectability.  Either you
> have all of the fix (you landed on this branch), or you don't.  Was this
> the correct decision in this case, or did I miss something?

I think you don't need to worry about bisection in this case, especially
as you mentioned that 3.8 is already broken.

>From all I can tell, these are four separate fixes, and you want to have
all of them get merged, but applying just one of them will not make the
state of the kernel tree any worse than what it is before the patches.

	Arnd
