From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: manual merge of the m68knommu tree with Linus' treee
Date: Tue, 20 Jan 2009 08:06:09 +0100
Message-ID: <20090120070609.GA16511@uranus.ravnborg.org>
References: <20090120105551.a01eb74f.sfr@canb.auug.org.au> <497519A8.3020706@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:40990 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753772AbZATHE0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Jan 2009 02:04:26 -0500
Content-Disposition: inline
In-Reply-To: <497519A8.3020706@snapgear.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Ungerer <gerg@snapgear.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>

On Tue, Jan 20, 2009 at 10:24:08AM +1000, Greg Ungerer wrote:
> Hi Stephen,
> 
> Stephen Rothwell wrote:
> >Today's linux-next merge of the m68knommu tree got a conflict in
> >arch/m68knommu/include/asm/Kbuild between commit
> >74d96f018673759d04d032c137d132f6447bfb1e ("byteorder: make swab.h include
> >asm/swab.h like a regular header") from Linus' tree and commit
> >49148020bcb6910ce71417bd990a5ce7017f9bd3 ("m68k,m68knommu: merge header
> >files") from the m68knommu tree.
> >
> >The latter removed the file and the former removed a line from it.  So I
> >just removed the file.  I can keep doing that or you could do a merge
> >with Linus' tree.
> 
> The current thinking was to merge this with Linus' tree as quick
> as possible. But at the very least that will have to wait till he
> gets back from LCA.

Just try to push it to Linus. He may very well take it depite
having fun at LCA.
It is:
 - only touching m68k and m68knommu
 - he is usual quick to take the header move patches
 - it removes more lines than it add (IIRC)

	Sam
