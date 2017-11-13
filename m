From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the l2-mtd tree
Date: Tue, 14 Nov 2017 08:04:30 +1100
Message-ID: <20171114080430.7c33fd83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37855 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752425AbdKMVEd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 16:04:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>

Hi Brian,

Commit

  d8c585fc5f37 ("mtd: Avoid probe failures when mtd->dbg.dfs_dir is invalid")

is missing a Signed-off-by from its comiiter.

-- 
Cheers,
Stephen Rothwell
