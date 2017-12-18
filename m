From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the net-next tree
Date: Tue, 19 Dec 2017 07:41:04 +1100
Message-ID: <20171219074104.7efc7a16@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60881 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752495AbdLRUlK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Dec 2017 15:41:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bert Kenward <bkenward@solarflare.com>, Edward Cree <ecree@solarflare.com>

Hi all,

Commits

  d8d8ccf27741 ("sfc: update EF10 register definitions")
  0bc959a95e8c ("sfc: populate the timer reload field")

are missing a Signed-off-by from their author.

-- 
Cheers,
Stephen Rothwell
