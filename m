From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: linux-next: build warning after merge of the rtc tree
Date: Mon, 11 Jul 2016 10:23:51 +0200
Message-ID: <20160711082351.GA10303@perseus.defre.kleine-koenig.org>
References: <20160711181208.2d60493a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160711181208.2d60493a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jul 11, 2016 at 06:12:08PM +1000, Stephen Rothwell wrote:
> After merging the rtc tree, today's linux-next build (x86 64_allmodconfig)
> produced this warning:
>=20
> drivers/rtc/rtc-isl12057.c: In function 'isl12057_rtc_read_alarm':
> drivers/rtc/rtc-isl12057.c:249:26: warning: unused variable 'alarm_secs' =
[-Wunused-variable]
>   unsigned long rtc_secs, alarm_secs;
>                           ^
> drivers/rtc/rtc-isl12057.c:249:16: warning: unused variable 'rtc_secs' [-=
Wunused-variable]
>   unsigned long rtc_secs, alarm_secs;
>                 ^
> drivers/rtc/rtc-isl12057.c:248:18: warning: unused variable 'rtc_tm' [-Wu=
nused-variable]
>   struct rtc_time rtc_tm, *alarm_tm =3D &alarm->time;
>                   ^
>=20
> Introduced by commit
>=20
>   4e30a585a343 ("rtc: isl12057: let the rtc core interpret the partial al=
arm")

Thanks for catching that. The obvious fix is:

diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
index e0245fc6205e..0e7f0f52bfe4 100644
--- a/drivers/rtc/rtc-isl12057.c
+++ b/drivers/rtc/rtc-isl12057.c
@@ -245,8 +245,7 @@ static int isl12057_rtc_update_alarm(struct device *dev=
, int enable)
 static int isl12057_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *=
alarm)
 {
 	struct isl12057_rtc_data *data =3D dev_get_drvdata(dev);
-	struct rtc_time rtc_tm, *alarm_tm =3D &alarm->time;
-	unsigned long rtc_secs, alarm_secs;
+	struct rtc_time *alarm_tm =3D &alarm->time;
 	u8 regs[ISL12057_A1_SEC_LEN];
 	unsigned int ir;
 	int ret;

Alexandre: Do you fixup, or should I send a proper patch for that?

Best regards
Uwe

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCgAGBQJXg1eUAAoJEMH8FHityuwJe9wH/RHME4V6lQqe/3tY70WCo3Tx
AI+h1DsEKKQvPdt4tjUgcH8wMaRpTvrRSNoPPg2DRjmzOqTrUMksW0pYKBHuDKgT
YqtZMDPjr3Gka40SJF6fu6FJqSt/gnbz0AivbbRsmFgArxRoNxYRnh1ikL69ylpv
VBk11rDDl1XSxYE95onHN8+bnKK3EQAnJygJu1e7X94B8K4eTjMXQNbVtR1dQx8o
7n1fwsCUXFTYQaouldz/6HO13CGI6ZSmFQmt81n+lsi95nO5kOAxK4fKGNUh/VPA
luc9jg7N4ap6Y/65WBMq7WpYn0Q8u5bJa9/8j4Q1ZiV9oUzbDw16o6YMCyiSm5A=
=gU3I
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
