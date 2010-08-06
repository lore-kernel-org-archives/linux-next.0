From: rdunlap@xenotime.net
Subject: Re: linux-next: Tree for August 6 (kgdboc)
Date: Fri, 6 Aug 2010 14:03:41 -0700 (PDT)
Message-ID: <49930.64.134.136.84.1281128621.squirrel@xenotime.net>
References: <20100806132758.6001d416.sfr@canb.auug.org.au>
    <20100806115344.52c712b7.randy.dunlap@oracle.com>
    <4C5C69F9.5020108@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:38416 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S935195Ab0HFVDt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Aug 2010 17:03:49 -0400
Received: from xenotime.net ([2001:470:0:13c::4834:7338]) by xenotime.net for <linux-next@vger.kernel.org>; Fri, 6 Aug 2010 14:03:41 -0700
In-Reply-To: <4C5C69F9.5020108@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net, Jesse Barnes <jbarnes@virtuousgeek.org>

On Fri, August 6, 2010 1:00 pm, Jason Wessel wrote:
> On 08/06/2010 01:53 PM, Randy Dunlap wrote:
>
>> On Fri, 6 Aug 2010 13:27:58 +1000 Stephen Rothwell wrote:
>>
>>
>>> Hi all,
>>>
>>>
>>> As the merge window is open, please do not add 2.6.37 material to
>>> your linux-next included trees until after 2.6.36-rc1.
>>>
>>> Changes since 20100805:
>>>
>>
>>
>> ERROR: "con_debug_enter" [drivers/serial/kgdboc.ko] undefined!
>> ERROR: "vc_cons" [drivers/serial/kgdboc.ko] undefined!
>> ERROR: "fg_console" [drivers/serial/kgdboc.ko] undefined!
>> ERROR: "con_debug_leave" [drivers/serial/kgdboc.ko] undefined!
>>
>>
>> .config is attached.
>>
>>
>> ---
>> ~Randy
>> *** Remember to use Documentation/SubmitChecklist when testing your code
>> ***
>>
>
>
> Any possibility you can try this patch?
>
>
> I'll push it into kgdb-next in just a few min, and I created another test
> against this.

Yes, that works for me.  Thanks.


> Thanks,
> Jason.
>
>
>
> diff --git a/include/linux/console.h b/include/linux/console.h index
> f76fc29..305e9c2 100644 --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -79,8 +79,13 @@ int register_con_driver(const struct consw *csw, int
> first, int last); int unregister_con_driver(const struct consw *csw); int
> take_over_console(const struct consw *sw, int first, int last, int
> deflt); void give_up_console(const struct consw *sw); +#ifdef
> CONFIG_HW_CONSOLE
> int con_debug_enter(struct vc_data *vc); int con_debug_leave(void); +#else
> +#define con_debug_enter()
> +#define con_debug_leave()
> +#endif
>
>
> /* scroll */
> #define SM_UP       (1)
> --
