From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: merge of the wireless-next tree into the net-next
 tree
Date: Wed, 04 Jan 2012 13:32:43 -0500 (EST)
Message-ID: <20120104.133243.1395139417178989644.davem@davemloft.net>
References: <20120104105947.8bac77d1d7198a49e6feeca8@canb.auug.org.au>
	<20120103.202733.1070369898271428121.davem@davemloft.net>
	<20120104140209.GA2540@tuxdriver.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20120104140209.GA2540@tuxdriver.com>
Sender: netdev-owner@vger.kernel.org
To: linville@tuxdriver.com
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kvalo@qca.qualcomm.com
List-Id: linux-next.vger.kernel.org

From: "John W. Linville" <linville@tuxdriver.com>
Date: Wed, 4 Jan 2012 09:02:10 -0500

> Kalle has sent a temporary fix that sidesteps the issue by forcing the
> SDIO and USB versions of ath6kl to be built as modules.  I'll forward
> that on to you today.

I'm not applying a temporary fix.  I want a proper fix or a revert.

Do NOT apply any other patches from the ath6kl folks until either
a proper fix is available or the changes that caused this problem
are completely reverted from my tree.
