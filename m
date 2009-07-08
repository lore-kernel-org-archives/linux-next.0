From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: block tree build failure
Date: Wed, 8 Jul 2009 13:17:13 +1000
Message-ID: <20090708131713.61d9ea7b.sfr@canb.auug.org.au>
References: <20090707134908.e81b1556.sfr@canb.auug.org.au>
	<20090707063846.GY23611@kernel.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__8_Jul_2009_13_17_13_+1000_ifansJvVkVi/1a.d"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60013 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756823AbZGHDRT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jul 2009 23:17:19 -0400
In-Reply-To: <20090707063846.GY23611@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Zhang, Yanmin" <yanmin_zhang@linux.intel.com>

--Signature=_Wed__8_Jul_2009_13_17_13_+1000_ifansJvVkVi/1a.d
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Tue, 7 Jul 2009 08:38:46 +0200 Jens Axboe <jens.axboe@oracle.com> wrote:
>
> That is correct! I have just now updated for-next as well, so your next
> pull should lose this fixup.

Except you left the call to wakeup_pdflush(0) in there ...  I will fix
that up while Christoph's concerns are addressed.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__8_Jul_2009_13_17_13_+1000_ifansJvVkVi/1a.d
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpUD7kACgkQjjKRsyhoI8xE+QCeIdeXC/aD6XXM/4WTZ2p0GNF3
BbwAnRz5x+gs2J7nvYNe9xbpjuDnWepL
=Z/JP
-----END PGP SIGNATURE-----

--Signature=_Wed__8_Jul_2009_13_17_13_+1000_ifansJvVkVi/1a.d--
