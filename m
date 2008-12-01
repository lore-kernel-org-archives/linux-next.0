From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Mon, 1 Dec 2008 15:37:23 +1100
Message-ID: <20081201153723.bee5f756.sfr@canb.auug.org.au>
References: <20081201131029.58f6d00c.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.0811302150290.3314@localhost.localdomain>
	<20081201140233.cf65c890.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.0811302246100.3314@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Dec_2008_15_37_23_+1100_hFknXonaDf4lV7uy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33279 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753217AbYLAEhn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 30 Nov 2008 23:37:43 -0500
In-Reply-To: <alpine.LFD.2.00.0811302246100.3314@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__1_Dec_2008_15_37_23_+1100_hFknXonaDf4lV7uy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

On Sun, 30 Nov 2008 23:11:50 -0500 (EST) Len Brown <lenb@kernel.org> wrote:
>
> Your guess was correct -- the patch with the later commit time
> was the correct one to keep.
>=20
> This was my pilot error.  I updated the patch in my release tree
> and so you got the updated patch via Linus.  But I failed to update
> my test tree, so you got the old patch from my test tree.
>=20
> I've just re-constituted my test branch, so the old patch is gone,
> and with it this conflict.

OK, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Dec_2008_15_37_23_+1100_hFknXonaDf4lV7uy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkzagMACgkQjjKRsyhoI8wm9ACdFJQfeB3hJxkTq84xcsdSJuBY
OgwAn2EnTHwbXIvues+P47Nx9VaE3zAs
=6qBh
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Dec_2008_15_37_23_+1100_hFknXonaDf4lV7uy--
