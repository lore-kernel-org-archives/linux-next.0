From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: ccache: FATAL: Could not create /scratch/kisskb/ccache
Date: Sat, 3 Nov 2012 10:19:26 +1100
Message-ID: <20121103101926.4e48cf8e7f3f1d3de90e45a2@canb.auug.org.au>
References: <CAMuHMdXhYNQ_7JOC3u7CS41mxgSKkuFYA7QdjZgeBawqMZQ9-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Sat__3_Nov_2012_10_19_26_+1100__TrAMWIm9uFGpXff"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:38405 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752964Ab2KBXTi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Nov 2012 19:19:38 -0400
In-Reply-To: <CAMuHMdXhYNQ_7JOC3u7CS41mxgSKkuFYA7QdjZgeBawqMZQ9-g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Next <linux-next@vger.kernel.org>

--Signature=_Sat__3_Nov_2012_10_19_26_+1100__TrAMWIm9uFGpXff
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, 2 Nov 2012 19:44:48 +0100 Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/7458505/
>=20
> ccache: FATAL: Could not create
> /scratch/kisskb/ccache/d/7/f9e308f728ef43aaa482aefb9a00a2-852386.o.tmp.st=
dout.Sprygo.5748
> (permission denied?)
> make[4]: *** [drivers/media/rc/ene_ir.o] Error 1
>=20
> http://kisskb.ellerman.id.au/kisskb/buildresult/7461979/
>=20
> ccache: FATAL: Could not create
> /scratch/kisskb/ccache/5/e/47d893acad42c07542edec1f826579-1842636.o.tmp.s=
tdout.Sprygo.557
> (permission denied?)
> make[3]: *** [net/core/sock.o] Error 1

Well, that is weird.  I can't find any reason for that to happen :-(

I'll have a chat with the kisskb guy when I next see him.  Thanks for the
heads up.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__3_Nov_2012_10_19_26_+1100__TrAMWIm9uFGpXff
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQlFT+AAoJEECxmPOUX5FEwHUP/1kVC/yUIv87zYb5ZlA4GDdl
dvEbsfP5Ekk1mGc7FH0kQWcXv53sAx1HHcPhybgzUJRgq8THb1MZwet59/X3e/YM
rYb+veflOo7U+DreY9aK/R+zyUMq3q0GbZ3VGUssw9mAMMPPCdr95w4uZt74IYKO
kLX7QDsLlHQIAoNWBMSOeyBmNQKF8IuY6HNlxsQqlB+9h2qQAi00s0AWRUgIyHn5
4RrYpWReJ26OUMECvcU45L3457CHA17BOsBcZvAp6aKAKAEV17j5Pb9rb8RIn0C3
plMuSeXVQbbdi5vUaXD2fgqulKreCclo7/ZvH6TvOm8QJ44kzVH2TKAQGHFJGw/e
Bike9D3uTWK9bz/3QHMsHJMPSa6iv4bMZetp/ZVyyj6regAf4jJbkigWLEoYJPIL
eJfPAU9QxS+U4bcaoxPObrDcKwoqEA2kD0oZgmTTyXm1M/iL2EGiqN5e13wrka+T
h8g1wywFnSF527/fIlqsLsLxvh+s2CBYnAM0RqiVb9/d3oo9ll8FNJiGFCLMDkye
tFprekDHIa/7kFMEQE2Mx45M8Pa524CO3w19Z6sYIP54dxHORSfJOfI7Rxzg0gp4
yIhArnSYb+l3FYDoumD7ExhwS/ZLQzyF5elFbxa01je/vFH7IhTqQ9fr61Py+cb3
g3oGma797vlRS0pAW7bG
=+HP0
-----END PGP SIGNATURE-----

--Signature=_Sat__3_Nov_2012_10_19_26_+1100__TrAMWIm9uFGpXff--
