From: Vinod Koul <vkoul@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the net-next tree
Date: Wed, 20 Feb 2019 10:10:55 +0530
Message-ID: <20190220044055.GD21884@vkoul-mobl>
References: <20190220093136.73779781@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190220093136.73779781@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-next.vger.kernel.org

On 20-02-19, 09:31, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   a968b5e9d587 ("net: dsa: qca8k: Enable delay for RGMII_ID mode")
> 
> Fixes tag
> 
>   Fixes: 40269aa9f40a ("net: dsa: qca8k: disable delay for RGMII mode")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Did you mean:
> 
>   Fixes: 5ecdd77c61c8 ("net: dsa: qca8k: disable delay for RGMII mode")

Yes looks like I messed up the commit id.. Not sure why :(

Dave would you like to drop this and me sending updated patch or
something else..

Sorry about the miss

-- 
~Vinod
