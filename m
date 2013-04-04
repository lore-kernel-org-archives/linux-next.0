From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the wireless-next tree
Date: Thu, 4 Apr 2013 13:36:10 +1100
Message-ID: <20130404133610.ea48118208cbfc22f0fd3b73@canb.auug.org.au>
References: <20130404120043.794afc7dd061dcd3adac0fdb@canb.auug.org.au>
	<20130404120402.2384c71a6e1850ebe76d62e2@canb.auug.org.au>
	<515CD48D.9030607@lwfinger.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__4_Apr_2013_13_36_10_+1100_mx1z24=rs3Q9/Ydc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:59128 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932247Ab3DDCgU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Apr 2013 22:36:20 -0400
In-Reply-To: <515CD48D.9030607@lwfinger.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__4_Apr_2013_13_36_10_+1100_mx1z24=rs3Q9/Ydc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Larry,

On Wed, 03 Apr 2013 20:17:01 -0500 Larry Finger <Larry.Finger@lwfinger.net>=
 wrote:
>
> On 04/03/2013 08:04 PM, Stephen Rothwell wrote:
> >
> > On Thu, 4 Apr 2013 12:00:43 +1100 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> >>
> >> After merging the wireless-next tree, today's linux-next build (x86_64
> >> allmodconfig) produced this warning:
> >>
> >> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input =
file unused because linking not done
> >> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input =
file unused because linking not done
> >> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input =
file unused because linking not done
> >> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input =
file unused because linking not done
> >> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input =
file unused because linking not done
> >> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input =
file unused because linking not done
> >> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input =
file unused because linking not done
> >> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input =
file unused because linking not done
> >> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input =
file unused because linking not done
> >> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input =
file unused because linking not done
> >> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input =
file unused because linking not done
> >>
> >> I have no idea what caused that.
> >
> > Though I suspect commit 8b138d4898a0 ("rtlwifi: rtl8188ee: Enable build
> > of new driver") - I wonder if the gap between the "-I" and
> > "drivers/net/wireless/rtlwifi" added to ccflags-y is the cause?
> >
> > I am using gcc 4.6.3 if that matters.
>=20
> I use 4.7.2.
>=20
> I'll send a patch with the space removed to see if that helps.

I just tested without the space and it fixes the problem for my Debian
4.7.2 compiler.  Removing the space also fixes the problem with finding
include files (after I removed the "../" bits again).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__4_Apr_2013_13_36_10_+1100_mx1z24=rs3Q9/Ydc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRXOcaAAoJEECxmPOUX5FEhnsP/A17XBWTuZVGarKBvU3n+ydp
kETXa6sUWJswvjUTMZKiUhRpygNEIllcexI/aARgvaWSVTCUr+APoHYN3hf4pcDw
cjn+4yM7KXVvAyPr4S4ikdc4TNjMYOY+L7QyFzf2AGGgTiawgUvBPIAfx5sgtpr8
RFle+16FxYV8FYX2d3NFbaEBVku7fJsuC2fHeFjYKZoGnMlxUyB2JWiTsFKg9F6q
vRP7mLW13eS8F0Iy80GfGGISMeBhapRbZ3o76yghZpA2Ztgiug77wJJPECRPtxJt
XF9cznk3SgeGzl4D1Al75rHQJrISWquNtASF3sGWikG/LzGtcUj9jiwuPiX3tw6r
7s5xSRWJFI8z4CGPtFiTrPHqnYhmygthCu200MVkDVgtSxc3JoS3lhcH4sZl0R4p
E9L3T9A1S+RcxunlyCu9xIui/VKnfAmLSZPEZkOi6LUI/zAIkrUnZeEFsU+hCYi3
yMWuawaJtiByVRZ9rAXuzEixrP+P0+JjE0Ye91+YwXdWa7BPQXZqC8EcEXdpClIS
hwuKtQF/2EiCYjp0izF1Z/ids7bn6/x2J28pyf8hzAOMssrlZhTsJJDbubrUUkqu
7ibQ4SxzYmq0K1ZKPGgrBNam/rPunwnHJ6tLbjc8rFgjsVEDqoMmCiVcgj9AsvXG
SdacDqWZYitWKCyYkYx4
=W9BZ
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Apr_2013_13_36_10_+1100_mx1z24=rs3Q9/Ydc--
