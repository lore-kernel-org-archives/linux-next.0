From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: cpufreq tree build failure
Date: Tue, 20 Jan 2009 00:30:22 -0500
Message-ID: <20090120053022.GB31797@redhat.com>
References: <20090120135059.6841cdc8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:46531 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750769AbZATFa0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Jan 2009 00:30:26 -0500
Content-Disposition: inline
In-Reply-To: <20090120135059.6841cdc8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, Jan 20, 2009 at 01:50:59PM +1100, Stephen Rothwell wrote:
 > Hi Dave,
 > 
 > Today's linux-next build (x86_64 allmodconfig) failed like this:
 > 
 > arch/x86/kernel/cpu/cpufreq/powernow-k8.c: In function 'powernow_k8_cpu_init_acpi':
 > arch/x86/kernel/cpu/cpufreq/powernow-k8.c:836: error: 'space_id' undeclared (first use in this function)
 > 
 > Immediate cause is commit 77a33c31a78c6cd11395c8b554152be684110e94
 > ("[CPUFREQ] checkpatch cleanups for powernow-k8") which clearly wasn't
 > build tested.

wtf, I dropped a hunk somehow.

 > I have dropped the cpufreq tree for today.
 
I regenerated the tree with the missing line.
Thanks for catching this.

	Dave

-- 
http://www.codemonkey.org.uk
