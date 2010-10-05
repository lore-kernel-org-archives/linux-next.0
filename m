From: "Randy Dunlap" <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for October 4
Date: Tue, 5 Oct 2010 11:59:15 -0700 (PDT)
Message-ID: <49602.216.212.242.109.1286305155.squirrel@xenotime.net>
References: <20101004113638.a7f8517b.sfr@canb.auug.org.au>
    <AANLkTi=5k=29G+xLrN_1F-ho+90k_KAwcb++eKzHA+Ai@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=5k=29G+xLrN_1F-ho+90k_KAwcb++eKzHA+Ai@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, Randy Dunlap <rdunlap@xenotime.net>
List-Id: linux-next.vger.kernel.org


On Mon, October 4, 2010 10:48 pm, Zimny Lech wrote:
> Hi,
>
>
> 2010/10/4 Stephen Rothwell <sfr@canb.auug.org.au>:
>
>> Hi all,
>>
>>
>> This tree is not as well tested as others since it was only built after
>>  all the merges had been done.
>
> Randy said that he had already sent a patch for this
>
>
> /home/test/linux-2.6/drivers/base/core.c: In function
> 'get_device_parent':
> /home/test/linux-2.6/drivers/base/core.c:634:3: error: 'block_class'
> undeclared (first use in this function)
> /home/test/linux-2.6/drivers/base/core.c:634:3: note: each undeclared
> identifier is reported only once for each function it appears in
> /home/test/linux-2.6/drivers/base/core.c: In function
> 'device_add_class_symlinks':
> /home/test/linux-2.6/drivers/base/core.c:723:2: error: 'block_class'
> undeclared (first use in this function)
> /home/test/linux-2.6/drivers/base/core.c: In function
> 'device_remove_class_symlinks':
> /home/test/linux-2.6/drivers/base/core.c:751:2: error: 'block_class'
> undeclared (first use in this function) make[3]: *** [drivers/base/core.o]
> Error 1
> make[2]: *** [drivers/base] Error 2
> make[1]: *** [drivers] Error 2
> make: *** [sub-make] Error 2


I sure did, but Greg may be backlogged or just ignoring it.


-- 
~Randy
