From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: block tree build failure
Date: Wed, 3 Sep 2008 18:50:48 +1000
Message-ID: <20080903185048.ef457fbd.sfr@canb.auug.org.au>
References: <20080903161526.636b6d0d.sfr@canb.auug.org.au>
	<20080903063419.GK20055@kernel.dk>
	<20080903000418.aa2434fe.akpm@linux-foundation.org>
	<20080903070723.GL20055@kernel.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__3_Sep_2008_18_50_48_+1000_q1hYkcU27w5u_nya"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44875 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751528AbYICIu7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Sep 2008 04:50:59 -0400
In-Reply-To: <20080903070723.GL20055@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>

--Signature=_Wed__3_Sep_2008_18_50_48_+1000_q1hYkcU27w5u_nya
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens, Andrew,

On Wed, 3 Sep 2008 09:07:24 +0200 Jens Axboe <jens.axboe@oracle.com> wrote:
>
> On Wed, Sep 03 2008, Andrew Morton wrote:
> >=20
> > I get a nasty git reject around disk_seqf_next() from -next-20080902
> > and have yet to find a fix which doesn't oops all over the place.=20
> >=20
> > Am presently discommoded.  Please let this be fixed in -next-20080903 :(
>=20
> I've updated for-2.6.28 (and thus for-next and for-akpm), we also had a
> couple of merge errors that resulted in bad bisect compiles. So I think
> it should be ok now.

OK, I have reverted the previous merge of the block tree and merged the
new one (makes the linux-next tree look a little strange today, but
hopefully helps Andrew out).

I haven't released this yet (it will be -20080903 obviously) as I am
still build testing ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Sep_2008_18_50_48_+1000_q1hYkcU27w5u_nya
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki+T+gACgkQjjKRsyhoI8wNQACggRuVL8m3Hj9/nZAiqMEqKXfR
NBgAnjTIRS61CkePkoAEDlCdLNual8a/
=HKOb
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Sep_2008_18_50_48_+1000_q1hYkcU27w5u_nya--
