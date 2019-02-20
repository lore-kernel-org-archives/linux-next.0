From: Jiri Pirko <jiri@resnulli.us>
Subject: Re: linux-next: Fixes tag needs some work in the net-next tree
Date: Wed, 20 Feb 2019 09:36:11 +0100
Message-ID: <20190220083611.GJ3080@nanopsycho>
References: <20190220093136.73779781@canb.auug.org.au>
 <20190220044055.GD21884@vkoul-mobl>
 <20190219.224813.723564128666927693.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190219.224813.723564128666927693.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: vkoul@kernel.org, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch
List-Id: linux-next.vger.kernel.org

Wed, Feb 20, 2019 at 07:48:13AM CET, davem@davemloft.net wrote:
>From: Vinod Koul <vkoul@kernel.org>
>Date: Wed, 20 Feb 2019 10:10:55 +0530
>
>> On 20-02-19, 09:31, Stephen Rothwell wrote:
>>> Hi all,
>>> 
>>> In commit
>>> 
>>>   a968b5e9d587 ("net: dsa: qca8k: Enable delay for RGMII_ID mode")
>>> 
>>> Fixes tag
>>> 
>>>   Fixes: 40269aa9f40a ("net: dsa: qca8k: disable delay for RGMII mode")
>>> 
>>> has these problem(s):
>>> 
>>>   - Target SHA1 does not exist
>>> 
>>> Did you mean:
>>> 
>>>   Fixes: 5ecdd77c61c8 ("net: dsa: qca8k: disable delay for RGMII mode")
>> 
>> Yes looks like I messed up the commit id.. Not sure why :(
>> 
>> Dave would you like to drop this and me sending updated patch or
>> something else..
>> 
>> Sorry about the miss
>
>Doesn't work that way, something in my tree is there forever.

Would be good to have some robot checking "Fixes" sanity...
