From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the workqueues tree with the tip tree
Date: Mon, 27 Dec 2010 15:38:05 +1100
Message-ID: <20101227153805.a5447f74.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__27_Dec_2010_15_38_05_+1100_7qk_TMdP.bEUFc+N"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58486 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752703Ab0L0EiR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Dec 2010 23:38:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

--Signature=_Mon__27_Dec_2010_15_38_05_+1100_7qk_TMdP.bEUFc+N
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

Today's linux-next merge of the workqueues tree got a conflict in
drivers/rtc/rtc-dev.c between commit
042620a018afcfba1d678062b62e463b9e43a68d ("RTC: Remove UIE emulation")
from the  tree and commit 9db8995be5e1869b5effa117909bc285e06fc09b ("rtc:
don't use flush_scheduled_work()") from the workqueues tree.

The former removes the code that the latter modifies, so I used the
former.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__27_Dec_2010_15_38_05_+1100_7qk_TMdP.bEUFc+N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNGBgtAAoJEDMEi1NhKgbs3sgH/ikwmqL6e7rUcbvcUb8dkPZC
cgYxSxb5Dulxsby1kGNb5sgkTEruYaoxVR3ibste8kBRuxVzQZo7kuRRTIwT14ZP
PxzlO/zGmL8jjmsozOEs7HIrM6/Q6LMtxLgkoKFoCVztn1HYew5pJvLBnsBcxC1s
BqcuxTKVXwkEkmYnFwHJsPOcvdzORu5qK3Z5/rIkc5utt/YFlFDvRP4pOmkMvJqU
0WHq562zgnArE+yRyLBMmbn+fGgiKKWZvgoQDIZLQnJS78P8+fbyJwk7S7j8pq7X
Q9atcSCoZo1VFuMIrJKWf+FZonp8LMjhTPriOTbOXIlA0g8QS4Jif44KUDWZNzo=
=LsPF
-----END PGP SIGNATURE-----

--Signature=_Mon__27_Dec_2010_15_38_05_+1100_7qk_TMdP.bEUFc+N--
