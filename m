From: Jarod Wilson <jarod@wilsonet.com>
Subject: Re: linux-next: Tree for July 28 (lirc #2)
Date: Thu, 29 Jul 2010 00:27:01 -0400
Message-ID: <AANLkTimTbZ6Vjqe5rqNVtNwPV=qoo=BOsOwG_6fS1SZU@mail.gmail.com>
References: <20100728162855.4968e561.sfr@canb.auug.org.au>
	<20100728102417.be60049a.randy.dunlap@oracle.com>
	<20100728220454.GK8564@aniel.lan>
	<4C50AC26.1080100@oracle.com>
	<AANLkTi=DLHOnzgXmpzNE3PQXp-xSkm8vLdxBBf1mcFuO@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=DLHOnzgXmpzNE3PQXp-xSkm8vLdxBBf1mcFuO@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Janne Grunau <j@jannau.net>, Stephen Rothwell <sfr@canb.auug.org.au>, lirc-list@lists.sourceforge.net, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 28, 2010 at 6:27 PM, Jarod Wilson <jarod@wilsonet.com> wrote:
> On Wed, Jul 28, 2010 at 6:16 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
>> On 07/28/10 15:04, Janne Grunau wrote:
>>> On Wed, Jul 28, 2010 at 10:24:17AM -0700, Randy Dunlap wrote:
>>>> On Wed, 28 Jul 2010 16:28:55 +1000 Stephen Rothwell wrote:
>>>>
>>>>> Hi all,
>>>>>
>>>>> Changes since 20100727:
>>>>
>>>>
>>>> When USB_SUPPORT is not enabled and MEDIA_SUPPORT is not enabled:
>>>>
>>>
>>> following patch should fix it
>>>
>>> Janne
>>
>> Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> Thanks.
>
> Acked-by: Jarod Wilson <jarod@redhat.com>
>
> Indeed, thanks much, Janne!

D'oh, I should have looked a bit closer... What if instead of making
all the drivers depend on both LIRC && LIRC_STAGING, LIRC_STAGING just
depends on LIRC? And there are a few depends lines with duplicate
USB's in them and LIRC_IMON should have USB added to it (technically,
I think ene0100 should also have a PNP, but we already have patches
pending that move it from staging to an ir-core driver).

-- 
Jarod Wilson
jarod@wilsonet.com
