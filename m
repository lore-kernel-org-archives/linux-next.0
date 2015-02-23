From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Update for drm-intel.git branches
Date: Tue, 24 Feb 2015 06:05:12 +1100
Message-ID: <20150224060512.6d26e491@canb.auug.org.au>
References: <CAKMK7uHhCVaODBoi_uSWt7eXe6P04YvwT9XboobaWUQ9VxPBVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Xseu3xf3yrPgCedy34LXvbg"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40245 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752321AbbBWTFU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Feb 2015 14:05:20 -0500
In-Reply-To: <CAKMK7uHhCVaODBoi_uSWt7eXe6P04YvwT9XboobaWUQ9VxPBVQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-next <linux-next@vger.kernel.org>, "Nikula, Jani" <jani.nikula@linux.intel.com>

--Sig_/Xseu3xf3yrPgCedy34LXvbg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 3 Feb 2015 10:28:16 +0100 Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
>
> I've renamed the topic/core-stuff branch to topic/drm-misc in the
> drm-intel.git. I'll leave the old branch around until you've updated
> your scripts, please reply when you've done that.

I have updates that branch now.

> Another thing: Nowadays I have 2-3 special-purpose topic branches per
> kernel release, and at least with some of them I think it would be
> good to include them into linux-next. Would it be possible for your
> scripts to pick up the list of -next branches to pick up dynamically
> from some file? That would also simplify things with the
> for-linux-next branch, which is an alias to different branches
> depending upon where in the release cycle we are.

I can't think of an easy way to do that.  What others do is merge such
branches into a (stably named) branch that I include in linux-next.
When the topic branches get updated, you either just merge them into
the linux-next included branch again, or you reset that branch (to some
upstream) and remerge all the topic branches (like in the case when one
or more is not just fast forwarding or is removed).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Xseu3xf3yrPgCedy34LXvbg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU63nuAAoJEMDTa8Ir7ZwV3qkP/1t3rulq8xLkv4tav6ODzyzg
+WfAIzs/LQnD7p1RcrNnTz4j5N1y9pc0DvO85fgcq0lzApdalsPDDYatwdSZ9PE1
Dgsmc51z6has5sd/aoAFSGlIJ3CyQvIhpXP91aCJ8D/kM21DcwFOOfE6j35lkLlB
UTkBSHrSVOmp6bVwil9lXme64mIye0p1NOfHjJcnB3wrpXYaBB6qfJoWdA3nq6cL
nq+QeXK/PaSMw+B/Xp48jNnyczNJeBlUu4ROYZqXf1E2V7qwfix/YPW9zmLt2aj6
p8cBlUlsB65Uy9JVYirvRxkNueHQuem6DUWoiLGtaB589Tumyp1OJ9qHZIXhk1zp
coiLru/GZWvWfuEEEqVYd3m2ZJbfOMTgsPbHDg+3zASkAgzbnsmqHyRHrK9T2ZU8
ww6c5nmvyeTh/Zzaqd4Qt/aiF/izJiUH5t1WWJ3MeASPdne0MOdQpJI5jqIqbYx3
ackmfugbiER4ZqYq4wM0CKdNnZOWRMKGT07tBDXrwz/j4rL5v0EEMBOzdJQbJiSy
ubbajDJA2B4w5ypETtlTqr5O4TDsH0+2YEuhQ1CRcpNIewez7LdWlWGm6t7M2a95
Gn9yaSXuefeLRbeaQn3qoF9ClBj4Odknji6q2KZChJTrWt6wuDA2wo6Otf9q4u00
jiTZYQCdZZxsyhO4gXzR
=Toc+
-----END PGP SIGNATURE-----

--Sig_/Xseu3xf3yrPgCedy34LXvbg--
