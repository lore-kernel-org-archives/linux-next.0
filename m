From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the arm tree
Date: Mon, 7 Jul 2008 10:12:43 +0100
Message-ID: <20080707091243.GA1842@flint.arm.linux.org.uk>
References: <20080704165712.3d941be3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:57676 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751819AbYGGJNJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jul 2008 05:13:09 -0400
Content-Disposition: inline
In-Reply-To: <20080704165712.3d941be3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Greg KH <greg@kroah.com>

On Fri, Jul 04, 2008 at 04:57:12PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the arm tree got a conflict in
> arch/arm/kernel/time.c between commit
> 5b01a6a61c48d8e6ab4679d6e6208f5962d07b85 ("sysdev: Pass the attribute to
> the low level sysdev show/store function") from the driver-core tree and
> commit 205bee6ad804d7034773b5978c74dde495df2301 ("[ARM] dyntick: Remove
> obsolete and unused ARM dyntick support") from the arm tree.
> 
> The arm commit just removed some code that the driver-core commit
> modified.  So I removed it and can carry the fixup.

I think that's a merge issue which Linus is also going to have to deal
with when it happens, since there's no real solution to committing
"fixes" to our trees without the fix causing the tree in isolation to
break.

Note that the commit is not a new commit, but something that's been there
since the last merge window - it has, however, recently been rebased.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
