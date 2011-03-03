From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for February 10 (netfilter)
Date: Thu, 3 Mar 2011 13:54:14 -0800
Message-ID: <20110303135414.bfcabb2a.randy.dunlap@oracle.com>
References: <20110210180525.54ec83e9.sfr@canb.auug.org.au>
	<20110210095210.6fcf3011.randy.dunlap@oracle.com>
	<4D58DB20.5060401@trash.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:56591 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758800Ab1CCWc7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Mar 2011 17:32:59 -0500
In-Reply-To: <4D58DB20.5060401@trash.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Patrick McHardy <kaber@trash.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, netdev <netdev@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org, Thomas Graf <tgraf@suug.ch>

On Mon, 14 Feb 2011 08:34:56 +0100 Patrick McHardy wrote:

> On 10.02.2011 18:52, Randy Dunlap wrote:
> > On Thu, 10 Feb 2011 18:05:25 +1100 Stephen Rothwell wrote:
> > 
> >> Hi all,
> >>
> >> [The kernel.org mirroring is being slow ...]
> >>
> >> Changes since 20110209:
> > 
> > 
> > xt_AUDIT.c:(.text+0x39ca9): undefined reference to `ipv6_skip_exthdr'
> > 
> > IPV6 is not enabled.
> > 
> > Full config file is attached.
> 
> Thomas, please have a look at this.


Ping.
This build error is still with us in linux-next 2011.0303...


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
