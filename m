From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Sept 24 (irqchip)
Date: Fri, 02 Nov 2012 18:47:08 -0700
Message-ID: <5094779C.6030506@xenotime.net>
References: <20120925005328.f748dfa3d077cebb345a4291@canb.auug.org.au>	<50607E99.6040303@xenotime.net>	<20120925020744.cc5beb9e65473605e5ca2240@canb.auug.org.au> <CAOesGMjYE0WgPr4ahPUdBVCZP=dkVPia-dmpDKgiOM_2HgsJgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:60290 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754231Ab2KCBrM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Nov 2012 21:47:12 -0400
In-Reply-To: <CAOesGMjYE0WgPr4ahPUdBVCZP=dkVPia-dmpDKgiOM_2HgsJgg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Simon Arlott <simon@fire.lp0.eu>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Chris Boot <bootc@bootc.net>, Dom Cobley <popcornmix@gmail.com>, Dom Cobley <dc4@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>

On 09/24/2012 09:46 AM, Olof Johansson wrote:

> On Mon, Sep 24, 2012 at 9:07 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Randy,
>>
>> On Mon, 24 Sep 2012 08:39:05 -0700 Randy Dunlap <rdunlap@xenotime.net> wrote:
>>>
>>> On 09/24/2012 07:53 AM, Stephen Rothwell wrote:
>>>
>>>> Today was a train wreck, with lots of new conflicts across several trees
>>>> and a few build failures as well.
>>>
>>> I agree.  I mostly get this:
>>>
>>> drivers/Kconfig:157: can't open file "drivers/irqchip/Kconfig"
>>>
>>> i.e., no such file.
>>>
>>> How does this happen?  :(
>>>
>>> who handles irqchip?
>>
>> Hmm, commit 89214f009c1d ("ARM: bcm2835: add interrupt controller
>> driver") from the arm-soc tree adds that file as an empty file (I have
>> the empty file in my tree).  Nothing adds anything to it.
> 
> Yeah, the directory came in through arm-soc for-next (since the
> bcm2835 driver was added), but there is an empty Kconfig in arm-soc. I
> can see it in linux-next as well.
> 
> I wonder why it doesn't show up in your tree, Randy. You just did a
> regular git checkout?


Sorry for the very delayed reply (and this is already fixed).

It doesn't show up in my kernel tree because I use linux-v3.x tarballs
and patch-3.x-rcY patches and linux-next patches, and
'patch' does not keep empty files around.

-- 
~Randy
