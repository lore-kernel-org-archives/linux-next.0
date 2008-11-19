From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: spinlock lockup with next-20081118 on powerpc
Date: Thu, 20 Nov 2008 00:32:24 +1100
Message-ID: <20081120003224.8d0f481c.sfr@canb.auug.org.au>
References: <20081119093023.48895b84.sfr@canb.auug.org.au>
	<20081119091628.GT26308@kernel.dk>
	<20081119203922.0412c041.sfr@canb.auug.org.au>
	<20081119094300.GW26308@kernel.dk>
	<20081119213304.d2d21042.sfr@canb.auug.org.au>
	<20081119105833.GZ26308@kernel.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__20_Nov_2008_00_32_24_+1100_MeBzhtPhZulmxBmw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50888 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753004AbYKSNch (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 08:32:37 -0500
In-Reply-To: <20081119105833.GZ26308@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: ppc-dev <linuxppc-dev@ozlabs.org>, linux-next@vger.kernel.org

--Signature=_Thu__20_Nov_2008_00_32_24_+1100_MeBzhtPhZulmxBmw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Wed, 19 Nov 2008 11:58:33 +0100 Jens Axboe <jens.axboe@oracle.com> wrote:
>
> ;-) I'm aware of that, I meant the 'timer' data argument. But you are
> right, it's probably q->queue_lock being NULL here or we would have
> oopsed earlier. There's no code line.
>=20
> > address of the spinlock (though I need to check more to be sure) as it
> > crashed inside _spin_lock_irqsave.
>=20
> Do you know what device this might be? It still makes no sense, if the
> timer was added, we went through the normal IO paths and we would have
> crashed on NULL ->queue_lock much earlier.

I don't know much more, but I may find out tomorrow with Paul's help.
However it bisects down to commit
279430a72bb6e83d335b4219e9af5557e2ff3350 "block: leave the request
timeout timer running even on an empty list" and reverting that commit on
next-20081118 makes the spinlock lockup go away.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__20_Nov_2008_00_32_24_+1100_MeBzhtPhZulmxBmw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkkFWgACgkQjjKRsyhoI8yNKACdGMos5jpMAhzoQmYm0ILOlxQc
vdUAoKjqdD8HGS9BO6FDi8+tztdBeYQZ
=MeIW
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Nov_2008_00_32_24_+1100_MeBzhtPhZulmxBmw--
