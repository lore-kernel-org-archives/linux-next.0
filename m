From: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH 00/12] Thumb-2 kernel support
Date: Mon, 11 Aug 2008 22:17:43 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0808112129030.22892@xanadu.home>
References: <20080606173300.7930.31525.stgit@pc1117.cambridge.arm.com>
 <20080630125110.1dc5689a.akpm@linux-foundation.org>
 <1214901131.29199.31.camel@pc1117.cambridge.arm.com>
 <20080701014529.272706d8.akpm@linux-foundation.org>
 <1216829155.23395.19.camel@pc1117.cambridge.arm.com>
 <20080723130140.ff016944.akpm@linux-foundation.org>
 <1216847422.6550.8.camel@localhost.localdomain>
 <20080723151045.bcae107e.akpm@linux-foundation.org>
 <20080727110804.GE32366@flint.arm.linux.org.uk>
 <1217245511.20282.121.camel@pc1117.cambridge.arm.com>
 <20080728125039.GK32366@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:22972 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466AbYHLCRt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Aug 2008 22:17:49 -0400
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR004.ip.videotron.ca
 (Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007; 32bit))
 with ESMTP id <0K5G00DSPUDJSRH0@VL-MO-MR004.ip.videotron.ca> for
 linux-next@vger.kernel.org; Mon, 11 Aug 2008 22:17:43 -0400 (EDT)
In-reply-to: <20080728125039.GK32366@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

On Mon, 28 Jul 2008, Russell King - ARM Linux wrote:

> On Mon, Jul 28, 2008 at 12:45:11PM +0100, Catalin Marinas wrote:
> > ???I would really like some clear statement from you to know where 
> > to focus my attention (clean up the current patches even more or 
> > create separate arch/arm-t2). AFAICT, you don't really like these 
> > patches merged, in which case I'd have to focus on the second 
> > option.
> 
> I've put my point of view forward in the responses to the patches.
> I'm not sure what "clear statement" you're really after.

For what my personal opinion is worth, simply considering a arch/arm-t2 
solution should be completely out of the question.  T2 support is 
possibly not too far from being somewhat tolerable given your latest 
patch series plus all suggestions to improve it further.

So my biggest issue with this whole T2 unified assembly 
crap^H^H^H^Hsyntax has to do with the fact that it is apparently too 
late to change it.  One of the best assets for the ARM architecture IMHO 
was its really neat assembly syntax and now it feels like ARM just 
screwed it.

IMHO again, this was a big mistake from ARM Ltd not to consult people 
from the Open Source community who do write ARM assembly code when this 
unified syntax was elaborated.  for one I certainly wasn't consulted at 
all. That could have provided ARM Ltd with inputs from folks whose first 
concern is long term code maintainability.  Sure, many ARM Ltd partners 
just don't have such concern as they usually do write-once-and-forget 
assembly code and they're probably just happy with the current T2 
syntax, or they simply don't care.  This is not my case.

In other words, and IMHO again, this whole new combined syntax just 
sucks.  That is my personal statement and I don't know how to make it 
more clear.  Now, since we're stuck with it for the foreseeable future, 
let's find a way to best accommodate it which does NOT include a 
separate architecture tree.


Nicolas
