From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Merge request for the Thumb-2 branch
Date: Thu, 9 Jul 2009 10:06:26 +1000
Message-ID: <20090709100626.1e40912d.sfr@canb.auug.org.au>
References: <1246035591.30717.54.camel@pc1117.cambridge.arm.com>
	<1247067269.6595.44.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__9_Jul_2009_10_06_26_+1000_JJrJjXNexhHhKHl2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60403 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755908AbZGIAGu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jul 2009 20:06:50 -0400
In-Reply-To: <1247067269.6595.44.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-next <linux-next@vger.kernel.org>

--Signature=_Thu__9_Jul_2009_10_06_26_+1000_JJrJjXNexhHhKHl2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

On Wed, 08 Jul 2009 16:34:29 +0100 Catalin Marinas <catalin.marinas@arm.com=
> wrote:
>
> On Fri, 2009-06-26 at 17:59 +0100, Catalin Marinas wrote:
> > Could you please merge the thumb-2 branch into linux-next:
> >=20
> >   git://linux-arm.org/linux-2.6.git thumb-2
> >=20
> > It adds support for compiling the ARM kernel to the Thumb-2 instruction
> > set (16 or 32 bit opcodes) and it makes sense to check it doesn't break
> > other things before the next merging window (it's a bit more intrusive
> > but limited to arch/arm/* files).
>=20
> (I'm replying to myself but I'd like to make sure this e-mail wasn't
> missed)

I am sorry, it disappeared into the morass of my inbox. :-(

> Russell - are you OK with getting this branch merged during the next
> window, assuming that any new comments are implemented and testing is
> fine? If there are other issues, please let me know.

>From previous comments that Russell has made, I think he is OK with arm
platforms being in linux-next separately (we already have 2 others), so I
will add this today.

What I tell everyone: all patches/commits in the tree/series must
have been:

	posted to a relevant mailing list
	reviewed
	unit tested
	destined for the next merge window (or the current release)

*before* they are included.  The linux-next tree is for integration
testing and to lower the impact of conflicts between subsystems in the
next merge window.

Basically, this should be just what you would send to Linus, or in this
case, Russell (or ask him to fetch).  It is allowed to be rebased if you
deem it necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__9_Jul_2009_10_06_26_+1000_JJrJjXNexhHhKHl2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpVNIIACgkQjjKRsyhoI8zQpQCgoDcRfmeM3shSVde2Uwcuyq5c
0YAAoJE3y0RJc7mnIMATwXvShVPI+6Qz
=9JWp
-----END PGP SIGNATURE-----

--Signature=_Thu__9_Jul_2009_10_06_26_+1000_JJrJjXNexhHhKHl2--
