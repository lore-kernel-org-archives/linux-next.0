From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Feb 13 (runtime failures and 'non-zero
 nr_pmds' messages)
Date: Fri, 13 Feb 2015 10:54:28 -0800
Message-ID: <20150213185428.GA31193@roeck-us.net>
References: <20150213165615.1ad43047@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35200 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752441AbbBMSyg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Feb 2015 13:54:36 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YMLNr-003O6f-M5
	for linux-next@vger.kernel.org; Fri, 13 Feb 2015 18:54:35 +0000
Content-Disposition: inline
In-Reply-To: <20150213165615.1ad43047@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

On Fri, Feb 13, 2015 at 04:56:15PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material destined for v3.21 to your linux-next
> included trees until after v3.20-rc1 has been released.
> 
> Changes since 20150212:
> 
> The mips tree gained a conflict against Linus' tree.
> 
> Non-merge commits (relative to Linus' tree): 4418
>  4081 files changed, 183203 insertions(+), 92585 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
I see a number of runtime failures with this version.
It affects alpha, mips64, ppc64, and x86_64.
Symptom is always the same. There are lots of

BUG: non-zero nr_pmds on freeing mm: X (where X is 1..4)

messages in the log, and the affected VMs don't reboot.

I don't see the problem in curent mainline, nor in mmotm.
Bisect points to "Merge branch 'akpm-current/current'",
which isn't really helpful.

Not sure if this is a bad merge resolution, so just take this
as a heads-up for now.

Guenter
