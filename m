From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Tue, 23 Apr 2019 18:36:05 -0700 (PDT)
Message-ID: <20190423.183605.258474599142114724.davem@davemloft.net>
References: <20190423172524.3bcf6bd0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190423172524.3bcf6bd0@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 23 Apr 2019 17:25:24 +1000

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 23 Apr 2019 17:12:19 +1000
> Subject: [PATCH] net: fix sparc64 compilation of sock_gettstamp
> 
> Fixes: c7cbdbf29f48 ("net: rework SIOCGSTAMP ioctl handling")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied, thanks Stephen.
