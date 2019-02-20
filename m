From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Fixes tag needs some work in the net-next tree
Date: Tue, 19 Feb 2019 22:48:13 -0800 (PST)
Message-ID: <20190219.224813.723564128666927693.davem@davemloft.net>
References: <20190220093136.73779781@canb.auug.org.au>
        <20190220044055.GD21884@vkoul-mobl>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220044055.GD21884@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch
List-Id: linux-next.vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 20 Feb 2019 10:10:55 +0530

> On 20-02-19, 09:31, Stephen Rothwell wrote:
>> Hi all,
>> 
>> In commit
>> 
>>   a968b5e9d587 ("net: dsa: qca8k: Enable delay for RGMII_ID mode")
>> 
>> Fixes tag
>> 
>>   Fixes: 40269aa9f40a ("net: dsa: qca8k: disable delay for RGMII mode")
>> 
>> has these problem(s):
>> 
>>   - Target SHA1 does not exist
>> 
>> Did you mean:
>> 
>>   Fixes: 5ecdd77c61c8 ("net: dsa: qca8k: disable delay for RGMII mode")
> 
> Yes looks like I messed up the commit id.. Not sure why :(
> 
> Dave would you like to drop this and me sending updated patch or
> something else..
> 
> Sorry about the miss

Doesn't work that way, something in my tree is there forever.
