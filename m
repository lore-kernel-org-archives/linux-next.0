From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: linux-next: Signed-off-by missing for commits in the net-next
 tree
Date: Sun, 9 Dec 2018 22:11:39 +0100
Message-ID: <20181209211139.GB21186@lunn.ch>
References: <20181210080045.0e67ad79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181210080045.0e67ad79@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 10, 2018 at 08:00:45AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   dc9d38cec71c ("net: phy: mdio-gpio: Add phy_ignore_ta_mask to platform data")
>   04fa26bab06d ("net: phy: mdio-gpio: Add platform_data support for phy_mask")
> 
> are missing a Signed-off-by from their author.

Hi David.

Any idea what happened here? The version in my git repo has SOB.

https://patchwork.ozlabs.org/patch/1009811/ also has my SOB.

     Thanks
	Andrew
