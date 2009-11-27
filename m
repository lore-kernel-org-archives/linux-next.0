From: Peter Ujfalusi <peter.ujfalusi@nokia.com>
Subject: Re: linux-next: workqueues tree build failure
Date: Fri, 27 Nov 2009 12:09:18 +0200
Message-ID: <200911271209.18979.peter.ujfalusi@nokia.com>
References: <20091126190050.3f9d7fef.sfr@canb.auug.org.au> <s5h3a40pdm7.wl%tiwai@suse.de> <4B0F90F3.2010204@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.105.134]:42267 "EHLO
	mgw-mx09.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753105AbZK0KKV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2009 05:10:21 -0500
In-Reply-To: <4B0F90F3.2010204@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ext Tejun Heo <tj@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Andy Walls <awalls@radix.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

Hello,

On Friday 27 November 2009 10:42:27 ext Tejun Heo wrote:
> Hello,
>=20
> 11/27/2009 05:37 PM, Takashi Iwai wrote:
> >> Sounds like it should be using bottom half tasklet not workqueue.
> >> Tasklet is exactly designed to handle situations like this.  Is th=
ere
> >> any reason tasklet can't be used?
> >
> > Right now the h/w accessing code is using mutex.  I'm not sure whet=
her
> > the deeper part might sleep, though...
>=20
> Ah... I see.  Using mutex from a handler where response time is
> critical is strange tho.  Anyways, I don't really think singlethread
> will satisfy the timing requirement under loaded conditions.  IMHO,
> update locking and using tasklets would be the best.

Hmmm, yes, I'm aware that it might be not sufficient to use the singlet=
hread wq,=20
but that was the fastest fix that I could think of, and it was needed f=
or the=20
linux-next.
In case of the tlv320dac33 driver, I can also play with the codec as we=
ll to=20
adjust the required latency, but if I hit the wall, than for sure I wil=
l look=20
for another solution for the problem.
So far this is working for my development needs, but time will tell if =
I need to=20
make bigger modifications.

=46or the record: on OMAP platforms the I2C implementation is sleeping =
during the=20
transfer (internally using interrupt based transfer), which might be no=
t that=20
wise in the tasklet. Since the I2C bus is kind of a slow bus, this coul=
d take=20
several ms in some cases.

Thank you,
P=E9ter
