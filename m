From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] lockdep: warn about lockdep disabling after kernel
 taint, fix
Date: Tue, 14 Apr 2009 20:29:37 +1000
Message-ID: <20090414202937.b3af431f.sfr@canb.auug.org.au>
References: <20090414144317.026498df.sfr@canb.auug.org.au>
	<20090414091538.GI27003@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Apr_2009_20_29_37_+1000_Vp=oirx6LNFRkris"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754950AbZDNK34@vger.kernel.org>
In-Reply-To: <20090414091538.GI27003@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__14_Apr_2009_20_29_37_+1000_Vp=oirx6LNFRkris
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Tue, 14 Apr 2009 11:15:38 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> This opened up the path for someone eventually only including=20
> asm/atomic.h from generic code and breaking the architectures that=20
> only provide it via system.h. So i've queued up the fix below - this=20
> should address the problem on Sparc and s390.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Apr_2009_20_29_37_+1000_Vp=oirx6LNFRkris
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknkZZEACgkQjjKRsyhoI8wskgCghiF0uovgeY5ZRxHxwALFHynd
d80An36LDimcBloHzJMZcsp+da0BbJF6
=4TAL
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Apr_2009_20_29_37_+1000_Vp=oirx6LNFRkris--
