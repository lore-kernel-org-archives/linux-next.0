From: Abylay Ospan <aospan@netup.ru>
Subject: Re: linux-next: Tree for Sep 24 (netup_unidvb & if)
Date: Fri, 25 Sep 2015 09:54:58 +0300
Message-ID: <CAK3bHNVFjBJhXM4VsKg74CfXbxYpigSDFjp5KC030oD+3txHKg@mail.gmail.com>
References: <20150924145335.2674d15d@canb.auug.org.au> <5604388C.2040604@infradead.org>
 <20150924170555.621c83ea@gandalf.local.home> <56047AD2.90504@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56047AD2.90504@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Kozlov <serjk@netup.ru>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
List-Id: linux-next.vger.kernel.org

Hi Randy,

I have checked your config. There is:
# CONFIG_DVB_HORUS3A is not set

in this case in drivers/media/dvb-frontends/horus3a.h incorrect
statement used. I will send patch to fix this problem bit later.

thanks for report !


2015-09-25 1:36 GMT+03:00 Randy Dunlap <rdunlap@infradead.org>:
> On 09/24/15 14:05, Steven Rostedt wrote:
>> On Thu, 24 Sep 2015 10:53:16 -0700
>> Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>> On 09/23/15 21:53, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20150923:
>>>>
>>>
>>> on x86_64:
>>>
>>>
>>
>> Compiles fine for me, and I enabled:
>>
>>  CONFIG_PROFILE_ALL_BRANCHES=y
>>  CONFIG_MEDIA_SUPPORT=y
>>  CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
>>
>> which looks like it should give the problem you have.
>>
>> What config did you use, and maybe it's a gcc version problem?
>
> Sorry, I should have included the randconfig file.  Here it is (attached).
>
>
> --
> ~Randy



-- 
Abylay Ospan,
NetUP Inc.
http://www.netup.tv
