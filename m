From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for September 4
Date: Thu, 4 Sep 2008 12:52:48 +0100
Message-ID: <20080904125248.117e7cf9@lxorguk.ukuu.org.uk>
References: <20080904193606.573f2cb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:53001 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751922AbYIDLxm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Sep 2008 07:53:42 -0400
In-Reply-To: <20080904193606.573f2cb3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

> I have reverted the ttydev tree for today at Andrew's request since it is
> causing him a problem.

I've pushed a "mini" ttydev tree with just the fixes and earlier patches
in for the moment while I nail this one down. That way the stuff which
is independent can still be tested and get to Linus even if the big tty
rework has to be delayed.
