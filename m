From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: unnecessary merges in the v4l-dvb tree
Date: Thu, 30 Oct 2014 08:09:34 -0200
Message-ID: <20141030080934.154ff729@recife.lan>
References: <20141030092445.519a86ba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/DJ1v5vn2Tc2bp4VJHQ+S8vV"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51167 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756976AbaJ3KJt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Oct 2014 06:09:49 -0400
In-Reply-To: <20141030092445.519a86ba@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/DJ1v5vn2Tc2bp4VJHQ+S8vV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

Em Thu, 30 Oct 2014 09:24:45 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Mauro,
>=20
> I noticed that you have two unnecessary merges in the v4l-dvb tree
> (git://linuxtv.org/mchehab/media-next.git#master).  This is not
> entirely your fault.  Unfortunately, when you do
>=20
> git merge <signed tag>
>=20
> git will produce a merge commit even if it could have fast
> forwarded :-(.  Consequently, you have commits 1ef24960ab78 ("Merge tag
> 'v3.18-rc1' into patchwork") and d6d41ba1cb38 ("Merge remote-tracking
> branch 'linus/master' into patchwork") even though the patchwork branch
> in each case is included in the tag being merged.
>=20
> The only ways I know around this is to either merge the commit
> associated with the tag or do a (hard) reset to the tag.

A hard reset to the tag would likely be a bad idea, as it would break
the sub-maintainers trees that are based on my tree.

I generally use "git pull" for that, as the man page says that the
default behavior is to do fast forward:
       "--ff
           When the merge resolves as a fast-forward, only update
	   the branch pointer, without creating a merge commit.=20
	   This is the default behavior."

It seems that the man page is then outdated for signed tags, or,
eventually, we need to make --ff explicit on this case.

I'll try the approach of merging the associated commit next time,
but this is something that it is easy to forget.

>=20
> Linus, any thoughts?

Regards,
Mauro

--Sig_/DJ1v5vn2Tc2bp4VJHQ+S8vV
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUUg5mAAoJEAhfPr2O5OEV2FYP/1NdlzMt6scV1xO6MsDpU5/D
spxTMG/SxdWJWYinUinROBWUYHZTyYjSQWYZR9KDJdtMgC9/gldb0PJDF8ntL081
5upYLzpyMbbrxN7Z0BTzHIQDlxz7rwCA0G6u/pSvPmwPJlfC7Ym0Hix5VE9J4sHg
EfQMwG5hflZlVIHGb0bzrlVBp8pu1IGlhVxVGt5+H3Kzg8TnButbkmxoDWyIHcSy
MAQR9/N50/A0sknKWbijqBATxIT+1vrtmMu/KkfMeJlwhFbK+m+ftqW+YIqsrMzY
3OTwCxgcek4yAM/3JbuP83TYY7NX1cGkeU3rRyltAD3jbTiDfWkkqNV6Q05Htwmp
dwkKCmGc5jAw4t42KzXsuPnU8+iQlFwiXrXS9o9BxAPdCzjJXZ1n0KlfGWjqevdz
DmA/lyXMq660Lgy+3aSGOBBj8XJ0rN7O4VSzmmLQO1g1FeTVx/XiGi7ASjaVR4wr
LeAKLAJ4u53vz1W3Q8OFBDrGsG2OZpBX1QxgPCLFPHKbAkYoeW6x8SBr0erDglcN
bqwHiKRXrS+dUosOeAbe1WE4g2avKVA5vWhIxf5DNOGbK5EZOkCdLo6S8GczumIK
LRQ7haCC6L/MFXd1b3W4ypdJpInR9COY+mcMclycyatO2IekixJVVWW6GWk1WEFz
FCxB078CCZkOoj3kn3lE
=Q6cJ
-----END PGP SIGNATURE-----

--Sig_/DJ1v5vn2Tc2bp4VJHQ+S8vV--
