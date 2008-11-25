From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 15:13:45 +1100
Message-ID: <20081125151345.3f0ed493.sfr@canb.auug.org.au>
References: <20081125142105.2b6d464a.sfr@canb.auug.org.au>
	<1227584931.7622.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_15_13_45_+1100_t.w6ekVTcSH5kkUD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34590 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752999AbYKYEOI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 23:14:08 -0500
In-Reply-To: <1227584931.7622.11.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <srostedt@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Tue__25_Nov_2008_15_13_45_+1100_t.w6ekVTcSH5kkUD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Mon, 24 Nov 2008 22:48:51 -0500 Steven Rostedt <srostedt@redhat.com> wro=
te:
>
> Could you post a git branch that had this failure, so I can compile it
> to see what happened?

ssh://master.kernel.org/~sfr/ftrace master

to get the failure, I did:

make ARCH=3Dx86_64 allmodconfig
make ARCH=3Dx86_64 arch/x86/boot/tty.o

My machine is Debian sid.

$ gcc --version
gcc (Debian 4.3.2-1) 4.3.2
$ ld --version
GNU ld (GNU Binutils for Debian) 2.18.0.20080103

The original failure was with a gcc 4.3.2 cross compiled for a powerpc
host and a binutils 2.19.

You can see which trees are merged by looking for commits by me.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_15_13_45_+1100_t.w6ekVTcSH5kkUD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkre3kACgkQjjKRsyhoI8yIPgCfZMs/KH0Tlw6JpKExrEsOodKs
tgsAoKJGlL1v+GSyKgtg5zEkk5FFHUAc
=5NAX
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_15_13_45_+1100_t.w6ekVTcSH5kkUD--
