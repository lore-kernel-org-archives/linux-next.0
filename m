From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: missing signatures on commits in the clk tree
Date: Mon, 10 Apr 2017 18:16:31 +1000
Message-ID: <20170410181631.4949d702@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54821 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751448AbdDJIQg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Apr 2017 04:16:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>

Hi all,

I noticed a series of commits in the clk tree
(git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git#clk-next)
that have no Signed-off-by from their committer ...

They have SOBs from their author (Neil Armstrong) and from Michael
Turquette, but have been committed by Kevin Hilman.

-- 
Cheers,
Stephen Rothwell
