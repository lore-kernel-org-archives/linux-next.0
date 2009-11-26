From: Peter Ujfalusi <peter.ujfalusi@nokia.com>
Subject: Re: linux-next: workqueues tree build failure
Date: Thu, 26 Nov 2009 15:23:40 +0200
Message-ID: <200911261523.40952.peter.ujfalusi@nokia.com>
References: <20091126190050.3f9d7fef.sfr@canb.auug.org.au> <200911261344.32051.peter.ujfalusi@nokia.com> <1259239796.3062.20.camel@palomino.walls.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.105.134]:19662 "EHLO
	mgw-mx09.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753463AbZKZNZB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2009 08:25:01 -0500
In-Reply-To: <1259239796.3062.20.camel@palomino.walls.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ext Andy Walls <awalls@radix.net>
Cc: ext Mark Brown <broonie@opensource.wolfsonmicro.com>, ext Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>

On Thursday 26 November 2009 14:49:56 ext Andy Walls wrote:
>=20
> Peter,
>=20
> I would suspect using a single-threaded workqueue is better than a
> wake_up() of another thread.  IIRC, after queuing work, the workqueue=
's
> single thread may run almost immediately on the same processor.  With
> waking up sleeping threads, I've run into scheduler delays around 10 =
ms
> on a dual core x86_64 desktop system.

Hello Andy,

I have sent the patch which changes from rt to singlethread, I hope it =
fixes the=20
breakage in linux-next.
In short testing, when there is virtually no load on the system I can n=
ot see=20
any difference, which might change later.
But I'll keep in mind that probably I'm not going to better off with th=
e waking=20
up of a sleeping thread.

>=20
> Regards,
> Andy

Thanks,
P=E9ter
