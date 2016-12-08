From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: patches dropped from the akpm tree
Date: Thu, 8 Dec 2016 15:01:41 +1100
Message-ID: <20161208150141.17ed4a74@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58259 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752980AbcLHEBn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Dec 2016 23:01:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andrew,

While rebasing the post -next part of your tree today, I dropped these
patches:

  drivers/clk/uniphier/clk-uniphier.h: fix build with old gcc
  drivers/clk/uniphier/clk-uniphier-mio.c: fix build for older gcc

Some commits in other trees that modified these files have been dropped
and so these patches no longer apply.

-- 
Cheers,
Stephen Rothwell
