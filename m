From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sound tree build failure
Date: Fri, 14 Nov 2008 17:58:56 +1100
Message-ID: <20081114175856.2ab38113.sfr@canb.auug.org.au>
References: <20081114145630.31f312ce.sfr@canb.auug.org.au>
	<s5hiqqqlsw8.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__14_Nov_2008_17_58_56_+1100_D1390il=t=p8qo+a"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43580 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751424AbYKNG7F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Nov 2008 01:59:05 -0500
In-Reply-To: <s5hiqqqlsw8.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__14_Nov_2008_17_58_56_+1100_D1390il=t=p8qo+a
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Fri, 14 Nov 2008 07:32:23 +0100 Takashi Iwai <tiwai@suse.de> wrote:
>
> > That identifier does not exist anywhere else in my tree.  It was removed
> > by commit 621a0d5207c18012cb39932f2d9830a11a6cb03d ("hrtimer: clean up
> > unused callback modes") which is now in Linus' tree (as of yesterday).
>=20
> I had to rebase the tree yesterday, but the code there is identical with
> the older versions.  So, if it failed there, it must be a change of
> hrtimer side.
>=20
> I'll check tip tree...

That commit entered Linus' tree after you rebased your tree but before I
fetched it this morning.  You could fix things by merging Linus' tree and
doing the fix in the merge commit rather than rebasing.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__14_Nov_2008_17_58_56_+1100_D1390il=t=p8qo+a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkdIbAACgkQjjKRsyhoI8zcEACgtOWMytFO3yDWdO6KL5K1Q02A
yWIAn1tXyGKNRTE8eKL+zmmvUOgcn2/y
=VWRk
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Nov_2008_17_58_56_+1100_D1390il=t=p8qo+a--
