From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Fwd: Re: [PATCH] kprobes: fix compilation break due to
 kprobe_mutex
Date: Sat, 17 May 2008 22:02:04 +1000
Message-ID: <20080517220204.d78fdce2.sfr@canb.auug.org.au>
References: <20080517114244.GB30141@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__17_May_2008_22_02_04_+1000_4CY9N.JzAGzfaYvx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44717 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753127AbYEQMCP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 17 May 2008 08:02:15 -0400
In-Reply-To: <20080517114244.GB30141@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Sat__17_May_2008_22_02_04_+1000_4CY9N.JzAGzfaYvx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Sat, 17 May 2008 12:42:45 +0100 Russell King - ARM Linux <linux@arm.linu=
x.org.uk> wrote:
>
> Presumably this hasn't been detected because linux-next isn't building
> enough ARM configurations to hit one that has kprobes enabled?

http://kisskb.ellerman.id.au/kisskb/compiler/11/

That's what I have building for arm.  I have asked twice for a suggested
set of configs.  Consider this request number three :-)

From: "Abhishek Sagar" <sagar.abhishek@gmail.com>
>=20
> Now that I look at it, the commit I'm referring to is in
> git://git.kernel.org/pub/scm/linux/kernel/git/x86/linux-2.6-x86.git :
> auto-sched-next. I merged all the recent kprobe related changes from
> there into my local arm kprobes branch based on 2.6.26-rc2 and fired a
> build for arm. That's when I encountered the kprobe build error.

Also, that branch isn't in linux-next.  The commit maybe but I don't know
what commit is being discussed, sorry.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__17_May_2008_22_02_04_+1000_4CY9N.JzAGzfaYvx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFILslBTgG2atn1QN8RArkbAJ9Yr8IzVwxTZ37q7n1SlQV5DkAt0QCglQEw
DQVFQ9lIKsv/P3n1njUe2yw=
=i+oD
-----END PGP SIGNATURE-----

--Signature=_Sat__17_May_2008_22_02_04_+1000_4CY9N.JzAGzfaYvx--
