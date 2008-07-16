From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the generic-ipi tree
Date: Wed, 16 Jul 2008 20:56:39 +1000
Message-ID: <20080716205639.4655ccca.sfr@canb.auug.org.au>
References: <20080716194517.fc260962.sfr@canb.auug.org.au>
	<20080716101921.GA16688@elte.hu>
	<20080716202521.ea91d90d.sfr@canb.auug.org.au>
	<20080716104012.GA2425@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_20_56_39_+1000_ZaTxXOkFbdrLLLaO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37425 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751042AbYGPK4z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 06:56:55 -0400
In-Reply-To: <20080716104012.GA2425@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org

--Signature=_Wed__16_Jul_2008_20_56_39_+1000_ZaTxXOkFbdrLLLaO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Wed, 16 Jul 2008 12:40:12 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> hm, so them being stale over the merge window is a problem for you, even=
=20
> thought the sha1's didnt change? Ok - i'll do a full integration run=20
> right away to update them all to linus-very-latest. There's been quite a=
=20
> number of nontrivial interactions.

Its not to bad except where what gets merged to Linus is not exactly what
is in linux-next.  This can be because they are sent to Linus as patches,
or the just the merge commits are are different.

However, once a tree is merged to Linus, just resetting resetting it to
be (a subset of) his tree (for some a fast forward for others not) makes
sense anyway.  (And makes my life easier :-))

So thanks for that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_20_56_39_+1000_ZaTxXOkFbdrLLLaO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh90+cACgkQjjKRsyhoI8yH7QCeIMeTASuAX9+9iDaT/GrcrK6k
MhEAoK0ueysSTGmU7o7j3+2XE/O6TNQ2
=PzK4
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_20_56_39_+1000_ZaTxXOkFbdrLLLaO--
