From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure in Linus' tree
Date: Tue, 1 Jun 2010 10:07:19 -0700 (PDT)
Message-ID: <alpine.LFD.2.00.1006011005550.3637@i5.linux-foundation.org>
References: <20100528105719.a356ba4f.sfr@canb.auug.org.au> <alpine.LFD.2.00.1005271807470.11382@i5.linux-foundation.org> <20100530104303.15864d35.sfr@canb.auug.org.au> <AANLkTinSRHyxGFKRnIlfUGbnLqIpZWLtq7ipYFH25wGW@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:52187 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751282Ab0FARLc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jun 2010 13:11:32 -0400
In-Reply-To: <AANLkTinSRHyxGFKRnIlfUGbnLqIpZWLtq7ipYFH25wGW@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Luck <tony.luck@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jack Steiner <steiner@sgi.com>, Lee Schermerhorn <lee.schermerhorn@hp.com>



On Tue, 1 Jun 2010, Tony Luck wrote:

> On Sat, May 29, 2010 at 5:43 PM, Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > So, is it reasonable for me to ask you to revert commit
> > 0ac0c0d0f837c499afd02a802f9cf52d3027fa3b ("cpusets: randomize node =
rotor
> > used in cpuset_mem_spread_node()")? =A0Reverting it won't break ia6=
4 (since
> > their fix was to just add code that would then be unreferenced).
>=20
> If that's the way you go - then just revert commit
> 4ec37de89d8c758ee8115e0e64b3f994910789ee
> too. I only put that in to get the ia64 build working
> when 0ac0c0d went upstream.

I did. See commit b3f2f6cd1ff935ecac9a5346904b899d7af689fe.

Although I left the non-__node_random parts, which seemed to be an=20
independent compile fix.=20

		Linus
