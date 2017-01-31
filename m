From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the mips tree
Date: Tue, 31 Jan 2017 12:00:35 +1100
Message-ID: <20170131120035.2a64e1c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43573 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753689AbdAaBJZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Jan 2017 20:09:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@linaro.org>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  arch/mips/configs/lemote2f_defconfig

between commit:

  b3f6046186ef ("MIPS: Update lemote2f_defconfig for CPU_FREQ_STAT change")

from the mips tree and commit:

  e7f73a76e07a ("cpufreq: Remove CONFIG_CPU_FREQ_STAT_DETAILS config option")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/mips/configs/lemote2f_defconfig
index 0cdb431bff80,bed745596d86..000000000000
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@@ -39,8 -39,7 +39,7 @@@ CONFIG_HIBERNATION=
  CONFIG_PM_STD_PARTITION="/dev/hda3"
  CONFIG_CPU_FREQ=y
  CONFIG_CPU_FREQ_DEBUG=y
 -CONFIG_CPU_FREQ_STAT=m
 +CONFIG_CPU_FREQ_STAT=y
- CONFIG_CPU_FREQ_STAT_DETAILS=y
  CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
  CONFIG_CPU_FREQ_GOV_POWERSAVE=m
  CONFIG_CPU_FREQ_GOV_USERSPACE=m
