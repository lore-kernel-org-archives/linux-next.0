From: Peter Ujfalusi <peter.ujfalusi@nokia.com>
Subject: Re: linux-next: workqueues tree build failure
Date: Thu, 26 Nov 2009 11:31:15 +0200
Message-ID: <200911261131.15155.peter.ujfalusi@nokia.com>
References: <20091126190050.3f9d7fef.sfr@canb.auug.org.au> <200911261016.58810.peter.ujfalusi@nokia.com> <4B0E467A.8080201@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.233]:46693 "EHLO
	mgw-mx06.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752808AbZKZJcZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2009 04:32:25 -0500
In-Reply-To: <4B0E467A.8080201@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ext Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Thursday 26 November 2009 11:12:26 ext Tejun Heo wrote:
> Hello,
>=20
> 11/26/2009 05:16 PM, Peter Ujfalusi wrote:
> >> Takashi, RT workqueue is going away.  Do you really need it?
> >
> > What can be used instead of RT workqueue?
> > The tlv320dac33 needs RT workqueue because I need to send the I2C
> > command with minimum delay to the codec. If this can not be done
> > (the workqueue is delayed), and the codec does not receive the
> > command in time, it will literally die.  What are the options to
> > replace the RT workqueue?
>=20
> The problem with RT workqueue is that RT and queue don't really mix
> well.  To act in real time, it requires all the resource pre-allocate=
d
> and dedicated to it making queueing or pooling meaningless.  The
> original workqueue code created dedicated pool of threads for each
> workqueue so it could be used for RT but new implementation uses
> shared worker pool, so it can't be used as an interface to dedicated
> threads.
>=20
> I haven't read the code but,
>=20
> * If you need to respond fast, wouldn't you be doing that from IRQ
>   handler or softirq?  Do you need task context?

I2C communication can not be done in interrupt context.
I'll take a look at the threaded IRQ, but AFAIK it is just a wrapper to=
 use the=20
global workqueue (I'm not sure, I have not actually checked it).
=46or a quick fix, I can convert the tlv320dac33 driver to use this, an=
d revisit=20
later, if it does not fulfill the timing requirements for the HW.

>=20
> * Or is it that it's not triggered by IRQ but once the transfer
>   started it can't be interrupted?  But in this case preempt_disable(=
)
>   or local_irq_disable() should suffice.

As Takashi already commented, it is used as a BH.

>=20
> Thanks.
>=20

--=20
P=E9ter
