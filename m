From: Sabrina Dubroca <sd@queasysnail.net>
Subject: Re: linux-next: Signed-off-by missing for commits in the net-next
 tree
Date: Mon, 10 Dec 2018 00:27:22 +0100
Message-ID: <20181209232722.GA4425@bistromath.localdomain>
References: <20181210080045.0e67ad79@canb.auug.org.au>
 <20181209211139.GB21186@lunn.ch>
 <011f5be3-4bc1-2e64-0ddf-b43b8dbc4dcd@gmail.com>
 <20181209214907.GC21186@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181209214907.GC21186@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, David Miller <davem@davemloft.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: linux-next.vger.kernel.org

2018-12-09, 22:49:07 +0100, Andrew Lunn wrote:
> On Sun, Dec 09, 2018 at 10:33:10PM +0100, Heiner Kallweit wrote:
> > On 09.12.2018 22:11, Andrew Lunn wrote:
> > > On Mon, Dec 10, 2018 at 08:00:45AM +1100, Stephen Rothwell wrote:
> > >> Hi all,
> > >>
> > >> Commits
> > >>
> > >>   dc9d38cec71c ("net: phy: mdio-gpio: Add phy_ignore_ta_mask to platform data")
> > >>   04fa26bab06d ("net: phy: mdio-gpio: Add platform_data support for phy_mask")
> > >>
> > >> are missing a Signed-off-by from their author.
> > > 
> > > Hi David.
> > > 
> > > Any idea what happened here? The version in my git repo has SOB.
> > > 
> > > https://patchwork.ozlabs.org/patch/1009811/ also has my SOB.
> > > 
> > Instead of
> > v2
> > --
> > int -> u32 in platform data structure
> > 
> > Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> > 
> > shouldn't it be
> > 
> > Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> > ---
> > v2
> > - int -> u32 in platform data structure
> 
> Hi Heiner
> 
> David said he wanted to see the version history. So i deliberately put
> it above the ---.
> 
> I'm just wondering if -- was enough to trigger something in David's
> scripts? Or patchwork. The -- has disappeared in the commit which made
> it into net-next.
> 
>    Andrew

If you fetch the mbox from patchwork at

    https://patchwork.ozlabs.org/patch/1009811/mbox/

it contains:

-------- 8< --------
v2
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
int -> u32 in platform data structure

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
[diffstat]
-------- 8< --------

That's 3 dashes instead of the 2 from your mail. If you "git am" that,
the sign-off and actual history will get chopped off.

Maybe Stephen's script to detect those missing sign-offs could be run
as a commit/apply hook by David? This happens regularly, sometimes
dropping more than just a sign-off.

-- 
Sabrina
