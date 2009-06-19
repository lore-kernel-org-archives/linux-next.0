From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Can you please pull percpu#for-next into linux-next?
Date: Fri, 19 Jun 2009 13:23:28 +1000
Message-ID: <20090619132328.95ee96bc.sfr@canb.auug.org.au>
References: <4A3AFAA3.4080607@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__19_Jun_2009_13_23_28_+1000_wfKpePIp6a1DsR6o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53444 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750912AbZFSDXf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Jun 2009 23:23:35 -0400
In-Reply-To: <4A3AFAA3.4080607@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Fri__19_Jun_2009_13_23_28_+1000_wfKpePIp6a1DsR6o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Fri, 19 Jun 2009 11:40:35 +0900 Tejun Heo <tj@kernel.org> wrote:
>
> What do I need to do to get a tree pulled into linux-next rounds?  The
> tree in question is

You need to ask. :-)

>   git://git.kernel.org/pub/scm/linux/kernel/git/tj/percpu.git for-next
>   http://git.kernel.org/?p=3Dlinux/kernel/git/tj/percpu.git;a=3Dshortlog;=
h=3Dfor-next

You also need to give me the name(s) of people to inform about any issues
I have with the tree (defaults to you).

> and contains percpu related changes scheduled for the next (2.6.32)
> merge window.  The tree touches a lot of archs and percpu users so
> it'll probably cause some headache during the devel cycle.

Since it is for 2.6.32, I will only add it after 2.6.31-rc1 is released.

What I tell everyone: all patches/commits in the tree/series must
have been:

	posted to a relevant mailing list
	reviewed
	unit tested
	destined for the next merge window (or the current release)

*before* they are included.  The linux-next tree is for integration
testing and to lower the impact of conflicts between subsystems in the
next merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

> Also, is there some guide I can read about linux-next?

There is a web site which is mostly useful:
http://linux.f-seidel.de/linux-next/pmwiki/

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__19_Jun_2009_13_23_28_+1000_wfKpePIp6a1DsR6o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko7BLAACgkQjjKRsyhoI8xspQCfTIMWQSHgLhEhO7Ci4fCNy61Z
N7UAnino/R/JnX0RndwFDA2h1zt850xP
=WqFq
-----END PGP SIGNATURE-----

--Signature=_Fri__19_Jun_2009_13_23_28_+1000_wfKpePIp6a1DsR6o--
