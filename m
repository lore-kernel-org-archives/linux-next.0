From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Mon, 16 Dec 2013 13:13:41 +0100
Message-ID: <1387196021.4280.7.camel@AMDC1943>
References: <20131216164721.79bfe996919a8ec3576867c7@canb.auug.org.au>
 <1387177714.4280.2.camel@AMDC1943> <20131216114510.GE3185@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35650 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753045Ab3LPMNp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Dec 2013 07:13:45 -0500
In-reply-to: <20131216114510.GE3185@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyungmin Park <kyungmin.park@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

Hi,

On Mon, 2013-12-16 at 11:45 +0000, Mark Brown wrote:
> On Mon, Dec 16, 2013 at 08:08:34AM +0100, Krzysztof Kozlowski wrote:
> 
> > I sent a fix for this already on last Wednesday but I forgot to put you
> > on as recipient.
> > http://thread.gmane.org/gmane.linux.kernel/1612360
> > Fix is needed also for clock driver and on Saturday Rashika Kheria
> > posted similar patch.
> 
> I've now applied your patch (which fixes both regulator and clocks, the
> separate patch isn't needed).  The big question I have is how this
> managed to get into Linus' tree - why didn't this show up in -next?

Thanks for applying the patch. The commit introducing error was picked
up by Andrew to MM tree and lately got merged to Linus' tree:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=8d2763770c34e8ed771f0be86760eb4485febc05

Best regards,
Krzysztof
