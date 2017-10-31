From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the net-next tree
Date: Tue, 31 Oct 2017 16:40:19 +1100
Message-ID: <20171031164019.164de3db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60013 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752996AbdJaFkW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Oct 2017 01:40:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Francois Romieu <romieu@fr.zoreil.com>, Kirill Smelkov <kirr@nexedi.com>

Hi all,

Commit

  509708310cf9 ("r8169: Add support for interrupt coalesce tuning (ethtool -C)")

is missing a Signed-off-by from its author (or its author is wrong).

-- 
Cheers,
Stephen Rothwell
