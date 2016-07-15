From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the i2c tree
Date: Fri, 15 Jul 2016 14:40:21 +0200
Message-ID: <3131753.BfBrDY1I4q@vostro.rjw.lan>
References: <20160715121723.0f21f148@canb.auug.org.au> <2993186.kRkeiY7GfT@vostro.rjw.lan> <20160715123253.GB2620@tetsubishi>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3079897.GfdoHoGgNk"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:47131 "HELO
	cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750772AbcGOMfj (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Jul 2016 08:35:39 -0400
In-Reply-To: <20160715123253.GB2620@tetsubishi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>


--nextPart3079897.GfdoHoGgNk
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, July 15, 2016 09:32:54 PM Wolfram Sang wrote:
> On Fri, Jul 15, 2016 at 02:19:28PM +0200, Rafael J. Wysocki wrote:
> > On Friday, July 15, 2016 12:28:53 PM Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > On Fri, 15 Jul 2016 12:17:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > I fixed it up (I think, but it needs more work - see below) and can
> > > 
> > > For a start, it generates this warning, now:
> > > 
> > > drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]
> > > static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 level,
> > >                    ^
> > 
> > OK, thanks for the heads-up.
> 
> Yes, thanks!
> 
> > 
> > Wolfram, what about if I exposed my "acpi-tables" branch for you to pull?
> > 
> > You could resolve this in your tree then.
> 
> I can pull it in, sure. For the fixup, I'd like a commitment from one of
> the ACPI experts (Jarkko, Mika, Andy), though. Otherwise I'd need to
> revert given that we are quite late in the cycle already.

Well, I can help with that too, I suppose.

Thanks,
Rafael

--nextPart3079897.GfdoHoGgNk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCAAGBQJXiNm6AAoJEILEb/54YlRxHdgQAKOHA5IyxHVaqcW19W04xLB/
mTsz80dCIARq06bYSAkQprpKSIB71xbVUC8/wC3fMMy9hPp3ErHAa7x7RUCbHbfY
EwqoguHanqr1+iD4J6c8M4Sjri1Z/LaP5LbsG3R8ce6+84DPZMoYj6VVPHrrDRYR
Scp2f+/9NoRMM6X1+i//X7fHqI5rm5mUj/DrVT5Dcc+yBEqMp7yKvCyq3RCFtOee
g7sX0Q+cKTP/qWjdu6ipvQQeIA6o5hy3a9HGux0pqq9VEMK80a+DjOQHjA8BVIJh
ZLnPFKctJMQMZ2+s/9aJIUGLpggMk3IDl12Ld0O5942QbgMpwMRHgbpFSLsTOA9p
b4sqSMGQF+rIfSmke8NN3xT87SySVzZ7VIgU5DGvZ0iW1AhoxQrtN+Ehz98OFCG1
m5YxY0xc7aUkqGhF+lQLGsywl8kJCvKbQ8CJleiTCCCsuhsiXclcFkUMdCtmMDlP
9VYHI49Cdx4zXpzSH96p0livEJvuI41tkxTbhSnXiA9zKCYhxo8JE0sh2FK7Owmu
ac5P+xLLL3GugI5eHI6XYNZMszeCRH/E4hBb/vt7SZo5zKuCeK+/jaKMFef5wiEO
c4OvP/jwtfEt38wn/iKkiCZvckpes3n6XDjlgbTRHCbxlTFupjb2unJfjJv+lmPr
4JTVTr7+eikSQTon0QqL
=8mzm
-----END PGP SIGNATURE-----

--nextPart3079897.GfdoHoGgNk--
