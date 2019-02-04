From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Sun, 03 Feb 2019 20:36:35 -0800 (PST)
Message-ID: <20190203.203635.678182310282626016.davem@davemloft.net>
References: <20190204153446.03ffb5e4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204153446.03ffb5e4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, deepa.kernel@gmail.com
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 4 Feb 2019 15:34:46 +1100

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 4 Feb 2019 15:24:11 +1100
> Subject: [PATCH] socket: fix for Add SO_TIMESTAMP[NS]_NEW
> 
> Fixes: 887feae36aee ("socket: Add SO_TIMESTAMP[NS]_NEW")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks for fixing this.

Applied.
