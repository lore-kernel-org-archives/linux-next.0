From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Signed-off-by missing for commit in the net-next
 tree
Date: Sun, 02 Sep 2018 22:16:40 -0700 (PDT)
Message-ID: <20180902.221640.2061012272900735759.davem@davemloft.net>
References: <20180903074043.65038277@canb.auug.org.au>
        <DB7PR04MB4252FC3E1B9B2A56C5B81B268B0C0@DB7PR04MB4252.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB7PR04MB4252FC3E1B9B2A56C5B81B268B0C0@DB7PR04MB4252.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vakul.garg@nxp.com
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Vakul Garg <vakul.garg@nxp.com>
Date: Mon, 3 Sep 2018 05:08:08 +0000

> 
>> -----Original Message-----
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Sent: Monday, September 3, 2018 3:11 AM
>> To: David Miller <davem@davemloft.net>; Networking
>> <netdev@vger.kernel.org>
>> Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel
>> Mailing List <linux-kernel@vger.kernel.org>; Vakul Garg
>> <vakul.garg@nxp.com>
>> Subject: linux-next: Signed-off-by missing for commit in the net-next tree
>> 
>> Hi all,
>> 
>> Commit
>> 
>>   c2ad647c6442 ("selftests/tls: Add test for recv(PEEK) spanning across
>> multiple records")
>> 
>> is missing a Signed-off-by from its author.
>> 
> 
> It is my fault to miss adding signoff.
> I am sorry about that.
> Please advise if I need to do something to fix it.

There is nothing you need to do, and since commits in my tree are immutable
once pushed out it cannot be fixed.
