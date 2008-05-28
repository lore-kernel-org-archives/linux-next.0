From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ftrace build failure
Date: Wed, 28 May 2008 10:44:04 +1000
Message-ID: <20080528104404.68cd7039.sfr@canb.auug.org.au>
References: <20080527125637.439933a4.sfr@canb.auug.org.au>
	<20080527074310.GA21997@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_May_2008_10_44_04_+1000_xSA4rB5V+lge=7nI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46575 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754258AbYE1Aoa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2008 20:44:30 -0400
In-Reply-To: <20080527074310.GA21997@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Pekka Paalanen <pq@iki.fi>, Thomas Gleixner <tglx@linutronix.de>

--Signature=_Wed__28_May_2008_10_44_04_+1000_xSA4rB5V+lge=7nI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Tue, 27 May 2008 09:43:10 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> this is not an 'ftrace build bug', this is an integration artifact of=20

I didn't say it was a bug.  My subject line (and I have been writing them
like this since I started linux-next in February) means "The build failed
after I merged the ftrace tree".  Nothing more, nothing less.

> -next. It is fixed in -tip too (which too integrates these topics) in a=20
> different branch.

And I said it was a merge artifact.

> it's in a different branch because this is a change only makes sense if=20
> the 'tip/core/rcu' and 'tip/auto-ftrace-next' topics are combined -=20
> hence it lives in the "tip/auto-test-fixes" (commit 48bd24be18) - and=20
> this change was always there as the combined result wouldnt even build=20
> without this fix.

Good and correct.

> So this is a true "merge only commit" that cannot live standalone in any=
=20
> of the topic branches it is related to.

Right.  And I am happy to carry the patch if you want me to.
Alternatively, since auto-ftrace-next is really only meant for merging
into linux-next, you could merge core/rcu (in addition to the curent
merge into auto-sched-next) and the fixup into there.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_May_2008_10_44_04_+1000_xSA4rB5V+lge=7nI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIPKrZTgG2atn1QN8RAjhYAKCKnyCLv4cqvQaiBsn9+U9XzC1MZgCfZ9dr
wxaQYrwROTU4uFO0OviKQQE=
=VQX/
-----END PGP SIGNATURE-----

--Signature=_Wed__28_May_2008_10_44_04_+1000_xSA4rB5V+lge=7nI--
