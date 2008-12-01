From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Mon, 1 Dec 2008 14:02:33 +1100
Message-ID: <20081201140233.cf65c890.sfr@canb.auug.org.au>
References: <20081201131029.58f6d00c.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.0811302150290.3314@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Dec_2008_14_02_33_+1100_gZ_NqmtO1iA73Iie"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42340 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752473AbYLADCw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 30 Nov 2008 22:02:52 -0500
In-Reply-To: <alpine.LFD.2.00.0811302150290.3314@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__1_Dec_2008_14_02_33_+1100_gZ_NqmtO1iA73Iie
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

On Sun, 30 Nov 2008 21:55:38 -0500 (EST) Len Brown <lenb@kernel.org> wrote:
>
> So if you pull the acpi tree into a copy of Linus' tree
> then this type of conflict will go away.

And if you pull Linus' tree into the acpi tree the conflict will go away
as well ... but you (who understand the intention of the code) get to fix
it up rather than me (who is guessing).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Dec_2008_14_02_33_+1100_gZ_NqmtO1iA73Iie
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkzU8kACgkQjjKRsyhoI8w49QCfQnzdX+sMpwz6IiKIYpva21+p
k6YAn2o8mNosQD7Zw99+0qSAoTY1aFM3
=jkWi
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Dec_2008_14_02_33_+1100_gZ_NqmtO1iA73Iie--
