From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: error importing i2c quilt series
Date: Tue, 26 Oct 2010 11:07:13 +0200
Message-ID: <20101026110713.09d894d5@endymion.delvare>
References: <20101025105900.83472a69.sfr@canb.auug.org.au>
	<20101025103404.73c24f45@endymion.delvare>
	<20101025195349.f5ac62eb.sfr@canb.auug.org.au>
	<20101025112519.5d932562@endymion.delvare>
	<20101025211327.9d40f4a1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:22153 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757926Ab0JZJHY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2010 05:07:24 -0400
In-Reply-To: <20101025211327.9d40f4a1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>

Hi Stephen,

On Mon, 25 Oct 2010 21:13:27 +1100, Stephen Rothwell wrote:
> Hi Jean,
> 
> On Mon, 25 Oct 2010 11:25:19 +0200 Jean Delvare <khali@linux-fr.org> wrote:
> >
> > I thought it was NEXT_BASE, with an underscore not dash?
> 
> Ah, yes, sorry ... (but my scripts actually handle either)
> 
> > And I also expected the trees to be merged in the order shows in:
> > http://git.kernel.org/?p=linux/kernel/git/sfr/linux-next.git;a=blob;f=Next/Trees;hb=HEAD
> > 
> > As pci is listed before i2c, I (wrongly) concluded that everything
> > would be fine even without using NEXT_BASE. I stand corrected.
> 
> What actually happens is
> 	I fetch all the trees and quilt series
> 	I import the quilt series to git branches
> 	I merge the trees.
> 
> So you cannot depend on the merge order (which sometimes changes as
> well).  This makes sense since I have no influence over the order that
> the trees get merged by Linus ... If there are dependencies, they need to
> be explicit, sorry, using NEXT_BASE in quilt series or merging (sub)
> trees for git.

OK, I take note. I seem to remember that last time I used NEXT_BASE, I
was told that I should only use it if I really had to as it made your
work more difficult and was normally not needed. Maybe I understood you
wrong back then, or maybe things changed meanwhile. Either way, I'll
make sure to use NEXT_BASE from now on each time this seems to be
needed.

-- 
Jean Delvare
