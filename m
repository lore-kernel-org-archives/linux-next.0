From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Wed, 8 Apr 2015 18:25:07 +1000
Message-ID: <20150408182507.734b551a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VjihFZDA8FnbH=uqN._gdd1"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37357 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751132AbbDHIZO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Apr 2015 04:25:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>, Xunlei Pang <pang.xunlei@linaro.org>

--Sig_/VjihFZDA8FnbH=uqN._gdd1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
drivers/rtc/class.c between commit 0fa88cb4b82b ("time, drivers/rtc:
Don't bother with rtc_resume() for the nonstop clocksource") from the
tip tree and commit df9d6ec42558 ("rtc: restore alarm after resume")
from the akpm-current tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/rtc/class.c
index c29ba7e14304,d46549ce8fd9..000000000000
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@@ -55,7 -55,9 +55,9 @@@ static int rtc_suspend(struct device *d
  	struct timespec64	delta, delta_delta;
  	int err;
 =20
+ 	rtc->valid_alarm =3D !rtc_read_alarm(rtc, &rtc->alarm);
+=20
 -	if (has_persistent_clock())
 +	if (timekeeping_rtc_skipsuspend())
  		return 0;
 =20
  	if (strcmp(dev_name(&rtc->dev), CONFIG_RTC_HCTOSYS_DEVICE) !=3D 0)
@@@ -102,7 -104,28 +104,28 @@@ static int rtc_resume(struct device *de
  	struct timespec64	sleep_time;
  	int err;
 =20
+ 	/*
+ 	 * Ensure that the platform hasn't overwritten a pending alarm while
+ 	 * suspended
+ 	 */
+ 	if (rtc->valid_alarm) {
+ 		long now, scheduled;
+=20
+ 		rtc_read_time(rtc, &tm);
+ 		rtc_tm_to_time(&rtc->alarm.time, &scheduled);
+ 		rtc_tm_to_time(&tm, &now);
+=20
+ 		/* Clear the alarm registers if it went off during suspend */
+ 		if (scheduled <=3D now) {
+ 			rtc_time_to_tm(0, &rtc->alarm.time);
+ 			rtc->alarm.enabled =3D 0;
+ 		}
+=20
+ 		if (rtc->ops && rtc->ops->set_alarm)
+ 			rtc->ops->set_alarm(rtc->dev.parent, &rtc->alarm);
+ 	}
+=20
 -	if (has_persistent_clock())
 +	if (timekeeping_rtc_skipresume())
  		return 0;
 =20
  	rtc_hctosys_ret =3D -ENODEV;

--Sig_/VjihFZDA8FnbH=uqN._gdd1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJOXnAAoJEMDTa8Ir7ZwV5/kP/RPh5Z1EbxeeuaupMJrGmr0C
ZtPBBqGbxLFyDbvCuryUh/V1b1b/jEaerkVOTDORGL3eAEWch5kD05VXsREPE7kM
cqoK1N8st6GaprOPO2cP0AF/FKnmVX254abtTzLgnShN6knx+ldKhGwj0yF4cA9X
7jwLvbHQKzQ+tJK7szZKvNGRIJcLNWyGVde19MX8xuHsG4jOK9MSrwjt06wufdeQ
d74WM5ZIjJyqb/R9FUqkod5eQ/J3vsOjXiWhUdb+DS/OroRKKsMTUO0uIELO93WC
X/NjQOC+hgo6+Rztxj5Fpo8F/GrQqFaDRTEfpPH3RT3/Ee1JhxTtohRfRmjTGnfL
o5ktLVpzSJKoWyfyWrL6yw6ut9mMlnwOQnX+hYWQ3zuO+b+2DcQMbUMas0UrbY5p
mPF0RQZJkXEecmZF/iyUnoAj5NIoj4B2Qz1POqKCgVO7wni8XzEP6WiByBJ7O04H
hMb03JeLP6DGFex+yrjkvxm+Bbq5Sd2DeWlzecyVyrDQAl+0dip0PF6jzka73MtN
Yo5BuPYxBf5Mug0K9ZlGt1G0/NKe+oG3nxylAa7f46PiKdynCw+XbeGwHvWYm3NS
nYtBovcVgwNRhmOubhDhn9FKSEzNUTav1MeVxdVbizUdpOocgnpF2jDGXnnZIYRo
Jev4CdqKMy9hMqLe6w0V
=V+lX
-----END PGP SIGNATURE-----

--Sig_/VjihFZDA8FnbH=uqN._gdd1--
