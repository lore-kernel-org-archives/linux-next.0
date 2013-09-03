From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linus-next: update to the drm-intel-fixes tree
Date: Wed, 4 Sep 2013 09:45:41 +1000
Message-ID: <20130904094541.234e016eb3981d3b546c4cd1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__4_Sep_2013_09_45_41_+1000_chqsS9ASEPHhQbuQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:43099 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761447Ab3ICXpy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2013 19:45:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org

--Signature=_Wed__4_Sep_2013_09_45_41_+1000_chqsS9ASEPHhQbuQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

This morning after fetching the drm-intel-fixes tree, I have discovered
that you have just added a whole set of patches on top of Dave's drm tree
and made that the drm-intel-fixes tree.  I understood that this tree was
for fixes to Linus' tree for the current release cycle.  Given that
Dave's tree has not been merged by Linus (yet), this is a bit
inconsistent.  Not only that, but now if I merge your tree early (which
is what I do with the -fixes trees), I will also merge all of Dave's
tree.  That in turn would mean that I would have missed the (what would
have been automatically applied) merge for I am carrying for Dave's
tree.  :-(

I am going to have to drop your -fixes tree for today.

If these are fixes for stuff in Linus' tree, then they should have been
based on Linus' tree - if they are fixes for Dave's tree, then they
should have been in your drm-intel tree, right?

(fetches more trees ...)
And now, I discover that they are the latter :-)

So your -fixes tree will be dropped, but all those patches will still be
merged via you drm-intel tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__4_Sep_2013_09_45_41_+1000_chqsS9ASEPHhQbuQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJSJnSpAAoJEECxmPOUX5FEkE0P/iSkEgo6E4xfYc+ZPCb3C2Ex
3TBWejSBzMug2i0XKs9UbvEYty5otnJsj0EJcfxQ0H7e3dQBoVkbz3hVkelYbISc
ed49hNrTTG0AqisDjjk9CCadR7GxE4UJQG2F4LfQPOmscyP2jCuK/TL1qOqxeC7Y
YWp2/+0pM7bNqADGroqFRwSnLALxfGceQweSYR/cJ/OD5+2LxrRgTaq1cx2PC1v4
tb1tu1du5lDZv7VAY6ZnAAK5WLPw/6CIYpVzzSq7eTXA0uuJEMm4rfyx4ywwE7Ck
fz86aXb7Llr1UhUcLQGW3cnaLdSuWfMGJt0G4xNLKITLKT3omGBi4epbVhoNmJmA
7GGxgP6GxPiJuLiOjRrAQktc5SInlUumdpYMpTg5tSRbwH1lAdISki/2dUCASlZm
29wSmzzxA6HWVOMgs9ODvt7pziyIwJpn03gMOkWuOFQc5S9/NtCW8bXwaNv2cjnE
JJyyZHSZsOu7OMQ/2OEPbQcMT52aGecYXwRysjhsD1hSEeLOI+x/9/bFxvRuhYYl
/5mV60fErIPSPHCSVan644nOMnjt6oO7LZ6N9G42Rplb4VDAdx5D6wzYEtOXtDLz
5olYd2npNNz9R+AY8NQEat4Hh7Ju+lQQDhe0UT8+yWbW7Jmr02PEUONIK3HTwDrc
YReNOc0yCT7LuGEkllVY
=v7Op
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Sep_2013_09_45_41_+1000_chqsS9ASEPHhQbuQ--
