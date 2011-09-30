From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH -next] x86 mrst: fix build error when X86_MRST is not
 enabled
Date: Fri, 30 Sep 2011 10:04:04 +0100
Message-ID: <20110930100404.1a83ce65@lxorguk.ukuu.org.uk>
References: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au>
	<4E84D684.107@xenotime.net>
	<20110929235708.1bbd1166@lxorguk.ukuu.org.uk>
	<4E84FC4D.3080506@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:32876 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752001Ab1I3JGI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Sep 2011 05:06:08 -0400
In-Reply-To: <4E84FC4D.3080506@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

> arch/x86/platform/mrst/mrst.c -- where __mrst_cpu_chip lives --

In your tree yes

> is only built when CONFIG_X86_MRST is enabled.  You make it sound like
> __mrst_cpu_chip needs to live any time that CONFIG_X86_INTEL_MID
> is enabled, which sounds reasonable to me.
> 
> caveat:  given the current linux-next merge trees (as you mentioned).
> 
> Does anyone care?  If so, please help fix this muck.

It's already sorted, you are just seeing an out of order arrival of
patches to trees. I guess once kernel.org is back it'll all sort
