From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: Tree for Feb 17 (pinctrl-msm)
Date: Mon, 24 Feb 2014 15:46:17 +0100
Message-ID: <CACRpkdamW1-CxZV65at3PaPhY5nANRDd=SY=FsNPVnrPxyD81w@mail.gmail.com>
References: <20140217172329.2c61499f57842ec2ed177bc5@canb.auug.org.au>
	<530247FC.90606@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:34668 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752313AbaBXOqR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Feb 2014 09:46:17 -0500
Received: by mail-oa0-f41.google.com with SMTP id o6so7114772oag.0
        for <linux-next@vger.kernel.org>; Mon, 24 Feb 2014 06:46:17 -0800 (PST)
In-Reply-To: <530247FC.90606@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Bjorn Andersson <Bjorn.Andersson@sonymobile.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>

On Mon, Feb 17, 2014 at 6:33 PM, Randy Dunlap <rdunlap@infradead.org> w=
rote:
> On 02/16/2014 10:23 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> If you see failures in building this tree due to missing declaration=
s of
>> k..alloc/free, then it may be caused by commit 2bd59d48ebfb ("cgroup=
:
>> convert to kernfs").  Please send Tejun Heo <tj@kernel.org> a patch
>> adding an inclusion of linux/slab.h to the appropriate file(s).
>>
>> This tree fails (more than usual) the powerpc allyesconfig build.
>>
>> Changes since 20140214:
>>
>
> on i386:
>
> ERROR: "handle_bad_irq" [drivers/pinctrl/pinctrl-msm.ko] undefined!

Weird, Bj=F6rn do you know what may be causing this?

Yours,
Linus Walleij
