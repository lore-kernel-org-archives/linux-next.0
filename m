From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ftrace tree build failure
Date: Fri, 2 Jan 2009 21:22:42 +1100
Message-ID: <20090102212242.13f9007e.sfr@canb.auug.org.au>
References: <20090102200754.3cd3661c.sfr@canb.auug.org.au>
	<20090102091456.GB30018@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__2_Jan_2009_21_22_42_+1100_ScmC2gvuZAT4k1oL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35089 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754006AbZABKWz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Jan 2009 05:22:55 -0500
In-Reply-To: <20090102091456.GB30018@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__2_Jan_2009_21_22_42_+1100_ScmC2gvuZAT4k1oL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Fri, 2 Jan 2009 10:14:56 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
> this has been fixed already a few days ago (if you google for the build=20
> failure string it will send you straight to the fix patch) - i just didnt=
=20
> push it out to the -next branches yet during the hollidays. (did that now)

Thanks.

> Generally if you see a problem with our trees you can check whether an=20
> issue is still present in tip/master:
>=20
>   http://people.redhat.com/mingo/tip.git/README

I'll try to remember ...

[I wish you had stopped there]

> before duplicating fixing effort and reporting it as a genuine issue -=20

It broke a linux-next build - just how genuine does an issue have to be?
Even if I knew you had already fixed it, I would still have reported it
(although saying where I got the fix from) so that others know why I have
had to apply a patch.

> especially in a busy timeframe like the merge window when the _next_ merg=
e=20
> window is the least of our worries.

During the merge window, linux-next is not concerned with the _next_
merge window (as my previous reminder to people spelt out), but very much
with the current merge window.  What you don't seem to realise is that
others use linux-next during the merge window to do integration testing
after fixing up their trees to cope with stuff that Linus has already
merged (in order - as much as possible - to not break Linus' tree).  So
when you break the linux-next tree, you make life harder for them.

So, how much of your time would have been "wasted" remembering to put
that fix into the linux-next branch compared to my time and the time of
others?

And don't bother responding (especially privately) I don't need the
aggravation.  If you feel a need to reply coming on, just delete this
email instead and pretend I didn't write it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__2_Jan_2009_21_22_42_+1100_ScmC2gvuZAT4k1oL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkld6vIACgkQjjKRsyhoI8wLagCgrV6fv8jiAdoK3gLbjbgKMu65
mW4An3o1T4dWu5q0WLX1DzooynH7a9wk
=kgTO
-----END PGP SIGNATURE-----

--Signature=_Fri__2_Jan_2009_21_22_42_+1100_ScmC2gvuZAT4k1oL--
