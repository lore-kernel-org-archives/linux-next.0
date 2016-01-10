From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: strange commit in the parisc-hd tree
Date: Mon, 11 Jan 2016 09:28:22 +1100
Message-ID: <20160111092822.4b4c0233@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56114 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753259AbcAJW2Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 Jan 2016 17:28:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Helge Deller <deller@gmx.de>, Parisc List <linux-parisc@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

I noticed the following commit in the parisc-hd tree today:

  43122681dd75 ("Fix __ARCH_SI_PREAMBLE_SIZE on parisc")

which among other things says:

  This patch is not planned to be committed as it currently is.

It also has no Signed-off-by :-(

Please remove it from linux-next inclusion until it is ready.  Delibeately
introducing a patch to linux-next that may well cause build breakage
in other architectures just before the merge window opens is a bit
antisocial.

I will merge a revert commit for it today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
