From: Tony Luck <tony.luck@gmail.com>
Subject: Re: linux-next: build failure in Linus' tree
Date: Tue, 1 Jun 2010 10:04:25 -0700
Message-ID: <AANLkTinSRHyxGFKRnIlfUGbnLqIpZWLtq7ipYFH25wGW@mail.gmail.com>
References: <20100528105719.a356ba4f.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.1005271807470.11382@i5.linux-foundation.org>
	<20100530104303.15864d35.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:43579 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751364Ab0FAREZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jun 2010 13:04:25 -0400
In-Reply-To: <20100530104303.15864d35.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jack Steiner <steiner@sgi.com>, Lee Schermerhorn <lee.schermerhorn@hp.com>

On Sat, May 29, 2010 at 5:43 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> So, is it reasonable for me to ask you to revert commit
> 0ac0c0d0f837c499afd02a802f9cf52d3027fa3b ("cpusets: randomize node ro=
tor
> used in cpuset_mem_spread_node()")? =A0Reverting it won't break ia64 =
(since
> their fix was to just add code that would then be unreferenced).

If that's the way you go - then just revert commit
4ec37de89d8c758ee8115e0e64b3f994910789ee
too. I only put that in to get the ia64 build working
when 0ac0c0d went upstream.

-Tony
