From: Peter Ujfalusi <peter.ujfalusi@nokia.com>
Subject: Re: linux-next: workqueues tree build failure
Date: Thu, 26 Nov 2009 13:44:31 +0200
Message-ID: <200911261344.32051.peter.ujfalusi@nokia.com>
References: <20091126190050.3f9d7fef.sfr@canb.auug.org.au> <200911261131.15155.peter.ujfalusi@nokia.com> <20091126101859.GA27562@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.230]:45546 "EHLO
	mgw-mx03.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751665AbZKZLpd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2009 06:45:33 -0500
In-Reply-To: <20091126101859.GA27562@rakim.wolfsonmicro.main>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ext Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: ext Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>

On Thursday 26 November 2009 12:18:59 ext Mark Brown wrote:
> On Thu, Nov 26, 2009 at 11:31:15AM +0200, Peter Ujfalusi wrote:
> > For a quick fix, I can convert the tlv320dac33 driver to use this, =
and
> > revisit later, if it does not fulfill the timing requirements for t=
he HW.
>=20
> If there are problems then creating a dedicated thread you can wake
> would probably do the job.

=46or now I'm going to change the create_rt_workqueue to=20
create_singlethread_workqueue, that is available at the wq.git of kerne=
l.org.

If it is not sufficient, than I might use dedicated thread, which I wok=
e up, but=20
I would like to keep that as a backup plan, since it needs more work ;)

I'll send the patch in a few minutes.

--=20
P=E9ter
