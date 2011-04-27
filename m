From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: build warning after merge of the cpufreq tree
Date: Tue, 26 Apr 2011 21:32:17 -0400
Message-ID: <20110427013217.GA30804@redhat.com>
References: <20110427111024.eb26b6f5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51670 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755066Ab1D0Bc0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2011 21:32:26 -0400
Content-Disposition: inline
In-Reply-To: <20110427111024.eb26b6f5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 27, 2011 at 11:10:24AM +1000, Stephen Rothwell wrote:
 > Hi Dave,
 > 
 > After merging the cpufreq tree, today's linux-next build (powerpc
 > ppc64_defconfig) produced this warning:
 > 
 > drivers/cpufreq/Kconfig:67:warning: choice value used outside its choice group
 > drivers/cpufreq/Kconfig:75:warning: choice value used outside its choice group
 > drivers/cpufreq/Kconfig:84:warning: choice value used outside its choice group
 > drivers/cpufreq/Kconfig:93:warning: choice value used outside its choice group
 > drivers/cpufreq/Kconfig:105:warning: choice value used outside its choice group
 > 
 > I am not sure what has caused this.  The only change in the cpufreq tree
 > to that file is commit e002ba3328a2 ("[CPUFREQ] Move x86 cpufreq drivers
 > to drivers/cpufreq/") which rearranged a few things but nothing obvious.

As the commit message suggests, per-arch cpufreq drivers are moving to drivers/cpufreq/
So far, I've only moved the x86 ones.  As a side-effect of this, the 
source "drivers/cpufreq/Kconfig" is no longer a per-arch thing, as it now gets
included from kernel/power/Kconfig.

I suspect the warnings are happening because on the unconverted archs, drivers/cpufreq/Kconfig
is now getting included twice.  If you kill the 'source' line in kernel/power/Kconfig,
does this make things go back to normal ?  (Check that cpufreq still shows up in
the resulting config afterwards)

If so, I'll make that change after all archs have moved their drivers.

	Dave
