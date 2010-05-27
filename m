From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the acpi tree
Date: Thu, 27 May 2010 15:29:14 +1000
Message-ID: <20100527152914.67e34f2f.sfr@canb.auug.org.au>
References: <20100527144111.84b2e651.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.1005270113170.4039@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__27_May_2010_15_29_14_+1000_L8q1r9T2779tYFo4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49295 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751039Ab0E0F3Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 27 May 2010 01:29:24 -0400
In-Reply-To: <alpine.LFD.2.00.1005270113170.4039@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__27_May_2010_15_29_14_+1000_L8q1r9T2779tYFo4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

On Thu, 27 May 2010 01:14:21 -0400 (EDT) Len Brown <lenb@kernel.org> wrote:
>
> > drivers/idle/intel_idle.c:324: warning: unused variable 'cstate'
>=20
> fixed in the latest version.

Thanks.

How about "acpi: update gfp/slab.h includes"?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__27_May_2010_15_29_14_+1000_L8q1r9T2779tYFo4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkv+AyoACgkQjjKRsyhoI8x+oQCcCI766yiYfkUFs3bJ/NndSd7Z
IC0AoIFjmQ8rJeePGEL6qIPd4Voh8PDe
=vgKy
-----END PGP SIGNATURE-----

--Signature=_Thu__27_May_2010_15_29_14_+1000_L8q1r9T2779tYFo4--
