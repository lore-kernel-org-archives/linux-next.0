From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the nand tree
Date: Tue, 12 Dec 2017 07:50:34 +1100
Message-ID: <20171212075034.56426934@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60921 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751512AbdLKUui (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Dec 2017 15:50:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Boris,

Commit

  b8267c7ef4f1 ("mtd: nand: add ->exec_op() implementation")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
