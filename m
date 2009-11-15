From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: i7core_edac tree build failure
Date: Mon, 16 Nov 2009 10:30:02 +1100
Message-ID: <20091116103002.82e8a2bb.sfr@canb.auug.org.au>
References: <20091112165852.855d1e5d.sfr@canb.auug.org.au>
	<200911122340.26317.rusty@rustcorp.com.au>
	<20091113105435.1b9b0060.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Nov_2009_10_30_02_+1100_Dp9Xi_pcN.wW+IZN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50975 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751156AbZKOXaI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Nov 2009 18:30:08 -0500
In-Reply-To: <20091113105435.1b9b0060.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aristeu Rozanski <aris@redhat.com>

--Signature=_Mon__16_Nov_2009_10_30_02_+1100_Dp9Xi_pcN.wW+IZN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Fri, 13 Nov 2009 10:54:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Yeah, the i7core_edac fix needs to stay in my tree as it is an
> interaction between two trees in linux-next.  The others should be
> applied to the powerpc and sparc trees, as you say, since they fix the
> current code in those trees.

Actually, Mauro, this patch should be applied to the i7core_edac as that
symbol never needed to be exported and the patch to export it is in that
tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Nov_2009_10_30_02_+1100_Dp9Xi_pcN.wW+IZN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksAjvoACgkQjjKRsyhoI8z8MgCdG5KD7u75fcF+Q9F3ldMMKg2B
0dkAoLJcIUPCyajcgaPUWjAwU5j6D/yy
=CmpW
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Nov_2009_10_30_02_+1100_Dp9Xi_pcN.wW+IZN--
