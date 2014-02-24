From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: linux-next: Tree for Feb 17 (pinctrl-msm)
Date: Mon, 24 Feb 2014 09:46:47 -0800
Message-ID: <20140224174646.GA32621@sonymobile.com>
References: <20140217172329.2c61499f57842ec2ed177bc5@canb.auug.org.au>
 <530247FC.90606@infradead.org>
 <CACRpkdamW1-CxZV65at3PaPhY5nANRDd=SY=FsNPVnrPxyD81w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([212.209.106.2]:18683 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752456AbaBXRqx convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Feb 2014 12:46:53 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdamW1-CxZV65at3PaPhY5nANRDd=SY=FsNPVnrPxyD81w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>

On Mon 24 Feb 06:46 PST 2014, Linus Walleij wrote:

> On Mon, Feb 17, 2014 at 6:33 PM, Randy Dunlap <rdunlap@infradead.org>=
 wrote:
> > On 02/16/2014 10:23 PM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> If you see failures in building this tree due to missing declarati=
ons of
> >> k..alloc/free, then it may be caused by commit 2bd59d48ebfb ("cgro=
up:
> >> convert to kernfs").  Please send Tejun Heo <tj@kernel.org> a patc=
h
> >> adding an inclusion of linux/slab.h to the appropriate file(s).
> >>
> >> This tree fails (more than usual) the powerpc allyesconfig build.
> >>
> >> Changes since 20140214:
> >>
> >
> > on i386:
> >
> > ERROR: "handle_bad_irq" [drivers/pinctrl/pinctrl-msm.ko] undefined!
>=20
> Weird, Bj=F6rn do you know what may be causing this?

I include linux/irq.h to get hold of handle_bad_irq() and as far as I c=
an see
there are no changes related to that in linux-next.

Do we know if the build still fails? Or if something changed?


Please let me know if I should pull down the -next tree and try to repr=
oduce
this.

>=20
> Yours,
> Linus Walleij

Regards,
Bjorn
