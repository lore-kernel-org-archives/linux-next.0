From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Signed-off-by missing for commits in the net-next
 tree
Date: Sun, 09 Dec 2018 16:28:05 -0800 (PST)
Message-ID: <20181209.162805.1102172618676272423.davem@davemloft.net>
References: <20181210080045.0e67ad79@canb.auug.org.au>
        <20181209211139.GB21186@lunn.ch>
        <011f5be3-4bc1-2e64-0ddf-b43b8dbc4dcd@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <011f5be3-4bc1-2e64-0ddf-b43b8dbc4dcd@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: hkallweit1@gmail.com
Cc: andrew@lunn.ch, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com
List-Id: linux-next.vger.kernel.org

From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Sun, 9 Dec 2018 22:33:10 +0100

> On 09.12.2018 22:11, Andrew Lunn wrote:
>> On Mon, Dec 10, 2018 at 08:00:45AM +1100, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Commits
>>>
>>>   dc9d38cec71c ("net: phy: mdio-gpio: Add phy_ignore_ta_mask to platform data")
>>>   04fa26bab06d ("net: phy: mdio-gpio: Add platform_data support for phy_mask")
>>>
>>> are missing a Signed-off-by from their author.
>> 
>> Hi David.
>> 
>> Any idea what happened here? The version in my git repo has SOB.
>> 
>> https://patchwork.ozlabs.org/patch/1009811/ also has my SOB.
>> 
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

No, I want the changelog to actually appear in the commit message.

I'm kinda tired of saying this.

Keep changelog information in the commit message, everyone.

The problem here is the '--' delimiter, Andrew should have either
used nothing or something else.
