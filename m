From: David Miller <davem@davemloft.net>
Subject: Re: next Feb 10: mm/slqb build break
Date: Wed, 11 Feb 2009 17:47:33 -0800 (PST)
Message-ID: <20090211.174733.163367216.davem@davemloft.net>
References: <49914EE7.7030205@in.ibm.com>
	<84144f020902100353x4074f342ne4d61483074a06b7@mail.gmail.com>
	<20090212014503.GD30043@wotan.suse.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:48072
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1758244AbZBLBrk (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Feb 2009 20:47:40 -0500
In-Reply-To: <20090212014503.GD30043@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: npiggin@suse.de
Cc: penberg@cs.helsinki.fi, sachinp@in.ibm.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

From: Nick Piggin <npiggin@suse.de>
Date: Thu, 12 Feb 2009 02:45:03 +0100

> On Tue, Feb 10, 2009 at 01:53:51PM +0200, Pekka Enberg wrote:
> > Actually, that's not the root cause here. You seem to have CONFIG_SMP
> > disabled but CONFIG_NUMA enabled. That's not possible on x86 which
> > makes me think it's a ppc kconfig bug. Hmm?
> 
> If it is really a valid config, then we should be able to make
> slqb build with it...

FWIW I only allow NUMA with SMP on sparc64, just like x86.

Although it seems IA64, like powerpc, does not have this restriction.
Hmmm...
