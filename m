From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 17 (pinctrl-msm)
Date: Mon, 24 Feb 2014 10:14:45 -0800
Message-ID: <530B8C15.50100@infradead.org>
References: <20140217172329.2c61499f57842ec2ed177bc5@canb.auug.org.au> <530247FC.90606@infradead.org> <CACRpkdamW1-CxZV65at3PaPhY5nANRDd=SY=FsNPVnrPxyD81w@mail.gmail.com> <20140224174646.GA32621@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:46531 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752727AbaBXSOu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Feb 2014 13:14:50 -0500
In-Reply-To: <20140224174646.GA32621@sonymobile.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>

On 02/24/2014 09:46 AM, Bjorn Andersson wrote:
> On Mon 24 Feb 06:46 PST 2014, Linus Walleij wrote:
>=20
>> On Mon, Feb 17, 2014 at 6:33 PM, Randy Dunlap <rdunlap@infradead.org=
> wrote:
>>> On 02/16/2014 10:23 PM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> If you see failures in building this tree due to missing declarati=
ons of
>>>> k..alloc/free, then it may be caused by commit 2bd59d48ebfb ("cgro=
up:
>>>> convert to kernfs").  Please send Tejun Heo <tj@kernel.org> a patc=
h
>>>> adding an inclusion of linux/slab.h to the appropriate file(s).
>>>>
>>>> This tree fails (more than usual) the powerpc allyesconfig build.
>>>>
>>>> Changes since 20140214:
>>>>
>>>
>>> on i386:
>>>
>>> ERROR: "handle_bad_irq" [drivers/pinctrl/pinctrl-msm.ko] undefined!
>>
>> Weird, Bj=F6rn do you know what may be causing this?
>=20
> I include linux/irq.h to get hold of handle_bad_irq() and as far as I=
 can see
> there are no changes related to that in linux-next.
>=20
> Do we know if the build still fails? Or if something changed?
>=20
>=20
> Please let me know if I should pull down the -next tree and try to re=
produce
> this.

I guess that you get off free on this one since I didn't post the faili=
ng
=2Econfig file and I have already deleted it.

I'm trying to reproduce it now but it's slow going.  I'll let you know =
if
I get it to fail again.

thanks,
--=20
~Randy
