From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Re: 2.6.28-rc3(-next20081103) suspend issues on Lenovo X200
Date: Mon, 3 Nov 2008 17:53:08 +0100
Message-ID: <20081103165308.GA27272@denkbrett.schottelius.org>
References: <20081103153945.GA20618@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:38213 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754618AbYKCQxj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 11:53:39 -0500
Content-Disposition: inline
In-Reply-To: <20081103153945.GA20618@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Update2:

Nico -telmich- Schottelius [Mon, Nov 03, 2008 at 04:39:45PM +0100]:
> 2.6.28-rc3 and 2.6.28-rc3-next-20081103: acpi_sleep=s3_bios

   - Switching to console before suspending makes
     everything work: suspend and wakeup, also when xorg is running.

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkPLHQACgkQuL75KpiFGIyHgACdGktab5b0avbGooNkBIDIMsX1
WBIAoORI9xbjmhtQnHWbhI4iTkuT4R0s
=Tedy
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
