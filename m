From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb tree build failure
Date: Thu, 30 Apr 2009 01:00:57 +1000
Message-ID: <20090430010057.d5a98bf9.sfr@canb.auug.org.au>
References: <20090429171752.f70c7de1.sfr@canb.auug.org.au>
	<20090429141519.GA3112@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__30_Apr_2009_01_00_57_+1000_9Vs+iZWwtziwVkUS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49790 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753651AbZD2PBF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 11:01:05 -0400
In-Reply-To: <20090429141519.GA3112@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Sarah Sharp <sarah.a.sharp@linux.intel.com>

--Signature=_Thu__30_Apr_2009_01_00_57_+1000_9Vs+iZWwtziwVkUS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, 29 Apr 2009 07:15:19 -0700 Greg KH <greg@kroah.com> wrote:
>
> They were all posted on the linux-usb mailing list, as they are a new
> USB controller (for USB 3.0), so they didn't need to be sent to lkml.
>=20
> But yes, the code does still need work, that is known, but a build
> failure wasn't known :)

This is what I tell maintainers of new trees being integrated into
linux-next:

"all patches/commits in the tree/series must have been:

	posted to a relevant mailing list
	reviewed
	unit tested
	destined for the next merge window (or the current release)

*before* they are included.  The linux-next tree is for integration
testing and to lower the impact of conflicts between subsystems in the
next merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary."

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__30_Apr_2009_01_00_57_+1000_9Vs+iZWwtziwVkUS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn4a6kACgkQjjKRsyhoI8wcjQCguRb1CusLQzP+EXR+sCUqnYCv
i30AoJu6rXXXHanzJU5FrrXNp0wiOo1i
=hJJC
-----END PGP SIGNATURE-----

--Signature=_Thu__30_Apr_2009_01_00_57_+1000_9Vs+iZWwtziwVkUS--
