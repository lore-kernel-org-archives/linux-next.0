From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the omap tree
Date: Wed, 29 Nov 2017 09:30:17 +1100
Message-ID: <20171129093017.5e69ad0d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33383 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752586AbdK1WaV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Nov 2017 17:30:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Tony,

Commit

  57af8b4f7b46 ("Revert "ARM: omap2plus: Run make savedefconfig again to save some space"")

is missing a Signed-off-by from its author or committer.

Also, it is nice to put some reasoning in the commit message for a revert
so future you knows why you did it.

-- 
Cheers,
Stephen Rothwell
