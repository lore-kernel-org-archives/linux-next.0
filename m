From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the arm-current tree
Date: Fri, 10 Apr 2015 08:28:31 +0100
Message-ID: <20150410072830.GA12732@n2100.arm.linux.org.uk>
References: <20150410102933.0a79020d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:47798 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754044AbbDJH2k (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2015 03:28:40 -0400
Content-Disposition: inline
In-Reply-To: <20150410102933.0a79020d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>

On Fri, Apr 10, 2015 at 10:29:33AM +1000, Stephen Rothwell wrote:
> Hi Russell,
> 
> After merging the arm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arch/arm/mm/proc-v7.S: Assembler messages:
> arch/arm/mm/proc-v7.S:535: Error: invalid operands (*ABS* and .text sections) for `|'
> arch/arm/mm/proc-v7.S:535: Error: invalid operands (*ABS* and .text sections) for `|'
> 
> Caused by commit f2fd12256533 ("ARM: proc-v7: avoid errata 430973
> workaround for non-Cortex A8 CPUs").
> 
> I have reverted that commit for today.

The ARM autobuilders built the tree I pushed out with no problems.  The
commit itself isn't quite correct, but the merge head of the for-next
branch /is/ correct.  I've now fixed that, but I don't see why you would
have hit this.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
