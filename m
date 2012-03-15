From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: manual merge of the cpufreq tree with the
 cpufreq-current tree
Date: Wed, 14 Mar 2012 23:41:12 -0400
Message-ID: <20120315034111.GA31961@redhat.com>
References: <20120315132352.b8c8bbf0242c1f3b31333675@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120315132352.b8c8bbf0242c1f3b31333675@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, Kevin Hilman <khilman@ti.com>, Jaecheol Lee <jc.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 15, 2012 at 01:23:52PM +1100, Stephen Rothwell wrote:
 > Hi Dave,
 > 
 > Today's linux-next merge of the cpufreq tree got a conflict in
 > drivers/cpufreq/Makefile between commit b09db45c56c2 ("cpufreq: OMAP
 > driver depends CPUfreq tables") from the cpufreq-current tree and commit
 > a35c50510dd4 ("EXYNOS4X12: Add support cpufreq for EXYNOS4X12") from the
 > cpufreq tree.
 > 
 > Just context changes.  I fixed it up (see below) and can carry the fix as
 > necessary.

Argh, I've managed to get "for 3.4" patches on my fixes branch by mistake.
Given how close we are to 3.3 now, I'll just have Linus pull both branches
when 3.4 opens up.

thanks for catching this.

	Dave
