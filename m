From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: build warning after merge of the cpufreq tree
Date: Fri, 29 Apr 2011 16:12:42 -0400
Message-ID: <20110429201241.GA12256@redhat.com>
References: <20110427111024.eb26b6f5.sfr@canb.auug.org.au>
 <20110427013217.GA30804@redhat.com>
 <20110427115427.f5a4fac7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51311 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756786Ab1D2UMs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Apr 2011 16:12:48 -0400
Content-Disposition: inline
In-Reply-To: <20110427115427.f5a4fac7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 27, 2011 at 11:54:27AM +1000, Stephen Rothwell wrote:
 > Hi Dave,
 > 
 > On Tue, 26 Apr 2011 21:32:17 -0400 Dave Jones <davej@redhat.com> wrote:
 > >
 > > As the commit message suggests, per-arch cpufreq drivers are moving to drivers/cpufreq/
 > > So far, I've only moved the x86 ones.  As a side-effect of this, the 
 > > source "drivers/cpufreq/Kconfig" is no longer a per-arch thing, as it now gets
 > > included from kernel/power/Kconfig.
 > > 
 > > I suspect the warnings are happening because on the unconverted archs, drivers/cpufreq/Kconfig
 > > is now getting included twice.  If you kill the 'source' line in kernel/power/Kconfig,
 > > does this make things go back to normal ?  (Check that cpufreq still shows up in
 > > the resulting config afterwards)
 > 
 > Removing the source line in kernel/power/Kconfig makes the warnings go
 > away and the only change in the generated config file is this:

I've moved this work onto a separate move-drivers branch. Could you track that in next too please?
(Apply after fixes & next)

I'm hoping this branch will be fairly short-lived, but it depends how quickly
other architecture maintainers move their drivers over too.

thanks,

	Dave
