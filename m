From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: revert of "debug: add notifier chain debugging"
Date: Tue, 02 Sep 2008 18:57:01 +0100
Message-ID: <1220378221.2982.234.camel@pmac.infradead.org>
References: <20080901182619.cb799b52.sfr@canb.auug.org.au>
	 <48BBFAFE.7030808@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:57955 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751307AbYIBR5U (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Sep 2008 13:57:20 -0400
In-Reply-To: <48BBFAFE.7030808@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>

On Mon, 2008-09-01 at 07:23 -0700, Arjan van de Ven wrote:
> 
> well it's a pretty bad bug since there are many places that depend on
> the kernel text stuff to work.
> (backtracing, lockdep, some of the security checks etc). PPC needs to
> be fixed rather urgently.
> but yeah the system kept plodding on.
> David also sent a patch to fix it fwiw.

My patch broke allyesconfig though -- we need .text and .fixup to be
close together, otherwise the branches back from fixup sections are too
long to fit in a relative jump.

Because TEXT_TEXT doesn't include .fixup, 
 there was a _reason_ for not using TEXT_TEXT, and it's to ensure that
the branches back to .text sections within the .fixup code are short
enough. If they're too far away, then the final link fails.

It might be sufficient to put the .fixup section immediately
_before_ .text rather than a long way after it as my patch did.

> I'm a bit sad to see a debug patch get reverted just because it caught
> bugs ;-)
> at least I assume this is very temporary.

Yeah, I'm sure it will be.
http://moss.amr.ith.intel.com/sites/Purchasing/CPC/EMEA_ApplyUpdateCard/EMEA_Apply_Update_Card.aspx
-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
