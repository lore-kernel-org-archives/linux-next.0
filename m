From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Thu, 19 Jul 2018 06:49:01 -0700
Message-ID: <6dabf12b-e3db-dfe8-101c-02772039e21a@roeck-us.net>
References: <20180719120447.6e7ba23d@canb.auug.org.au>
 <cbc20089-6847-c0eb-5b5a-735245986be1@roeck-us.net>
 <20180719152940.0720e9c1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719152940.0720e9c1@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-next.vger.kernel.org

On 07/18/2018 10:29 PM, Stephen Rothwell wrote:
> Hi Guenter,
> 
> On Wed, 18 Jul 2018 20:52:56 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 07/18/2018 07:04 PM, Stephen Rothwell wrote:
>>>
>>> After merging the net-next tree, today's linux-next build (x86_64
>>> allmodconfig) produced this warning:
>>>
>>> *
>>> * Restart config...
>>> *
>>> ....
>>>
>>> This is output by my "make allmodconfig" and only started after merging
>>> the net-next tree today.  It has continued for further merges/builds.
>>>
>>> I suspect commit
>>>
>>>     1323061a018a ("net: phy: sfp: Add HWMON support for module sensors")
>>>
>>> which added an "imply" clause.
>>>    
>> I thought "imply" was better than "depends on HWMON || HWMON=n", but maybe
>> not. Is that a caveat when using "imply", and does it mean that "imply"
>> should better not be used ?
> 
> I don't know, sorry.  It was just my best guess from what I could see
> had changed.
> 
> I wonder if it makes a difference that I am doing my "make
> allmodconfig" on top of a previous "make allmodconfig" and some symbols
> are marked as "NEW" (though they are not symbols related to the changes
> that happened during the net-next tree merge)?
> 

I tried to reproduce the problem, but I don't see the message.

What I do see, though, is that "make allmodconfig" on a clean tree,
followed by "make menuconfig", results in configuration changes.
Specifically,

 > CONFIG_ARC_EMAC_CORE=m
 > CONFIG_ARC_EMAC=m
 > CONFIG_EMAC_ROCKCHIP=m

is removed by menuconfig, and a large number of "# ... is not set"
configuration lines are added. Weird and bad, since several of the
disabled configurations _should_ be enabled by "make allmodconfig",
and a large number of hwmon drivers are affected. Bisect does point
to "net: phy: sfp: Add HWMON support for module sensors", meaning
"imply hwmon" does have severe side effects and can not be used.

I'll try to find a fix.

Guenter
