From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: manual merge of the cpufreq tree with the s5p tree
Date: Thu, 10 Mar 2011 21:41:02 -0500
Message-ID: <20110311024101.GA29265@redhat.com>
References: <20110311133542.8ffb094e.sfr@au1.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:38278 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752184Ab1CKCl2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Mar 2011 21:41:28 -0500
Content-Disposition: inline
In-Reply-To: <20110311133542.8ffb094e.sfr@au1.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@au1.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Kukjin Kim <kgene.kim@samsung.com>

On Fri, Mar 11, 2011 at 01:35:42PM +1100, Stephen Rothwell wrote:
 > Hi Dave,
 > 
 > Today's linux-next merge of the cpufreq tree got a conflict in
 > arch/arm/mach-exynos4/cpufreq.c between commit 7d30e8b3815f ("ARM:
 > EXYNOS4: Add EXYNOS4 CPU initialization support") from the s5p tree and
 > commit 44033b9c940e ([CPUFREQ] Remove the pm_message_t argument from
 > driver suspend"") from the cpufreq tree (where this file is called
 > arch/arm/mach-s5pv310/cpufreq.c).
 > 
 > Just context changes.  I fixed it up (see below) and can carry the fix as
 > necessary.

Yep, Looks fine to me. thanks.

	Dave
