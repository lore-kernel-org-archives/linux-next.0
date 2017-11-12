From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the net-next tree
Date: Mon, 13 Nov 2017 07:44:54 +1100
Message-ID: <20171113074454.4f1f0294@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40667 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750910AbdKLUo5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Nov 2017 15:44:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robert Stonehouse <rstonehouse@solarflare.com>, Bert Kenward <bkenward@solarflare.com>

Hi all,

Commit

  cbad52e92ad7 ("sfc: don't warn on successful change of MAC")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell
