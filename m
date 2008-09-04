From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: dwmw2 tree build failure
Date: Thu, 04 Sep 2008 09:06:00 +0100
Message-ID: <1220515560.2985.140.camel@pmac.infradead.org>
References: <20080904105152.f82ed9e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:56666 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756518AbYIDIGF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Sep 2008 04:06:05 -0400
In-Reply-To: <20080904105152.f82ed9e5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thu, 2008-09-04 at 10:51 +1000, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next build (/scratch/sfr/x86_64_allmodconfig/Makefile) failed like this:
> 
> arch/x86/kernel/early-quirks.c: In function 'intel_g33_dmar':
> arch/x86/kernel/early-quirks.c:102: error: syntax error before '=' token
> arch/x86/kernel/early-quirks.c:104: error: 'status' undeclared (first use in this function)
> arch/x86/kernel/early-quirks.c:107: error: 'dmar_disabled' undeclared (first use in this function)
> 
> Introduced by commit 1bc3029e516e62baa14318888985075f3f3a9f7e ("Blacklist
> DMAR on Intel G31/G33 chipsets").  I have reverted that commit.
> 
> Please, at least build test this stuff. :-(

I did, but perhaps building with CONFIG_DMAR would have been more
appropriate. :)

Sorry about that -- having killed the machine I was testing this on, I
transplanted my tests to a new machine, and forgot the configs were
different.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
