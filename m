From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: fix for "error: implicit declaration of function 'devres_alloc'"
 in Mar9 tree
Date: Sun, 11 Mar 2012 19:32:04 +0000
Message-ID: <20120311193203.GB3171@opensource.wolfsonmicro.com>
References: <4F5A1DBC.3090701@windriver.com>
 <20120311124846.GA6081@opensource.wolfsonmicro.com>
 <CAP=VYLoSgAdL6VzJE_gG0mFbb+cAjsEiHGp6gbhMo6Zx4=3dbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60954 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751347Ab2CKTcI (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 11 Mar 2012 15:32:08 -0400
Content-Disposition: inline
In-Reply-To: <CAP=VYLoSgAdL6VzJE_gG0mFbb+cAjsEiHGp6gbhMo6Zx4=3dbA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 11, 2012 at 12:09:39PM -0400, Paul Gortmaker wrote:
> On Sun, Mar 11, 2012 at 8:48 AM, Mark Brown
> > On Fri, Mar 09, 2012 at 10:11:56AM -0500, Paul Gortmaker wrote:

> >> This is caused by commit 19694b5ea1d3 which just appeared in today's n=
ext
> >> tree exposing another implicit device.h user. =A0Just a quick note tha=
t I'll
> >> take care of it by adding regmap.c to the below commit.

> > relied on here. =A0You've gone and deleted that inclusion without CCing
> > the patch to the subsystem and now you're sending a fix again without a
> > CC to either me or the relevant list, and without even a mention in the
> > subject line.

> We are talking about a trivial fix here, and the deletion was one of about
> fifty similar one-line deletions in include/linux, of which many files do=
n't
> even have clear owners.  So, while I can appreciate you wanting a CC,
> it just wasn't practical in this case in my opinion.

The above doesn't just apply to the original patch, it applies even more
strongly to the followup patch where none of the above issues apply.

Honestly I do think that if you made at least some effort to let
subsytem maintainers know about all this header reorganisation you're
doing you'd introduce a lot less breakage, it's hardly surprising that
people keep on developing with the headers they can see.

> > In order to avoid bisection breakage I've applied one of the several
> > fixes for this that were sent to me today, please drop your change.

> I don't see how this avoids any bisection breakage -- you've now introduc=
ed
> a dependency that wasn't there before -- i.e. I would have to make sure
> your change is present before my changes get pulled.  In any case I can
> just ensure I have the exact same change as you and it will make sure
> my series remains bisectable.

It will be fine, there's no dependency.  If regmap is merged first
there's obviously no issue as it doesn't have your header faffing in.
If regmap is merged second then the branch that gets pulled will have
Stephen's change applied to it before it gets Linus' tree so no commit
will exist where we've only got your commit which introduces the problem
and no fix.  On the other hand an incremental fix in your tree only
means that if your tree is merged second there will be at least one
commit which is broken.

This applies to any fixups for the fallout from your changes, except in
very rare circumstances adding the extra includes is always going to be
safe in any tree and this means that people working in the tree can see
what's going to be happening, making things less error prone.

> > This stuff would go a lot more smoothly if you were to at least let
> > people know when you make changes, especially when issues introduced by
> > your changes get noticed.

> I've worked to get at least three different regulator regression fixes in,
> None of those were related to any changes I made.  You were on the
> to/CC of those fixes, and I even made changes as you requested.  My
> point is that I do my best to follow implicit and explicit processes.  If
> you've somehow come to conclude otherwise, I'm sorry to hear that.

If you'd CCed me when you noticed the additional breakage from your
change or you'd written followups to the people submitting fixes
normally which said something like "This is due to more header
reorganisations I've done, I've fixed it on my branch see X for details"
things would've worked better.

As it is I was seeing fixes from people which made no sense given the
recent activity in the tree plus followups from you which had no content
other than links (which isn't good practice) to a message which itself
just references git changes things by hash (which is quite bad, commit
IDs aren't directly legible and can change) and had to faff around with
the logs to figure out what you'd done.

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPXP2tAAoJEBus8iNuMP3dCbYP/228hVptwaQfNevTuQnuGaox
NcoK3ymMlmY/EHuU+Eu1WFf+iSKga1vUlHZBE76RNV+G8wjOLLEtj9uKz2NSnFJI
ufn4mz+iCmiTdlxZSqHGUhyAmOF/8UQTFUb8h5qEklZFz0Xxhtw1/uT2XOOxjsQJ
lUY47HGoUzVtubnp1H6GJDGB87MBTT7FpI9TySL3Uhun+WO9B6iivz0/rvM9pYZ1
4XtUzkDOIcRxjZ7AbMQy5VuVy8NUDIjWi9kq2rPHOKlHBboBVfAGwEQAYFUzvSj1
e8B1PKBN/gkl1H9XaMTCoa3MzAZMkm9vFo6RINqkVhW2akQY+VGp4yItGeOBZTrX
tK+bQEztlIvT/9ANiLzxem0r5vOaMSx4Wn9cDrm4uVjh8J6f/cEaQ6l9kA9VU0QM
oFKCNhAB//WDXBPfDYNwFpHDekduiOUMYRb9zxH83mOCKN06tg+O+lEj6cNJbOJL
kGAmohPXxMt3IgveHxK5aaFqiqur9z9MJtq6KE+S6eF6YXnOddShTWRjC0RKGRw+
PB8AeATaU2Q5NZhFl24q1ztaQQ5qd3RMHLAijdE7WjQUpcVkhv45YJ4vWu1JigfS
yEmgTt5WlIO0ORFS4OocSLNs829UvcwMk9DTnbNIqIj3xUEemuStAh3Ts2gnDqi7
hD/rssEcs1UNHBkXUZbZ
=+koR
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
