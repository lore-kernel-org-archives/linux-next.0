From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm-soc tree
Date: Tue, 28 Jul 2015 12:20:25 +1000
Message-ID: <20150728122025.6b2cdbc8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42830 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754696AbbG1CU0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jul 2015 22:20:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Sudeep Holla <sudeep.holla@arm.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm/mach-shmobile/intc-sh73a0.c

between commit:

  30f8925a57d8 ("ARM: shmobile: Remove legacy board code for KZM-A9-GT")

from the arm-soc tree and commit:

  0d3f2c92e004 ("irqchip/gic: Remove redundant gic_set_irqchip_flags")

from the tip tree.

I fixed it up (I just removed the file) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
