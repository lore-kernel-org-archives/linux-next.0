From: James Morris <jmorris@namei.org>
Subject: Re: next-20080808: bash: fork: Resource temporarily unavailable
Date: Sat, 9 Aug 2008 08:48:39 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0808090847530.29741@tundra.namei.org>
References: <20080808172141.GY14495@cs181140183.pp.htv.fi> <1218214935.3146.5.camel@dhcppc0> <17923.1218234735@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:51096 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752258AbYHHWyw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 18:54:52 -0400
In-Reply-To: <17923.1218234735@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Thomas Meyer <thomas@m3y3r.de>, Adrian Bunk <bunk@kernel.org>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>

On Fri, 8 Aug 2008, David Howells wrote:

> 
> Adrian Bunk <bunk@kernel.org> wrote:
> 
> > The only commits that touched kernel/fork.c between next-20080807 and 
> > next-20080808 are David's CRED patches.
> > 
> > David, can you look at this?
> 
> I can, but I'll need a config file as it boots fine for me and passes the LTP
> testsuites I've run on it.

Is this with linux-next or my tree?

(I'm currently building next-20080808 & will do some testing).


-- 
James Morris
<jmorris@namei.org>
