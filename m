From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the final tree (arm
	tree related)
Date: Tue, 3 Sep 2013 10:04:14 +0100
Message-ID: <20130903090414.GA25658@flint.arm.linux.org.uk>
References: <20130903181824.796e74465274b23387d3e715@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:51996 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932372Ab3ICJEg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2013 05:04:36 -0400
Content-Disposition: inline
In-Reply-To: <20130903181824.796e74465274b23387d3e715@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>

On Tue, Sep 03, 2013 at 06:18:24PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (arm defconfig)
> failed like this:
> 
> arch/arm/kernel/built-in.o: In function `setup_arch':
> io.c:(.init.text+0x594): undefined reference to `erratum_a15_798181_init'
> 
> Presumably caused by commit 34905a33184a ("ARM: 7804/2: Add check for
> Cortex-A15 errata 798181 ECO").  This build does not have CONFIG_SMP set.
> 
> I have reverted that commit for today.

Yep, and I think I'm going to do the same, rather than try and fix it.

-- 
Russell King
