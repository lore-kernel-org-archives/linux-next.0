From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Tue, 6 Jan 2009 14:46:40 +1100
Message-ID: <20090106144640.4f358eef.sfr@canb.auug.org.au>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au>
	<200901051911.52923.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__6_Jan_2009_14_46_40_+1100_tmon0V2zFAB9QIbR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55733 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751047AbZAFDqu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 22:46:50 -0500
In-Reply-To: <200901051911.52923.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Christoph Lameter <clameter@sgi.com>

--Signature=_Tue__6_Jan_2009_14_46_40_+1100_tmon0V2zFAB9QIbR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Mon, 5 Jan 2009 19:11:52 +1030 Rusty Russell <rusty@rustcorp.com.au> wro=
te:
>
> On Monday 05 January 2009 14:02:39 Stephen Rothwell wrote:
> > Similarly with init/main.c, include/linux/percpu.h,
> > include/asm-generic/percpu.h and arch/x86/include/asm/percpu.h (though
> > against different commits/trees, of course).
>=20
> OK, here's the merge as I did it.  I've also attached a tarball of the fi=
les
> post-merge.

Sorry to put you to all this work, but Ingo has rendered it unneeded by
dropping the other patches.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__6_Jan_2009_14_46_40_+1100_tmon0V2zFAB9QIbR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkli1CAACgkQjjKRsyhoI8x1FgCfTHYO3YsJQvyPR3wWaUtODPYA
pWQAoLNnLWs/jdzVWlTI2G11vdA95u/V
=Jf9N
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Jan_2009_14_46_40_+1100_tmon0V2zFAB9QIbR--
