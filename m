From: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: linux-next: manual merge of the battery tree
Date: Tue, 8 Jul 2008 22:57:21 +0400
Message-ID: <20080708185721.GA11166@polina.dev.rtsoft.ru>
References: <20080708161317.20591f4d.sfr@canb.auug.org.au>
Reply-To: avorontsov@ru.mvista.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rtsoft3.corbina.net ([85.21.88.6]:1096 "EHLO
	buildserver.ru.mvista.com" rhost-flags-OK-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751337AbYGHS5X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Jul 2008 14:57:23 -0400
Content-Disposition: inline
In-Reply-To: <20080708161317.20591f4d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, =?utf8?B?Ik1hcmVrIFZhxaF1dCI=?= <marek.vasut@gmail.com>, Russell King <rmk@arm.linux.org.uk>, Dmitry Baryshkov <dbaryshkov@gmail.com>

On Tue, Jul 08, 2008 at 04:13:17PM +1000, Stephen Rothwell wrote:
> Hi Anton,
> 
> Today's linux-next merge of the battery tree got trivial conflicts in
> drivers/power/Makefile and drivers/power/Kconfig between commit
> 7bd66c73ec75711cec7446c6f6822494c1afd951 ("[ARM] 5155/1: PalmTX battery
> monitor") from the arm tree and commit
> fece418418f51e92dd7e67e17c5e3fe5a28d3279 ("power_supply: Sharp SL-6000
> (tosa) batteries support") from the battery tree.

Stephen, much thanks for the notice.


Russell, what should we do? I can either:

1. pick up the driver that ought to be applied through the battery-2.6.git,
   thus you can drop it from the arm tree.

2. or, we leave the conflict as is. Then, when the merge window opens,
   you'll push the arm tree to Linus, then I'll pull from Linus' tree
   [will fix the conflict meanwhile] and then I'll ask Linus to pull
   the fixed battery-2.6.git.

I don't have any preference, so I'll do whatever you prefer.

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
