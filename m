From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: linux-next: manual merge of the net tree
Date: Wed, 24 Dec 2008 17:41:48 +0300
Message-ID: <20081224144148.GA8030@localhost>
References: <20081224101934.0da26dab.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.158]:59555 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752503AbYLXOlw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Dec 2008 09:41:52 -0500
Received: by fg-out-1718.google.com with SMTP id 19so1139603fgg.17
        for <linux-next@vger.kernel.org>; Wed, 24 Dec 2008 06:41:50 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20081224101934.0da26dab.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, James Chapman <jchapman@katalix.com>

[Stephen Rothwell - Wed, Dec 24, 2008 at 10:19:34AM +1100]
| Hi Dave,
| 
| Today's linux-next merge of the net tree got a conflict in
| drivers/net/ppp_generic.c between commit
| 739840d529eb7505d3cbfe9d468bf1440c9a8e27 ("ppp: fix segfaults introduced
| by netdev_priv changes") from the net-current tree and commit
| 7a95d267fb62cd6b80ef73be0592bbbe1dbd5df7 ("net: ppp_generic - use idr
| technique instead of cardmaps") from the net tree.
| 
| I fixed it up (see below) and can carry the fix as necessary.
| -- 
| Cheers,
| Stephen Rothwell                    sfr@canb.auug.org.au
| http://www.canb.auug.org.au/~sfr/
|

Thanks a lot, Stephen!

		- Cyrill -
