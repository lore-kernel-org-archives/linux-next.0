From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the lblnet tree with the
 security-testing tree
Date: Sat, 28 Mar 2009 11:21:17 +1100
Message-ID: <20090328112117.91d137ea.sfr@canb.auug.org.au>
References: <20090327161957.2bb234d4.sfr@canb.auug.org.au>
	<200903271232.53524.paul.moore@hp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__28_Mar_2009_11_21_17_+1100_GHZbUJaZ_tFf9IvS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54532 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753257AbZC1AV0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Mar 2009 20:21:26 -0400
In-Reply-To: <200903271232.53524.paul.moore@hp.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Etienne Basset <etienne.basset@numericable.fr>

--Signature=_Sat__28_Mar_2009_11_21_17_+1100_GHZbUJaZ_tFf9IvS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, 27 Mar 2009 12:32:53 -0400 Paul Moore <paul.moore@hp.com> wrote:
>
> Thanks, I'll take care of it today.  The problem is most likely due to th=
e=20
> "netlabel: Cleanup ..." patch as it needs to relocate the smack_host_labe=
l()=20
> function higher in the source file as it is need earlier.

Thanks.

> Also, just as a heads-up, I'm going to be posting the labeled networking=
=20
> patches for 2.6.30 later this afternoon which should help in the future (=
they=20
> are typically pulled in via James' security-testing tree).

OK.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__28_Mar_2009_11_21_17_+1100_GHZbUJaZ_tFf9IvS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknNbX0ACgkQjjKRsyhoI8wttQCeMVDysamPkLxAjuYZrp0pKVXA
gUsAniCXNKZFgoMELliUv3ro1Z3dycqL
=Uc0J
-----END PGP SIGNATURE-----

--Signature=_Sat__28_Mar_2009_11_21_17_+1100_GHZbUJaZ_tFf9IvS--
