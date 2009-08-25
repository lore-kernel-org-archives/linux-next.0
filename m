From: Joe Perches <joe@perches.com>
Subject: [PATCH 0/9] drivers/net/s2io.c: Cleanups
Date: Mon, 24 Aug 2009 20:29:39 -0700
Message-ID: <cover.1251170438.git.joe@perches.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.perches.com ([173.55.12.10]:1356 "EHLO mail.perches.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754347AbZHYDjF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Aug 2009 23:39:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: netdev@vger.kernel.org
Cc: Anil Murthy <anil.murthy@neterion.com>, Sreenivasa Honnur <sreenivasa.honnur@neterion.com>, Sivakumar Subramani <sivakumar.subramani@neterion.com>, Rastapur Santosh <santosh.rastapur@neterion.com>, Ramkrishna Vepa <ram.vepa@neterion.com>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

Just a few cleanups, compiled, untested.  No hardware.

Joe Perches (9):
  s2io.c: Use const for strings
  s2io.c: Shorten code line length by using intermediate pointers
  s2io.c: Use calculated size in kmallocs
  s2io.c: use kzalloc
  s2io.c: Make more conforming to normal kernel style
  s2io.c: convert printks to pr_<level>
  s2io.c: fix spelling explaination
  s2io.c: Standardize statistics accessors
  s2io.c: Convert skipped nic->config.tx_cfg[i]. to tx_cfg->

 drivers/net/s2io.c | 3367 ++++++++++++++++++++++++++--------------------------
 1 files changed, 1695 insertions(+), 1672 deletions(-)
