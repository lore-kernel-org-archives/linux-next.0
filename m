From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the mvebu tree
Date: Mon, 18 Dec 2017 07:40:35 +1100
Message-ID: <20171218074035.7ed52363@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757450AbdLQUki (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Dec 2017 15:40:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miquel Raynal <miquel.raynal@free-electrons.com>

Hi all,

Commit

  a2e2a5860be3 ("arm64: dts: marvell: add NAND support on the 8040-DB board")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
