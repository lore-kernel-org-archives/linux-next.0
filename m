From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Adding drm-intel-fixes branch to linux-next
Date: Wed, 10 Jul 2013 10:17:47 +1000
Message-ID: <20130710101747.444eff65dd00e98629352807@canb.auug.org.au>
References: <CAKMK7uGTqticutONZqSoU4+tFS5q76HjFVrP-NteENLAYL4CVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__10_Jul_2013_10_17_47_+1000_wew5S0UaWYCwhJ.J"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:37938 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752143Ab3GJAR4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jul 2013 20:17:56 -0400
In-Reply-To: <CAKMK7uGTqticutONZqSoU4+tFS5q76HjFVrP-NteENLAYL4CVQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-next <linux-next@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>

--Signature=_Wed__10_Jul_2013_10_17_47_+1000_wew5S0UaWYCwhJ.J
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

HI Daniel,

On Tue, 9 Jul 2013 16:48:43 +0200 Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
>
> Can you please add the drm-intel-fixes branch to your linux-next tree
> on top of the for-linux-next branch you've already included from my
> drm-intel repo at git://people.freedesktop.org/~danvet/drm-intel ?
>=20
> I'm asking since I've merged a patch to -fixes late in the 3.10 cycle
> and despite that I've let it soak for almost two week in my -fixes
> branch it readily blew up once 3.10 shipped. I think that the added
> tester populace of linux-next could have prevented this gaffle. The
> bug report for reference:
>=20
> https://bugzilla.kernel.org/show_bug.cgi?id=3D60530
>=20
> Note that atm for-linux-next points at the same commit as
> drm-intel-fixes (since we're in the merge window), so adding this
> branch shouldn't add new conflicts. I just want to be ready after -rc1
> is tagged, since then I'll push our feature branch for 3.12 onto
> for-linux-next, which will kick the patches on -fixes out of
> linux-next.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Wed__10_Jul_2013_10_17_47_+1000_wew5S0UaWYCwhJ.J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJR3KgvAAoJEECxmPOUX5FETQoP/0yQUKShIERZt2oSoAoHaMCl
NsAIAsa0U9M7Ygp4Uk6b1w0O/6gWIVSy7bd/kzl3wY6LQQFtt1EAC6VVGyT0mipP
IEtBBDWEAomfIr6GswuK+NwbGmueStwaU/caghQjR51ChhSKwoEuX45QSUzouVfr
lbMBZoc+/sarWTNPS2vdpkYQW9BU6VkzAKnj+TUT0IqYJpqOXv6voe1YUlXffdZ4
ECqIMZIVQhEdz1LWbeaQne/j0+uZBaQkKohTfMhsGzB2E2WMzp2JzbRUrI/S2TUx
25TPQBl+P1vJYTzgpD7xm+XnljSyk0vRsc3ErZxlUoBgGpXqWqb00vg3RsQsY5Jb
JV60uzLe+ijMQ+yrru5iCAqpx/v711T2/dwJtXMAGWX3eD6VTUU+84truVOSExpo
k8H8TERXqJ0TEqbGtOj06YfN++BJ/U1UOa1jfUrqq1S4IFK6pEFBqDI8fW+jt3wB
MAuh3yD4tA2cAiV31jE8+Y6cjHzDcDusdwfE1YhFL0H/ZdoQazvptKswU4VqEFdT
JUAK7BT5HBemKKP6pnTgyCWsJOhdkMAz7ysoPKjhyZE/NlPEO3wRlChpoUCiCftN
9WY0aEKnX9Dyokr/KRnAARhdREWqEsT7o8P5i2WhgbREey7tDrhYyNk8nfeqf6WY
SrU3tecFOu9SEm08m7J2
=J4Yq
-----END PGP SIGNATURE-----

--Signature=_Wed__10_Jul_2013_10_17_47_+1000_wew5S0UaWYCwhJ.J--
