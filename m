From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next blackfin builds
Date: Fri, 12 Aug 2011 13:17:50 +1000
Message-ID: <20110812131750.73f1257494fd7dad45c96131@canb.auug.org.au>
References: <CAMjpGUe_zTuXMNNQfnpg3Tueijr=CCXpPG7JOP9tqNNtC2wsrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Aug_2011_13_17_50_+1000_Fjs0KAZRZFtN6ioq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58392 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752639Ab1HLDSB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Aug 2011 23:18:01 -0400
In-Reply-To: <CAMjpGUe_zTuXMNNQfnpg3Tueijr=CCXpPG7JOP9tqNNtC2wsrw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-next@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org

--Signature=_Fri__12_Aug_2011_13_17_50_+1000_Fjs0KAZRZFtN6ioq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Thu, 11 Aug 2011 21:50:09 -0400 Mike Frysinger <vapier.adi@gmail.com> wr=
ote:
>
> the linux-next website doesnt seem to cover the build system other
> than to link to it.  all Blackfin defconfigs should be buildable, and
> are in fact being built right now on a nightly basis on ADI systems.
> is there a way to plug those results into the site ?

For a long time we didn't have a blackfin cross compiler that worked.  We
are working on building one and when that is done, I will add the
blackfin configs the our build set (and the results will be on the kisskb
site).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Aug_2011_13_17_50_+1000_Fjs0KAZRZFtN6ioq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJORJteAAoJEDMEi1NhKgbsGfEH/09esVYyFygz++flWN24HgTk
+Fzo5gIjku9yPFaX4O54GcwKuWVR+MCu6FF7L4LFPjLGRtpWPMS0oArlo3V+LNC1
qr7R3EOKg+8RKy0jr2h8FnbVXB0Wyt8Bi3K4ESgpHW4H+XeAmjnXz237V3SU6BN2
KEm92K245Ie+JSTi6ykE9lZpUHDLfWSHKBKVMI3gQRm8ZZbbvP5mHcFkSJfCJfZ4
15KT0tbR351WS83VfWq34drzFcgH0fINMW24vxao+7PFXQLYJ5PPHSK15Yv0+8q3
jVDUQLaK/oTkl9bBZHWWai0T2xYDAAZluNkze0IaMLMfUoX08vxdrIqr5fFzHbg=
=1mJI
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Aug_2011_13_17_50_+1000_Fjs0KAZRZFtN6ioq--
