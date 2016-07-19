From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the i2c tree
Date: Tue, 19 Jul 2016 14:55:08 +0200
Message-ID: <2710890.mOpJ0mpNYq@vostro.rjw.lan>
References: <20160715121723.0f21f148@canb.auug.org.au> <2565257.LbcJLfl1sl@vostro.rjw.lan> <20160719034806.GA1640@katana>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2512384.mcK8ytl6Fi"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:55014 "HELO
	cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752922AbcGSMuW (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Jul 2016 08:50:22 -0400
In-Reply-To: <20160719034806.GA1640@katana>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>


--nextPart2512384.mcK8ytl6Fi
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, July 19, 2016 05:48:07 AM Wolfram Sang wrote:
> 
> > > Well, not knowing much about ACPI, I just need the conflict resolution
> > > for my latest i2c/for-next and your above branch. If you want to do it,
> > > fine with me. But maybe Jarkko will be back to office on Monday, too.
> > 
> > Unfortunately, I don't see how these branches can be merged in a sensible
> > way without adding too much new code into the merge itself.
> > 
> > Something needs to be dropped and then rebased and applied again.
> 
> Okay, I'll drop the I2C parts. Next to the core parts which I will drop,
> there was also a driver patch making use of the core changes for which I
> requested some updates. Since those did not happen yet (Jarkko on
> holiday?), the core patches alone are not important anyhow.

Thanks a lot!

> Thanks for looking into it!

No problem.

Thanks,
Rafael

--nextPart2512384.mcK8ytl6Fi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCAAGBQJXjiMxAAoJEILEb/54YlRx/goQAJregX3vOEjUPgXZxJXGF3CC
V4zDb8mEyo1EUsgvMSuiJvdo88ExdX3c3Ddkd6kedchHGENtudTUf11kpmT9Dhpj
8DpnNXGcAJFq3e6hM/w5mzIWkJeyLkDjPxT6f3yGd0YE7QCY450SWVL6RfANazfU
uectcEUX/ZJ+avLhPeggBYWyxbnuFRdLdaKukNV/axy652pWK9G/tDZaMhjbpmUA
f1pTAUfs1Yf/Cpsun2nwVme796bsKmFwjBJUC36Y6swkgWkT8KuOq3jYEg/jraJf
9OMidb5IOIOT4TN7ggxSmpTCf55voOA0JCLKAemj8x443hZZlq+MLuyAQCWKNV8/
F8t0frX/naCTCgghKhibzpfgIdCnLX2w000HVial+xYVHSsQvEP5huflBsbfZeZU
Z1E4pTckY1RFWabmBA9JkytIMxh+L0BnzDL7rvvuWf2J9W1HcqvHjEhMnZTteMVx
jMuP61fZ/21y+mI6uW6EuGMybE1TVHoQl+XcRTGFJ9uIeefuY7+19pcxaO53l5MH
rLDuaR/xjZB++gdLk1MX/UwgBdaPvQLkM3fEK7akIhRNFYzHZCAwN8ngTvZCKYeB
2Nr7/CUrwJwD36YReG60m1k241+LMQCLENzPwy7B5Pl8AseDWlXkXBDc9b1xT4Ym
CnfTcxPww4sWuPIrjaH3
=POGd
-----END PGP SIGNATURE-----

--nextPart2512384.mcK8ytl6Fi--
