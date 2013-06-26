From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: please add queue for removal of __cpuinit and
 friends.
Date: Wed, 26 Jun 2013 11:22:02 +1000
Message-ID: <20130626112202.0929939fdc416f23d4bc06fa@canb.auug.org.au>
References: <20130625152702.GA27288@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__26_Jun_2013_11_22_02_+1000_7=K_hjgEs0eMM9eg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:36280 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314Ab3FZBWN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Jun 2013 21:22:13 -0400
In-Reply-To: <20130625152702.GA27288@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Wed__26_Jun_2013_11_22_02_+1000_7=K_hjgEs0eMM9eg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, 25 Jun 2013 11:27:02 -0400 Paul Gortmaker <paul.gortmaker@windriver=
.com> wrote:
>
> Would you please add the patch queue below to linux-next for
> the remainder of this week and the two weeks of the merge window?

Maybe.  I will see how much pain it causes me.

> It is the patch queue for removal of __cpuinit ; a git repository
> of patches with a series file that can be browsed here:
>=20
>   http://git.kernel.org/cgit/linux/kernel/git/paulg/cpuinit-delete.git
>=20
> or cloned directly from here:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/paulg/cpuinit-delete.git
>=20
> and the deletion and merge strategy was described here previously:
>=20
>   https://lkml.org/lkml/2013/6/20/513

Yeah, I should have responded to that.  Given that the meat of this
series is the first 2 patches (the rest is merely cleaning up the uses of
the now mulled out macros, right) I think it would have been better (i.e.
easier for me :-)) if you had a git tree based on v3.10-rc<something> and
then did a sweep after v3.11-rc1 was out to clean up the rest.

> I do not expect any significant changes to the repository going forward.
> Perhaps adding a couple more "Acked-by:" tags, and dropping a couple
> patches for when maintainers request to carry them locally.  So I hope
> it should not be a big burden.  And it is a one-shot tree as well.

The problem is that it is based on shifting sands i.e. linux-next.  This
means that I will have to rebase it each day onto the new linux-next just
before I release it.  I already do this with Andrew's tree and that is a
bit of a pain already.

It also means (given that some linus-next included trees do not actually
get merged for -rc1), that some of these patches may never apply cleanly
to Linus' tree.

I will try it today and see how we go.  I assume that the current set of
patches is based on next-20130625?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__26_Jun_2013_11_22_02_+1000_7=K_hjgEs0eMM9eg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJRykI/AAoJEECxmPOUX5FEh4cP+wez0OSytqn7pP8qBLrJlcFz
VFzZdGm4Pk6PWlJWcBKJWbM4tyh+Ot3oyJdj2YLUbOaGA0GVb9tvp3FatqbpFNyT
cUWQ66HU+zvjtjEF6Bt+1JeHICiNdM3PCp9mYDOvqWR6zSWBAWofCfN7fm3ST3Os
VZPkdGl4Wjsg+VP2/6TJPX3Q3eck0BI2i8+aRBfw1ISCOK2HBhDZ3BRSLroenOyB
BqIgn9xIv8WEo4Z4SdujssUd9YLovG0d6bqQwyU7pare+CGE+N73pLeuFA5IKl6P
JJgik2VnuMkkO4PtFSKLQtSaZPl4KnVRHSMrKdHNG1n1dwIoBkSxmcs2bXjMY+O8
ZfoW+nQCXTPS+k+ggkK/kg0/nx4K1MmJ9yPla6hrcQ2qw/nHS81X06HerD7Wg8Gj
+dSFzM25REosgVY8MjZaE3Iy5yXdwHW8qPGuNIeetkJtc9wQpDKvnLoUva1U9t5P
gX8kreES0FyOeUl9NABMTuGEASUKO8nDL+x1z7tVX8TS8fvVxVwPGxaKyIj9G6B+
X4QbWWZQTIx4SnvkW8qFwM+YypOGAxBqD2MxPF5ZY4q2pyrqnor0Qq2AtLRAxW/8
vY0LStZcsT8/PsJTao/0UoQytsVvMtI4Zg8mN1j228SfW+ksF4lLPlcLrRTWFy4Q
9s985BAt8urwulxkg6B3
=AMvk
-----END PGP SIGNATURE-----

--Signature=_Wed__26_Jun_2013_11_22_02_+1000_7=K_hjgEs0eMM9eg--
