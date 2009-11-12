From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: i7core_edac tree build failure
Date: Fri, 13 Nov 2009 10:54:35 +1100
Message-ID: <20091113105435.1b9b0060.sfr@canb.auug.org.au>
References: <20091112165852.855d1e5d.sfr@canb.auug.org.au>
	<200911122340.26317.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Nov_2009_10_54_35_+1100_v.4AMIyzpkgDa6oU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51640 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755401AbZKLXyk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Nov 2009 18:54:40 -0500
In-Reply-To: <200911122340.26317.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aristeu Rozanski <aris@redhat.com>

--Signature=_Fri__13_Nov_2009_10_54_35_+1100_v.4AMIyzpkgDa6oU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty, Mauro,

On Thu, 12 Nov 2009 23:40:25 +1030 Rusty Russell <rusty@rustcorp.com.au> wr=
ote:
>
> Yep, thanks Stephen.  I can't apply this fix to my tree since that functi=
on
> isn't exported in Linus' tree.  I've pulled in the ppc and sparc fixes to=
 my
> tree though, but assume they'll go into their proper homes soon.

Yeah, the i7core_edac fix needs to stay in my tree as it is an
interaction between two trees in linux-next.  The others should be
applied to the powerpc and sparc trees, as you say, since they fix the
current code in those trees.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Nov_2009_10_54_35_+1100_v.4AMIyzpkgDa6oU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr8oDsACgkQjjKRsyhoI8zlOACfU/+JSC3PTtIeBN5f1zqqm5Nd
4DYAn3EjSbObWgCLZ0AnhBvbxEKru6wb
=B3tR
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Nov_2009_10_54_35_+1100_v.4AMIyzpkgDa6oU--
