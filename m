From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Signed-off-by missing for commits in the net-next
 tree
Date: Sun, 09 Dec 2018 16:27:11 -0800 (PST)
Message-ID: <20181209.162711.1872275132406981860.davem@davemloft.net>
References: <20181210080045.0e67ad79@canb.auug.org.au>
        <20181209211139.GB21186@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181209211139.GB21186@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: andrew@lunn.ch
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com
List-Id: linux-next.vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>
Date: Sun, 9 Dec 2018 22:11:39 +0100

> On Mon, Dec 10, 2018 at 08:00:45AM +1100, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Commits
>> 
>>   dc9d38cec71c ("net: phy: mdio-gpio: Add phy_ignore_ta_mask to platform data")
>>   04fa26bab06d ("net: phy: mdio-gpio: Add platform_data support for phy_mask")
>> 
>> are missing a Signed-off-by from their author.
> 
> Hi David.
> 
> Any idea what happened here? The version in my git repo has SOB.
> 
> https://patchwork.ozlabs.org/patch/1009811/ also has my SOB.

I wonder if "git am" ate it. :-/

Yeah it's the '--' I think.
