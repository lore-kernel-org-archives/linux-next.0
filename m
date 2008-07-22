From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] serial: fix struct uart_info change fallout
Date: Tue, 22 Jul 2008 02:58:50 +0100
Message-ID: <20080722025850.0d073a5e@lxorguk.ukuu.org.uk>
References: <20080722102520.ca801ab5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:46993 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754169AbYGVCQq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Jul 2008 22:16:46 -0400
In-Reply-To: <20080722102520.ca801ab5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ppc-dev <linuxppc-dev@ozlabs.org>

On Tue, 22 Jul 2008 10:25:20 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus, Alan,
> 
> Today's linux-next (actually just Linus' tree) build (powerpc
> ppc64_defconfig) failed like this:

Yes I know.

I've been trying to get the other patches merged but each of the five
pulls of Linus tree I have done has broken the tty patch merges *AGAIN*
so I still don't have them tested and ready to merge despite it being 3AM.

So much for the linux-next tree. Please give it until tomorrow or you are
just going to break the tree again and mean I have to run another set of
tests and regressions.

Alan
