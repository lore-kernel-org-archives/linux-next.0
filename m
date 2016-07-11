From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: build warning after merge of the rtc tree
Date: Mon, 11 Jul 2016 23:23:40 +0200
Message-ID: <20160711212340.GS22202@piout.net>
References: <20160711181208.2d60493a@canb.auug.org.au>
 <20160711082351.GA10303@perseus.defre.kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:54045 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751157AbcGKVXm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Jul 2016 17:23:42 -0400
Content-Disposition: inline
In-Reply-To: <20160711082351.GA10303@perseus.defre.kleine-koenig.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/07/2016 at 10:23:51 +0200, Uwe Kleine-K=F6nig wrote :
> Hello,
>=20
> On Mon, Jul 11, 2016 at 06:12:08PM +1000, Stephen Rothwell wrote:
> > After merging the rtc tree, today's linux-next build (x86 64_allmod=
config)
> > produced this warning:
> >=20
> > drivers/rtc/rtc-isl12057.c: In function 'isl12057_rtc_read_alarm':
> > drivers/rtc/rtc-isl12057.c:249:26: warning: unused variable 'alarm_=
secs' [-Wunused-variable]
> >   unsigned long rtc_secs, alarm_secs;
> >                           ^
> > drivers/rtc/rtc-isl12057.c:249:16: warning: unused variable 'rtc_se=
cs' [-Wunused-variable]
> >   unsigned long rtc_secs, alarm_secs;
> >                 ^
> > drivers/rtc/rtc-isl12057.c:248:18: warning: unused variable 'rtc_tm=
' [-Wunused-variable]
> >   struct rtc_time rtc_tm, *alarm_tm =3D &alarm->time;
> >                   ^
> >=20
> > Introduced by commit
> >=20
> >   4e30a585a343 ("rtc: isl12057: let the rtc core interpret the part=
ial alarm")
>=20
> Thanks for catching that. The obvious fix is:
>=20
> diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
> index e0245fc6205e..0e7f0f52bfe4 100644
> --- a/drivers/rtc/rtc-isl12057.c
> +++ b/drivers/rtc/rtc-isl12057.c
> @@ -245,8 +245,7 @@ static int isl12057_rtc_update_alarm(struct devic=
e *dev, int enable)
>  static int isl12057_rtc_read_alarm(struct device *dev, struct rtc_wk=
alrm *alarm)
>  {
>  	struct isl12057_rtc_data *data =3D dev_get_drvdata(dev);
> -	struct rtc_time rtc_tm, *alarm_tm =3D &alarm->time;
> -	unsigned long rtc_secs, alarm_secs;
> +	struct rtc_time *alarm_tm =3D &alarm->time;
>  	u8 regs[ISL12057_A1_SEC_LEN];
>  	unsigned int ir;
>  	int ret;
>=20
> Alexandre: Do you fixup, or should I send a proper patch for that?
>=20

I fixed it up. I shouldn't have missed that one...

--=20
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
