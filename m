From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Mon, 28 Jan 2019 22:43:53 -0800 (PST)
Message-ID: <20190128.224353.1738405161224692834.davem@davemloft.net>
References: <20190129161742.6b1b7338@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129161742.6b1b7338@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, claudiu.manoil@nxp.com
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 29 Jan 2019 16:17:42 +1100

> I have added the following fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 29 Jan 2019 16:13:08 +1100
> Subject: [PATCH] enetc: include linux/vmalloc.h for vzalloc etc
> 
> Fixes: d4fd0404c1c9 ("enetc: Introduce basic PF and VF ENETC ethernet drivers")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to net-next.
