From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for June 19
Date: Sat, 20 Jun 2009 15:04:33 +1000
Message-ID: <20090620150433.4e038676.sfr@canb.auug.org.au>
References: <20090619172622.05adb236.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.0906200012200.4325@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__20_Jun_2009_15_04_33_+1000_9vmqoH9r1cbeZ5dE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33495 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750800AbZFTFEe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2009 01:04:34 -0400
In-Reply-To: <alpine.LFD.2.00.0906200012200.4325@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfi-devel@simplefirmware.org

--Signature=_Sat__20_Jun_2009_15_04_33_+1000_9vmqoH9r1cbeZ5dE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

On Sat, 20 Jun 2009 00:16:49 -0400 (EDT) Len Brown <lenb@kernel.org> wrote:
>
> Please add the Simple Firmware Interface "sfi-test" branch to linux-next:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux-sfi-2.6.git sfi-=
test

Is this 2.6.31 or 32 material?

> A description of the project is on the SFI home page: http://simplefirmwa=
re.org/
>=20
> Note: like ACPI's test branch, this branch will be occasionally re-based
> as the patches in it evolve.

That's fine.

Should I put just you as the contact, or add the mailing list as well?

What I tell everyone: all patches/commits in the tree/series must
have been:

	posted to a relevant mailing list
	reviewed
	unit tested
	destined for the next merge window (or the current release)

*before* they are included.  The linux-next tree is for integration
testing and to lower the impact of conflicts between subsystems in the
next merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__20_Jun_2009_15_04_33_+1000_9vmqoH9r1cbeZ5dE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko8beEACgkQjjKRsyhoI8x38ACeMMrXLaGOjXnrgTijHtSBV2px
XikAoLJqnTAN9Y2aJEZjetZGsfKVzweY
=TzLv
-----END PGP SIGNATURE-----

--Signature=_Sat__20_Jun_2009_15_04_33_+1000_9vmqoH9r1cbeZ5dE--
