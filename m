From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: linux-next: Signed-off-by missing for commits in the net-next
 tree
Date: Sun, 9 Dec 2018 22:49:07 +0100
Message-ID: <20181209214907.GC21186@lunn.ch>
References: <20181210080045.0e67ad79@canb.auug.org.au>
 <20181209211139.GB21186@lunn.ch>
 <011f5be3-4bc1-2e64-0ddf-b43b8dbc4dcd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <011f5be3-4bc1-2e64-0ddf-b43b8dbc4dcd@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: David Miller <davem@davemloft.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: linux-next.vger.kernel.org

On Sun, Dec 09, 2018 at 10:33:10PM +0100, Heiner Kallweit wrote:
> On 09.12.2018 22:11, Andrew Lunn wrote:
> > On Mon, Dec 10, 2018 at 08:00:45AM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Commits
> >>
> >>   dc9d38cec71c ("net: phy: mdio-gpio: Add phy_ignore_ta_mask to platform data")
> >>   04fa26bab06d ("net: phy: mdio-gpio: Add platform_data support for phy_mask")
> >>
> >> are missing a Signed-off-by from their author.
> > 
> > Hi David.
> > 
> > Any idea what happened here? The version in my git repo has SOB.
> > 
> > https://patchwork.ozlabs.org/patch/1009811/ also has my SOB.
> > 
> Instead of
> v2
> --
> int -> u32 in platform data structure
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> 
> shouldn't it be
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> ---
> v2
> - int -> u32 in platform data structure

Hi Heiner

David said he wanted to see the version history. So i deliberately put
it above the ---.

I'm just wondering if -- was enough to trigger something in David's
scripts? Or patchwork. The -- has disappeared in the commit which made
it into net-next.

   Andrew
