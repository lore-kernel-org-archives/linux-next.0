From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Tue, 14 Aug 2018 06:28:16 -0700
Message-ID: <2146bdab-2885-931a-b878-4aac10bb1897@roeck-us.net>
References: <20180719120447.6e7ba23d@canb.auug.org.au>
 <cbc20089-6847-c0eb-5b5a-735245986be1@roeck-us.net>
 <20180719152940.0720e9c1@canb.auug.org.au>
 <6dabf12b-e3db-dfe8-101c-02772039e21a@roeck-us.net>
 <20180720080906.7a30c573@canb.auug.org.au>
 <20180719223521.GA30287@roeck-us.net>
 <CAK7LNARfZH=ZEdFuRq_g1HsJ+Pv1m=v343JLyE-6+uM_d+3eWA@mail.gmail.com>
 <CAK7LNAQgdqpi60eH-Sfnr+U9DKpwCL=wPdhJA6=hpv3cicVotw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQgdqpi60eH-Sfnr+U9DKpwCL=wPdhJA6=hpv3cicVotw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-next.vger.kernel.org

On 08/14/2018 12:05 AM, Masahiro Yamada wrote:
> 2018-07-20 8:19 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>> 2018-07-20 7:35 GMT+09:00 Guenter Roeck <linux@roeck-us.net>:
>>> On Fri, Jul 20, 2018 at 08:09:06AM +1000, Stephen Rothwell wrote:
>>>> Hi Guenter,
>>>>
>>>> On Thu, 19 Jul 2018 06:49:01 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> On 07/18/2018 10:29 PM, Stephen Rothwell wrote:
>>>>>>
>>>>>> On Wed, 18 Jul 2018 20:52:56 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>>
>>>>>>> On 07/18/2018 07:04 PM, Stephen Rothwell wrote:
>>>>>>>>
>>>>>>>> After merging the net-next tree, today's linux-next build (x86_64
>>>>>>>> allmodconfig) produced this warning:
>>>>>>>>
>>>>>>>> *
>>>>>>>> * Restart config...
>>>>>>>> *
>>>>>>>> ....
>>>>>>>>
>>>>>>>> This is output by my "make allmodconfig" and only started after merging
>>>>>>>> the net-next tree today.  It has continued for further merges/builds.
>>>>>>>>
>>>>>>>> I suspect commit
>>>>>>>>
>>>>>>>>      1323061a018a ("net: phy: sfp: Add HWMON support for module sensors")
>>>>>>>>
>>>>>>>> which added an "imply" clause.
>>>>>>>>
>>>>>>> I thought "imply" was better than "depends on HWMON || HWMON=n", but maybe
>>>>>>> not. Is that a caveat when using "imply", and does it mean that "imply"
>>>>>>> should better not be used ?
>>>>>>
>>>>>> I don't know, sorry.  It was just my best guess from what I could see
>>>>>> had changed.
>>>>>>
>>>>>> I wonder if it makes a difference that I am doing my "make
>>>>>> allmodconfig" on top of a previous "make allmodconfig" and some symbols
>>>>>> are marked as "NEW" (though they are not symbols related to the changes
>>>>>> that happened during the net-next tree merge)?
>>>>>>
>>>>>
>>>>> I tried to reproduce the problem, but I don't see the message.
>>>>>
>>>>> What I do see, though, is that "make allmodconfig" on a clean tree,
>>>>> followed by "make menuconfig", results in configuration changes.
>>>>> Specifically,
>>>>>
>>>>>   > CONFIG_ARC_EMAC_CORE=m
>>>>>   > CONFIG_ARC_EMAC=m
>>>>>   > CONFIG_EMAC_ROCKCHIP=m
>>>>>
>>>>> is removed by menuconfig, and a large number of "# ... is not set"
>>>>> configuration lines are added. Weird and bad, since several of the
>>>>> disabled configurations _should_ be enabled by "make allmodconfig",
>>>>> and a large number of hwmon drivers are affected. Bisect does point
>>>>> to "net: phy: sfp: Add HWMON support for module sensors", meaning
>>>>> "imply hwmon" does have severe side effects and can not be used.
>>>>>
>>>>> I'll try to find a fix.
>>>>
>>>> OK, my mistake, the "make allmodconfig" works, the following "make"
>>>> causes the config restart.  (I am actually doing cross builds and using
>>>> an external object directory, in case that matters.)
>>>>
>>>> I removed the "imply HWMON" line added by the above commit and the
>>>> problem went away.  Also, using "depends on HWMON || HWMON=n" instead
>>>> of the imply fixes it.
>>>
>>> Yes, replacing imply with the dependency is what I did in the fixup patch.
>>> Sorry, I should have copied you: https://patchwork.kernel.org/patch/10534925/
>>>
>>> It is a bit different - imply was supposed to enforce HWMON={y,n} if SFP=y,
>>> and the depends line enforces SFP={n,m} if HWMON=m. I have no idea why
>>> imply doesn't work, but I think I'll stay away from it in the future.
>>>
>>> Guenter
>>
>>
>> Hmm, this could be a Kconfig bug.
>>
>> I will take a look.
> 
> 
> Today, I took a look at it.
> 
> The cause of the problem was the circular dependency.
> 
> Somehow, 'imply' is not checked in the circular dependency.
> 
> So, I wrote patches to report this.
> https://patchwork.kernel.org/patch/10565061/
> https://patchwork.kernel.org/patch/10565063/
> 
> 
> If you apply those two patches on top of commit
> 1323061a018a ("net: phy: sfp: Add HWMON support for module sensors")
> It is reported in allmodconfig stage, like this:
> 
> 
> masahiro@grover:~/ref/linux-next$ make allmodconfig
>    HOSTCC  scripts/kconfig/conf.o
>    YACC    scripts/kconfig/zconf.tab.c
>    HOSTCC  scripts/kconfig/zconf.tab.o
>    HOSTLD  scripts/kconfig/conf
> scripts/kconfig/conf  --allmodconfig Kconfig
> drivers/of/Kconfig:68:error: recursive dependency detected!
> drivers/of/Kconfig:68: symbol OF_IRQ depends on IRQ_DOMAIN
> kernel/irq/Kconfig:63: symbol IRQ_DOMAIN is selected by REGMAP
> drivers/base/regmap/Kconfig:6: symbol REGMAP is selected by SENSORS_ASPEED
> drivers/hwmon/Kconfig:352: symbol SENSORS_ASPEED depends on HWMON
> drivers/hwmon/Kconfig:5: symbol HWMON is implied by SFP
> drivers/net/phy/Kconfig:214: symbol SFP depends on PHYLIB
> drivers/net/phy/Kconfig:181: symbol PHYLIB is selected by ARC_EMAC_CORE
> drivers/net/ethernet/arc/Kconfig:18: symbol ARC_EMAC_CORE is selected
> by ARC_EMAC
> drivers/net/ethernet/arc/Kconfig:24: symbol ARC_EMAC depends on OF_IRQ
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> 

Interesting; I thought that "implied" does not really select the symbol.
That means 'imply' just doesn't work for HWMON, and we'll have to stick
with the old "depends on HWMON || HWMON=n".

Thanks,
Guenter
