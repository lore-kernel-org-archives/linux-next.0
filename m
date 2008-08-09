From: David Howells <dhowells@redhat.com>
Subject: Re: next-20080808: bash: fork: Resource temporarily unavailable
Date: Sat, 09 Aug 2008 13:52:07 +0100
Message-ID: <14476.1218286327@redhat.com>
References: <1218281190.3155.5.camel@dhcppc0> <1218214935.3146.5.camel@dhcppc0> <alpine.LRH.1.10.0808090747150.29079@tundra.namei.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:53761 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750811AbYHIMxQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 9 Aug 2008 08:53:16 -0400
In-Reply-To: <1218281190.3155.5.camel@dhcppc0>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>

Thomas Meyer <thomas@m3y3r.de> wrote:

> > > Beginning with next-20080808 after letting the system run for 5 minutes
> > > or so, I get an error from the fork call, e.g.:
> > > 
> > > "bash: fork: Resource temporarily unavailable"

I modified your config slightly so that it'd run on my testbox (x86_64
unfortunately), but that survived LTP and seemed to work okay.  I'll have to
snag an i386 installation from somewhere, unless James can do me a favour and
test it on his, if he has one.

Can you try this please:

	cat /proc/slabinfo  | cut -d: -f1 | sort -k 2 -n

Just to check to see if there's a memory leak.

Interestingly, I notice that SLUB's /proc/slabinfo appears to be broken.  It's
missing a number of slab caches from the list.

David
