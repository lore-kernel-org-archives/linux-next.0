From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Labeled Networking tree for linux-next
Date: Thu, 24 Jul 2008 10:06:24 +1000
Message-ID: <20080724100624.6c6127ed.sfr@canb.auug.org.au>
References: <200807231244.45084.paul.moore@hp.com>
	<Xine.LNX.4.64.0807240415200.14401@us.intercode.com.au>
	<200807231619.39629.paul.moore@hp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__24_Jul_2008_10_06_24_+1000_K4M.d8rB7.f_gqtn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52129 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753907AbYGXAGc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jul 2008 20:06:32 -0400
In-Reply-To: <200807231619.39629.paul.moore@hp.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>
Cc: James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

--Signature=_Thu__24_Jul_2008_10_06_24_+1000_K4M.d8rB7.f_gqtn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, 23 Jul 2008 16:19:39 -0400 Paul Moore <paul.moore@hp.com> wrote:
>
> Yes, the labeled networking stuff usually affects both net/ and=20
> security/.  I really don't care how it gets into linux-next as long as=20
> it gets in at some point.  I sent the mail because the=20
> lblnet-2.6_testing tree (currently empty, but not for much longer) is=20
> currently being pulled into linux-next (I think it started in the=20
> initial push to move -mm into linux-next).
>=20
> If we don't decide to drop the labeled networking git tree from=20
> linux-next can we at least shift from using the lblnet-2.6_testing to=20
> the lblnet-2.6_next tree?

I have made the change.

I have no problem with trees coming into linux-next from more than one
source (see e.g. the wireless tree which is merged into the net tree).
In fact it can be useful so that you will discover conflicting changes in
the security and net trees before you have your tree merged into theirs.
I have moved your tree after both the net and security-testing trees
(that way if it gets merged into either of them its merge into linux-next
becomes a noop).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__24_Jul_2008_10_06_24_+1000_K4M.d8rB7.f_gqtn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiHx4AACgkQjjKRsyhoI8zPLQCfTFIVvrS8l1NKChbdpxK3ncw7
4FkAnjyZciX4m0haA6xE6qQFyBeEeon9
=qGEG
-----END PGP SIGNATURE-----

--Signature=_Thu__24_Jul_2008_10_06_24_+1000_K4M.d8rB7.f_gqtn--
