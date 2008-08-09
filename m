From: David Howells <dhowells@redhat.com>
Subject: Re: next-20080808: bash: fork: Resource temporarily unavailable
Date: Sat, 09 Aug 2008 15:07:06 +0100
Message-ID: <15386.1218290826@redhat.com>
References: <1218287473.3155.13.camel@dhcppc0> <1218281190.3155.5.camel@dhcppc0> <1218214935.3146.5.camel@dhcppc0> <alpine.LRH.1.10.0808090747150.29079@tundra.namei.org> <14476.1218286327@redhat.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:42404 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752337AbYHIOHw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 9 Aug 2008 10:07:52 -0400
In-Reply-To: <1218287473.3155.13.camel@dhcppc0>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>

Thomas Meyer <thomas@m3y3r.de> wrote:

> Is that what you wanted to know? Doesn't look like a memory leak for me.

It wasn't really what I was after, but I agree, with only 24.4 MB allocated to
slabs, it doesn't look like a leak.

> kmem: invalid structure member offset: kmem_cache_objects
>       FILE: memory.c  LINE: 13500  FUNCTION: dump_kmem_cache_slub()

That smacks of the internal structs having changed more recently than F9's
kmem program.

I guess I need to get this thing running on an i386 box.

David
