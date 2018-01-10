From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Wed, 10 Jan 2018 15:41:20 +1100
Message-ID: <20180110154120.3388e4e7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60105 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757260AbeAJElX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Jan 2018 23:41:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
produced this warning:

arch/x86/kernel/cpu/bugs.c:79:12: warning: 'spectre_v2_enabled' defined but not used [-Wunused-variable]
 static int spectre_v2_enabled = SPECTRE_V2_NONE;
            ^

Introduced by commit

  54d5103245ff ("x86/spectre: Add boot time option to select Spectre v2 mitigation")

-- 
Cheers,
Stephen Rothwell
