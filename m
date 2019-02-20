From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Fixes tag needs some work in the net-next tree
Date: Wed, 20 Feb 2019 12:25:22 -0800 (PST)
Message-ID: <20190220.122522.1237657062289636264.davem@davemloft.net>
References: <20190220083611.GJ3080@nanopsycho>
        <20190220.110201.2245447687492293995.davem@davemloft.net>
        <20190220195811.GO3080@nanopsycho>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220195811.GO3080@nanopsycho>
Sender: linux-kernel-owner@vger.kernel.org
To: jiri@resnulli.us
Cc: vkoul@kernel.org, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch
List-Id: linux-next.vger.kernel.org

From: Jiri Pirko <jiri@resnulli.us>
Date: Wed, 20 Feb 2019 20:58:11 +0100

> Wed, Feb 20, 2019 at 08:02:01PM CET, davem@davemloft.net wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Date: Wed, 20 Feb 2019 09:36:11 +0100
>>
>>> Would be good to have some robot checking "Fixes" sanity...
>>
>>I want to add a script to my trees that locally do it for me but the
> 
> When it is in tree, it's already late. The robot has to check
> emails/patchwork.

It's for me, on my computer, to abort things when I try to commit
with a bad fixes tag or missing signoff.
