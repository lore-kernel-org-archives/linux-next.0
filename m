From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip-core tree
Date: Thu, 26 Jun 2008 02:13:15 +1000
Message-ID: <20080626021315.dcd8662a.sfr@canb.auug.org.au>
References: <20080625104928.d26f77fe.sfr@canb.auug.org.au>
	<20080625091745.GC11524@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Jun_2008_02_13_15_+1000_Z+tLuJHyuObfChCD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35460 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753357AbYFYQNd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 12:13:33 -0400
In-Reply-To: <20080625091745.GC11524@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>

--Signature=_Thu__26_Jun_2008_02_13_15_+1000_Z+tLuJHyuObfChCD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Wed, 25 Jun 2008 11:17:45 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> (I'm wondering why Git didnt manage to do a clean merge=20
> here - this was a cleanly cherry-picked commit that went upstream.)

Here is what Linus had to say about this just a few days ago:

"However, since conflicts clearly happen, let's look at what *does* cause=20
conflicts. It's not the existence of the same patch to the same area in a=20
file. It's about *different* patches to the same area in a file.

If you have two development trees that have the exact same changes to some=
=20
area in a file, then the merge algorithm with be very happy, and just=20
merge those changes. It's the standard three-way merge.

HOWEVER! If there are _other_ changes that overlap (and aren't identical),=
=20
then *that* is when conflicts happen. And that is true regardless of=20
whether the history also contains some identical changes. IOW, if you have

 - patch A (in _both_ histories)
 - patch B (in just _one_ of the histories)

and they overlap, then that will be a conflict. And now, since the=20
original file will have *neither* A nor B, the conflict will basically be=20
the union of A and B - the three-way merge does not care at all about the=20
fact hat A existed twice, because qutie frankly, maybe B was a _fix_ to A,=
=20
and even though A exists in both branches, it may well be that A on it's=20
own is pure and utter sh*t and shoult not be merged.

See?

So identical patches (with different commits) in two trees is not what=20
causes problems. It's the *non-identical* ones that cause problms. And if=20
they overlap with the identical ones, even partially, then yes, you'll=20
have to resolve not just the non-identical ones, but the identical ones=20
too."

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Jun_2008_02_13_15_+1000_Z+tLuJHyuObfChCD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhibpsACgkQTgG2atn1QN/YuQCeL7p30j3jPuPimzRiwD9vWDhA
MLoAnjMRdWVrc4JNuvkOkWRSCyVqbn/h
=cxvm
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Jun_2008_02_13_15_+1000_Z+tLuJHyuObfChCD--
