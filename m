From: Nico Schottelius <nico-linux-next@schottelius.org>
Subject: Re: Current suspend issues on Lenovo X200
Date: Thu, 23 Oct 2008 23:07:07 +0200
Message-ID: <20081023210707.GA5089@denkbrett.schottelius.org>
References: <20081023204326.GB4175@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:35564 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296AbYJWVYY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 17:24:24 -0400
Content-Disposition: inline
In-Reply-To: <20081023204326.GB4175@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

First of all, this was wrong:

Nico -telmich- Schottelius [Thu, Oct 23, 2008 at 10:43:26PM +0200]:
>  - 2.6.27: system freeze instead of wakeup
>    -> shows parts of the X screen, but does not react on ping

System does not freeze, but reboots instead.

Tried next-20081023 and 2.6.27 with acpi_sleep=s3_bios:

- suspend and wakeup on console works fine for both!
- no X running on next
- 2.6.27 + X -> reboot on wakeup

Nico

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkA53sACgkQuL75KpiFGIzsYwCg1Aau0azNz0RY7IAYKjJXox6b
kXQAni+hito4Aan49XHcbRfcEm1xfB9b
=ePu0
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
