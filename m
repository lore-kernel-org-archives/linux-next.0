From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] m68knommu: ColdFire add support for kernel preemption
Date: Mon, 23 Jun 2008 10:42:04 -0700
Message-ID: <20080623104204.4e5bcea0.akpm@linux-foundation.org>
References: <200805010216.m412GT6t004096@goober>
	<20080501143336.552e39e1.akpm@linux-foundation.org>
	<481AC07A.6080707@snapgear.com>
	<20080502083755.GA13973@Chamillionaire.breakpoint.cc>
	<20080502052235.eb9c336a.akpm@linux-foundation.org>
	<485F3585.2080606@snapgear.com>
	<20080622225102.5117f22b.akpm@linux-foundation.org>
	<20080623175326.ddf5d2d4.sfr@canb.auug.org.au>
	<485FA3BC.5080807@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:41402 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754439AbYFWRmS (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 13:42:18 -0400
In-Reply-To: <485FA3BC.5080807@snapgear.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Ungerer <gerg@snapgear.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Mon, 23 Jun 2008 23:23:08 +1000 Greg Ungerer <gerg@snapgear.com> wrote:

> Do I need to send a request to Linus to pull this into his
> tree during the next merge window?

Yes, you do - nothing has changed in that regard.

>  Or will it migrate up
> from linux-next?

Nope, linux-next is a testing tree only.
