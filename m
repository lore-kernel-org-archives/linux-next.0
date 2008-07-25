From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: manual merge of the kbuild tree
Date: Fri, 25 Jul 2008 23:16:57 +0200
Message-ID: <20080725211657.GA5383@uranus.ravnborg.org>
References: <20080723135205.e7a4af7e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:46125 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751600AbYGZIRx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 26 Jul 2008 04:17:53 -0400
Content-Disposition: inline
In-Reply-To: <20080723135205.e7a4af7e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Mathieu Desnoyers <compudj@krystal.dyndns.org>, Alexey Dobriyan <adobriyan@gmail.com>

On Wed, Jul 23, 2008 at 01:52:05PM +1000, Stephen Rothwell wrote:
> Hi Sam,
> 
> Today's linux-next merge of the kbuild tree got a conflict in Makefile
> between commit d35cb360c29956510b2fe1a953bd4968536f7216 ("markers: fix
> duplicate modpost entry") from Linus' tree and commit
> c24009d75ac9fb5cb4510fbfe2cf1aaa98b20801 ("kbuild: make clean removes
> *.o.* as well") from the kbuild tree.
> 
> The clean target had overlapping additions.  I did the obvious fixup
> (which was the same as Andrew did for -mm).
I fixed it up and pushed a new tre - which I also asked to be
pulled by Linus.

	Sam
