From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the renesas tree with the arm-soc
 tree
Date: Mon, 6 Jan 2014 10:44:27 +0100
Message-ID: <52CA7AFB.9010208@atmel.com>
References: <20131216104738.6f845aabd0e3b609ed9ca170@canb.auug.org.au>	<52AECF56.8020508@atmel.com> <CAOesGMgi3COtsr+-9B3Tt350gwBs0Qm0AjatjLWCWTeUkAP5og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:9614 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752776AbaAFJoa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2014 04:44:30 -0500
In-Reply-To: <CAOesGMgi3COtsr+-9B3Tt350gwBs0Qm0AjatjLWCWTeUkAP5og@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Simon Horman <horms@verge.net.au>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Boris BREZILLON <b.brezillon@overkiz.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Mike Turquette <mturquette@linaro.org>

On 04/01/2014 06:11, Olof Johansson :
> On Mon, Dec 16, 2013 at 2:00 AM, Nicolas Ferre <nicolas.ferre@atmel.com> wrote:
>> On 16/12/2013 00:47, Stephen Rothwell :
>>> Hi Simon,
>>>
>>> Today's linux-next merge of the renesas tree got a conflict in
>>> drivers/clk/Makefile between commit 0ad6125b1579 ("clk: at91: add PMC
>>> base support") from the arm-soc tree and commit 10cdfe9f327a ("clk:
>>> shmobile: Add R-Car Gen2 clocks support") from the renesas tree.
>>>
>>> I fixed it up (see below) and can carry the fix as necessary (no action
>>> is required).
>>
>> Fine for me.
> 
> Simon, Nicolas,
> 
> <mini-rant>
> 
> While a very minor issue, this should have been altogether avoided
> with a little more attention when applying patches. The Makefile is
> sorted, and you've appended new lines to the end instead of in the
> place they're supposed to go. Sure, others have done the same mistake
> in a few places but that doesn't mean we shouldn't try to keep it
> sorted.
> 
> The very reason _to_ sort a Makefile is to avoid these needless
> add-add conflicts when two people append to the same unsorted list.
> 
> Now I can't resolve it properly and move the entries when I do the
> same merge (and get the same conflict), because that will cause a
> third conflict for Stephen, and he's about to return from vacation and
> is going to cuss at us if we cause too many new conflicts in one day.
> :)
> 
> </mini-rant>
> 
> So, best choice is to keep the unsortedness now, and have Mike resort
> his Makefile for us at the end of the merge window. And keep a little
> closer eye on Makefile and Kconfig additions in the future. :)

Totally agree in keeping a Makefile sorted, when it is already sorted.
What I recall having thought when I had seen this Makefile is: well this
one must be of the "append your changes to the end" type...

Anyway be sure that I will pay attention to this.

Bye,
-- 
Nicolas Ferre
