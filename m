From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Wed, 14 Sep 2011 16:22:27 +1000
Message-ID: <20110914162227.4aa02bbbad3be0a9dacebda0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__14_Sep_2011_16_22_27_+1000_wQnV6LmwWmDubnGw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:50296 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751486Ab1INGWh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Sep 2011 02:22:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>

--Signature=_Wed__14_Sep_2011_16_22_27_+1000_wQnV6LmwWmDubnGw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

kernel/time/alarmtimer.c: In function 'alarmtimer_rtc_interface_setup':
kernel/time/alarmtimer.c:106:26: warning: ignoring return value of 'class_i=
nterface_register', declared with attribute warn_unused_result

Introduced by commit 8bc0dafb5cf3 ("alarmtimers: Rework RTC device
selection using class interface").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__14_Sep_2011_16_22_27_+1000_wQnV6LmwWmDubnGw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOcEgjAAoJEDMEi1NhKgbskfwH/3FKmxIDx7LQEnqRppJrhZLK
1UyMIeA8f8CROw8iAnMyj/68Gj0RWvZUkyc1FPxZ9xMJtx1QQrgJ3G3LzJeY3/4U
NQsAYiLSnWCVprStW1o1GFDhxjCDnZEIzitZiw7AyOFpYUqGZH/tEXR8I4cyiO44
34ccqeh+CEPuDpbBGK8IgDGjZPtWJ1yjqYU/BWXJVrYraYwPP+eM+CZvYIKGsSqp
d0qVj3GtngZJjr6zDu24PVZ+Ike3szteX3/boPJxmanPsdKEVYJ5EiunQbIjAY8x
XxaKEGiczwadiBqOLTE/oClWx6isTfp0w52GVT3X6M3bvG5MKu6jneb4aQ8hhKo=
=xy7q
-----END PGP SIGNATURE-----

--Signature=_Wed__14_Sep_2011_16_22_27_+1000_wQnV6LmwWmDubnGw--
