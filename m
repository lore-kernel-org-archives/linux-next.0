From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net-current build failure
Date: Mon, 23 Feb 2009 16:39:27 -0800 (PST)
Message-ID: <20090223.163927.102185068.davem@davemloft.net>
References: <20090224112659.b65e9416.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:51287
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1758956AbZBXAjq (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Feb 2009 19:39:46 -0500
In-Reply-To: <20090224112659.b65e9416.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, daniel.lezcano@free.fr

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 24 Feb 2009 11:26:59 +1100

> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> net/core/net_namespace.c: In function 'net_ns_init':
> net/core/net_namespace.c:223: error: implicit declaration of function 'net_alloc_generic'
> net/core/net_namespace.c:223: warning: assignment makes pointer from integer without a cast
> 
> Caused by commit 486a87f1e5624096bd1c09e9e716239597d48dca ("netns: fix
> double free at netns creation") which I have reverted for today.

I've commited a fix for this, thanks.
