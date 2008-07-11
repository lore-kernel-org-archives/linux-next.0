From: Ingo Molnar <mingo@elte.hu>
Subject: Re: today's linux-next fails to boot
Date: Fri, 11 Jul 2008 15:59:37 +0200
Message-ID: <20080711135937.GA25004@elte.hu>
References: <4877400B.1000400@gmail.com> <s5hy747rvpr.wl%tiwai@suse.de> <48775C69.6050107@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:39341 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759675AbYGKN7s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 09:59:48 -0400
Content-Disposition: inline
In-Reply-To: <48775C69.6050107@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?iso-8859-1?B?VPZy9ms=?= Edwin <edwintorok@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>


* T=F6r=F6k Edwin <edwintorok@gmail.com> wrote:

> > [Added Ingo to Cc]
> >
> > I get the boot problem on i386 with 2008-07-11 linux-next tree, too=
=2E
> > In my case, no error appears on the screen, just staying blank and
> > dead.  It seems stopping at the very beginning, soon after GRUB, so
> > could be the same reason.
> >  =20
>=20
> I don't see any boot messages on the screen, I get that BUG message a=
s
> soon as grub's menu dissapears.
> I have bisected it to this range so far:
> git-bisect good aa03060a78c1aec53075a0c8ca7be19cedfbea8f
> git-bisect bad b1611c0058bc6635e7257e755c3f194933a7a6df
>=20
> Should I continue to bisect?

could you check latest tip/master, does it boot fine with the same=20
config?

	Ingo
