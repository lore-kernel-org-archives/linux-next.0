From: Peter Ujfalusi <peter.ujfalusi@nokia.com>
Subject: Re: linux-next: workqueues tree build failure
Date: Thu, 26 Nov 2009 10:16:58 +0200
Message-ID: <200911261016.58810.peter.ujfalusi@nokia.com>
References: <20091126190050.3f9d7fef.sfr@canb.auug.org.au> <4B0E3677.6000603@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759623AbZKZISb@vger.kernel.org>
In-Reply-To: <4B0E3677.6000603@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ext Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

Hello,

On Thursday 26 November 2009 10:04:07 ext Tejun Heo wrote:
> 11/26/2009 05:00 PM, Stephen Rothwell wrote:
> > Hi Tejun,
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >
> > sound/soc/codecs/tlv320dac33.c: In function 'dac33_i2c_probe':
> > sound/soc/codecs/tlv320dac33.c:1121: error: implicit declaration of
> > function 'create_rt_workqueue' sound/soc/codecs/tlv320dac33.c:1121:
> > warning: assignment makes pointer from integer without a cast
> >
> > Caused by commit 1b2d88bf4c63ed3a8c9033c358905d3463aa8bc2 ("stop_ma=
chine:
> > reimplement without using workqueue") (which removed create_rt_work=
queue
> > ()) interacting with commit c8bf93f0fe8c5a509a29e30f3bac823fa0f6d96=
e
> > ("ASoC: Codec driver for Texas Instruments tlv320dac33 codec") from=
 the
> > sound tree.
> >
> > I have no idea how to fix this, so I have used the workqueues tree =
from
> > next-20091125 until someone can suggest a solution.
>=20
> Takashi, RT workqueue is going away.  Do you really need it?

What can be used instead of RT workqueue?
The tlv320dac33 needs RT workqueue because I need to send the I2C comma=
nd with=20
minimum delay to the codec. If this can not be done (the workqueue is d=
elayed),=20
and the codec does not receive the command in time, it will literally d=
ie.

What are the options to replace the RT workqueue?

>=20
> Thanks.
>=20

--=20
P=E9ter
