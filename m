From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Thu, 02 Sep 2010 06:36:16 +0200
Message-ID: <op.vid1qqte7p4s8u@localhost>
References: <20100902135450.59d6b96a.sfr@canb.auug.org.au>
 <20100902043254.GB30689@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:27981 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750806Ab0IBEhL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Sep 2010 00:37:11 -0400
In-reply-to: <20100902043254.GB30689@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe Kleine-K??nig <u.kleine-koenig@pengutronix.de>

On Thu, 02 Sep 2010 06:32:54 +0200, Greg KH <greg@kroah.com> wrote:

> On Thu, Sep 02, 2010 at 01:54:50PM +1000, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> After merging the usb tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/usb/gadget/nokia.c:244: error: unknown field 'bind' specifie=
d in initializer
>> drivers/usb/gadget/nokia.c:244: warning: initialization makes intege=
r from pointer without a cast
>> drivers/usb/gadget/nokia.c:244: error: initializer element is not co=
mputable at load time
>> drivers/usb/gadget/nokia.c:244: error: (near initialization for 'nok=
ia_driver.needs_serial')
>> drivers/usb/gadget/nokia.c: In function 'nokia_init':
>> drivers/usb/gadget/nokia.c:250: error: implicit declaration of funct=
ion 'usb_composite_register'
>>
>> Caused by commit cc604fa9db859b7d6899de807d6bd8df80fc0a1a ("usb gadg=
et:
>> don't save bind callback in struct usb_configuration").  The 'bind' =
and
>> 'usb_composite_register' references above were added before 2.6.34-r=
c1
>> but missed in this patch.
>>
>> Please make every attempt to (at least) build every file that gets
>> modified when testing a patch.  (and grep is your friend)
>>
>> I have used the usb tree from next-20100901 for today.
>
> Sorry about that, my build didn't catch this.  I'll fix it up tomorro=
w.

I'm already working on updated patch.  I'll send it in an hour or so.

--=20
Best regards,                                        _     _
| Humble Liege of Serenely Enlightened Majesty of  o' \,=3D./ `o
| Computer Science,  Micha=C5=82 "mina86" Nazarewicz       (o o)
+----[mina86*mina86.com]---[mina86*jabber.org]----ooO--(_)--Ooo--
