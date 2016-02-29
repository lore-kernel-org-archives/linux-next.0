From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pm tree
Date: Mon, 29 Feb 2016 15:42:31 +1100
Message-ID: <20160229154231.5e6f0804@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35988 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753320AbcB2Eme (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Feb 2016 23:42:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/cpufreq/intel_pstate.c

between commit:

  7791e4aa59ad ("cpufreq: intel_pstate: Enable HWP by default")

from the pm tree and commit:

  bc696ca05f5a ("x86/cpufeature: Replace the old static_cpu_has() with safe variant")

from the tip tree.

I fixed it up (the former removed the code modified by the latter)
and can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell
