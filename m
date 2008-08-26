From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] ftrace: only warn once on old objcopy and local
 functions
Date: Tue, 26 Aug 2008 15:47:21 +1000
Message-ID: <20080826154721.9416e2e9.sfr@canb.auug.org.au>
References: <20080825130117.33fe34bc.sfr@canb.auug.org.au>
	<20080825060934.GB14993@elte.hu>
	<alpine.DEB.1.10.0808251434000.23923@gandalf.stny.rr.com>
	<20080825190103.GA24029@elte.hu>
	<20080826094627.5d627b5b.sfr@canb.auug.org.au>
	<20080826115113.806cfe23.sfr@canb.auug.org.au>
	<alpine.DEB.1.10.0808252324050.966@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__26_Aug_2008_15_47_21_+1000_OBRQXw+DwLB9Nrvo"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44542 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751239AbYHZFrj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Aug 2008 01:47:39 -0400
In-Reply-To: <alpine.DEB.1.10.0808252324050.966@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Tue__26_Aug_2008_15_47_21_+1000_OBRQXw+DwLB9Nrvo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Mon, 25 Aug 2008 23:25:25 -0400 (EDT) Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
>   Stephen, can you try to see if this works for you, with the
>   issue of spamming warnings?

I get no warnings at all.  I think this is because I always build with
O=3D... so that the way you find $topdir (and therefore the .version file)
does not work.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__26_Aug_2008_15_47_21_+1000_OBRQXw+DwLB9Nrvo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkizmOkACgkQjjKRsyhoI8z7ZQCeJLRWeXHPgSNBQ/8A3GUVTh60
SaUAn3CiaTOUhNTbjQ2NYQLntp4FGmVi
=YFMD
-----END PGP SIGNATURE-----

--Signature=_Tue__26_Aug_2008_15_47_21_+1000_OBRQXw+DwLB9Nrvo--
