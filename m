From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc tree build failure
Date: Tue, 14 Apr 2009 13:45:41 +1000
Message-ID: <20090414134541.5acabe45.sfr@canb.auug.org.au>
References: <20090409151722.c8eabb56.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Apr_2009_13_45_41_+1000_UFvI5X5r=fzc1mNY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40249 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751463AbZDNDqM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2009 23:46:12 -0400
In-Reply-To: <20090409151722.c8eabb56.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Darren Hart <dvhltc@us.ibm.com>

--Signature=_Tue__14_Apr_2009_13_45_41_+1000_UFvI5X5r=fzc1mNY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 9 Apr 2009 15:17:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next build (sparc64 defconfig) failed like this:
>=20
> arch/sparc/kernel/built-in.o: In function `trap_init':
> (.init.text+0x4): undefined reference to `thread_info_offsets_are_bolixed=
_dave'
>=20
> Caused by commit 52400ba946759af28442dee6265c5c0180ac7122 ("futex: add
> requeue_pi functionality") (from the tip-core tree) which changed the
> size of struct restart_block.

This is still happening except the actual error has changed (due to the new=
 BUILD_BUG_ON):

arch/sparc/kernel/traps_64.c: In function 'trap_init':
arch/sparc/kernel/traps_64.c:2534: error: size of array 'type name' is nega=
tive

I applied the same patch.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Apr_2009_13_45_41_+1000_UFvI5X5r=fzc1mNY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknkBuUACgkQjjKRsyhoI8wXQgCgvs3TomAu4M4GCApP6YyQME4O
S40AnjsfhrHuWeNRZhmOhtTsUXrTl1ct
=4ORZ
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Apr_2009_13_45_41_+1000_UFvI5X5r=fzc1mNY--
