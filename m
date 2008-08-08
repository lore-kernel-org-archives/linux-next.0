From: David Howells <dhowells@redhat.com>
Subject: Re: next-20080808: bash: fork: Resource temporarily unavailable
Date: Sat, 09 Aug 2008 00:23:58 +0100
Message-ID: <16319.1218237838@redhat.com>
References: <alpine.LRH.1.10.0808090847530.29741@tundra.namei.org> <20080808172141.GY14495@cs181140183.pp.htv.fi> <1218214935.3146.5.camel@dhcppc0> <17923.1218234735@redhat.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:41975 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752904AbYHHXZH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 19:25:07 -0400
In-Reply-To: <alpine.LRH.1.10.0808090847530.29741@tundra.namei.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: dhowells@redhat.com, Thomas Meyer <thomas@m3y3r.de>, Adrian Bunk <bunk@kernel.org>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>

James Morris <jmorris@namei.org> wrote:

> > I can, but I'll need a config file as it boots fine for me and passes the
> > LTP testsuites I've run on it.
> 
> Is this with linux-next or my tree?

It was actually with your tree, but I've just tested current linux-next and
that passes the LTP SELinux and syscalls testscripts too, give or take the
things that weren't passing anyway, even before my patches.

David
