From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the sched tree
Date: Mon, 7 Jul 2008 16:35:39 +1000
Message-ID: <20080707163539.9a8a5119.sfr@canb.auug.org.au>
References: <20080707142114.7985a9dd.sfr@canb.auug.org.au>
	<20080707060251.GA16144@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_16_35_39_+1000_mHA2Q1s9L_Lly_Bo"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58952 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751819AbYGGGfs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 02:35:48 -0400
In-Reply-To: <20080707060251.GA16144@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Franck Bui-Huu <fbuihuu@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

--Signature=_Mon__7_Jul_2008_16_35_39_+1000_mHA2Q1s9L_Lly_Bo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 7 Jul 2008 08:02:51 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> > At this point, it would be nice for the places we know that other=20
> > subsystems need to start using rculist.h to be sent independent=20
> > patches to do that.  That means creating persusbsystem parts from the=20
> > latter commit above.  Once they have been integrated, then I can=20
> > remove several build fix patches that I am carrying in linux-next.  It=
=20
> > would have been good if we have done this quite a while ago.
>=20
> Well, it might have made sense a month or two ago, but now we are a week=
=20
> before the merge window so all this does is extra merge complications=20
> for me and others. So lets wait a week until tip/core/rcu hits upstream=20
> and then all these complications are resolved in one go, ok?

Yeah, that works as well.  I think I just wrote all that to make a point
and see if we can remember to do this sort of thing better and much
earlier next time.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_16_35_39_+1000_mHA2Q1s9L_Lly_Bo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhxuTsACgkQjjKRsyhoI8w3WACcCuhW1mcMM2uG5NigIuMDiYTZ
56YAn2btvjtpK1WvpjuQIubVy8Mzj1Wm
=+jxm
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_16_35_39_+1000_mHA2Q1s9L_Lly_Bo--
