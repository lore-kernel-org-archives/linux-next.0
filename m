From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Tue, 10 Jan 2012 03:27:46 +1100
Message-ID: <20120110032746.85a798e3586b75d3d4d46118@canb.auug.org.au>
References: <20120105190405.1e3191fb5a43b2a0f1655e1f@canb.auug.org.au>
	<20120105160448.dc482ef6.akpm@linux-foundation.org>
	<20120109165950.53933c3050416bd242acff76@canb.auug.org.au>
	<20120109172016.2496b94ce207c5f7f750a1ea@canb.auug.org.au>
	<20120109154259.GD9329@kroah.com>
	<1326124464.7642.27.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__10_Jan_2012_03_27_46_+1100_QfTQdwBDC6iF8x8J"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:55013 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755754Ab2AIQ1r (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Jan 2012 11:27:47 -0500
In-Reply-To: <1326124464.7642.27.camel@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Greg KH <greg@kroah.com>, Kay Sievers <kay.sievers@vrfy.org>, Andrew Morton <akpm@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>, Linus <torvalds@linux-foundation.org>

--Signature=_Tue__10_Jan_2012_03_27_46_+1100_QfTQdwBDC6iF8x8J
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Mon, 09 Jan 2012 10:54:24 -0500 Steven Rostedt <rostedt@goodmis.org> wro=
te:
>
> Stephen, what config does this trigger with?

sparc64 defconfig

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Jan_2012_03_27_46_+1100_QfTQdwBDC6iF8x8J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPCxWCAAoJEECxmPOUX5FEWX4P/1sHJcTmS70ZUwVTC5c8ztmx
8cGYJgJu5RPiAgQZzC1mQ338sFJYGFGJNOcda4sBTUSwez6mCmyo/c26m7BaBSuj
FkoS5aYN+5LuXUy+5pyjT8iZ5tS3/Os5qYPOkJ9010r8ZDo+MvqOLETYdi7cSJr7
D67P9AUT7ZT/Mb6I26W/QSp7jMsOTjzxSrU6fBtquoZDU/XTClllTo7eAr2xoVy3
4rxmA77Qs2MnzBe8MgPIb16TjJa6yFaY1bZ2W25u+63RyKeGMwsNcUCdDD3T5Grb
pZ45o/vRfhBGNfMQyrqdt0WTRYiApTVhOHl5omL4VpnH8vjoyMVCU6xkDc+907aV
V0og7+m/Uoxu+XfD/QzpWOCaOArAQ4x/El67OnXJKB95WSOiE9wgmMs8DZMgRN1k
MMjmJMuZXuVw0bc5mZe7EZTwdAEhvzGqSzRZEsigroWHno9hNbvL2up50pZWXwPJ
e7GWx2ZeMTuF7/mkatcz2VaMWY0Fy24c4Y5PElY5KLVq7i2dl3cyWsID7Z4ugZIX
tx5+VCm322Cqghh4mEPdAo84Z3e2Az/c9OBBBv2WvEb6TvHqtlcwVNQe2fGqMFOI
c7SxWtGa+l0afDdfCMp0nXPjVQob/UwbPfDPKsi6JYJakCyfBrmUdDXvwljXQZw/
cx0j4VlbJmyy0QdPy+vV
=d3U9
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Jan_2012_03_27_46_+1100_QfTQdwBDC6iF8x8J--
