From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Fwd: Re: [PATCH] kprobes: fix compilation break due to
 kprobe_mutex
Date: Sat, 17 May 2008 23:59:26 +1000
Message-ID: <20080517235926.5133252f.sfr@canb.auug.org.au>
References: <20080517114244.GB30141@flint.arm.linux.org.uk>
	<20080517220204.d78fdce2.sfr@canb.auug.org.au>
	<20080517133527.GC30141@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__17_May_2008_23_59_26_+1000_gZQ.4hWLkN=W.kZZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35169 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754046AbYEQN7h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 17 May 2008 09:59:37 -0400
In-Reply-To: <20080517133527.GC30141@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Sat__17_May_2008_23_59_26_+1000_gZQ.4hWLkN=W.kZZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Sat, 17 May 2008 14:35:27 +0100 Russell King - ARM Linux <linux@arm.linu=
x.org.uk> wrote:
>
> On Sat, May 17, 2008 at 10:02:04PM +1000, Stephen Rothwell wrote:
> >=20
> > That's what I have building for arm.  I have asked twice for a suggested
> > set of configs.  Consider this request number three :-)
>=20
> The answer is all of them.  I can't suggest any subset, mainly because
> I don't know what's in each and what each will cover.  The coverage of
> each is really up to each platform maintainer I'm afraid.

OK, I will see what happens if I add them all.  You may need to ping me
if any get added or removed.

> > Also, that branch isn't in linux-next.  The commit maybe but I don't kn=
ow
> > what commit is being discussed, sorry.
>=20
> 085a6d5e4fb23c6395da1d0106feed795b57c79b

Yeah, as far as I can tell nothing like that one is in linux-next yet
(probably on Monday).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__17_May_2008_23_59_26_+1000_gZQ.4hWLkN=W.kZZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFILuTFTgG2atn1QN8RAtGVAJ4tpThat5OaHOovzDWeeot5f7nilwCeKuWJ
pfYV9aTPIrnlr2JbBUsGr0E=
=hMPw
-----END PGP SIGNATURE-----

--Signature=_Sat__17_May_2008_23_59_26_+1000_gZQ.4hWLkN=W.kZZ--
