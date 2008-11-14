From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sound tree build failure
Date: Fri, 14 Nov 2008 18:27:18 +1100
Message-ID: <20081114182718.e93352c3.sfr@canb.auug.org.au>
References: <20081114145630.31f312ce.sfr@canb.auug.org.au>
	<s5hiqqqlsw8.wl%tiwai@suse.de>
	<20081114175856.2ab38113.sfr@canb.auug.org.au>
	<s5habc2lr9b.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__14_Nov_2008_18_27_18_+1100_0BzN8nz+CYWz.WLY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47099 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750727AbYKNH1b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Nov 2008 02:27:31 -0500
In-Reply-To: <s5habc2lr9b.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>

--Signature=_Fri__14_Nov_2008_18_27_18_+1100_0BzN8nz+CYWz.WLY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[For Peter and Ingo, we are discussing commit
621a0d5207c18012cb39932f2d9830a11a6cb03d ("hrtimer: clean up unused
callback modes") that went into Linus' tree yesterday but broke the sound
tree in linux-next which used one of the removed defines.]

Hi Takshi,

On Fri, 14 Nov 2008 08:07:44 +0100 Takashi Iwai <tiwai@suse.de> wrote:
>
> To defense myself: the reason of the rebase is irrelevant with this
> build error.  It's just a sad coincident.

There is no need to defend yourself, as you say a sad coincidence.

I am sorry if dropping the sound tree has made you feel attacked, it is
just the new way I am doing things - I cannot fix every problem, so I
will not try in most cases.  The sound tree will be restored as soon as
this is fixed up.

> I had to rebase the sound tree because I need to drop one topic branch
> which cause another build error.  Of course, I could revert each 15 commit
> of that topic branch, but it's also annoying.  Thus I decided to rebase
> (just re-merging each topic branch again from scratch).

And that is perfectly fine.  As you said the rebase had nothing to do
with this new build error.

> I'm wondering why this happens, though.  Such a clean-up patch should
> has been tested enough long on linux-next before pushed into Linus
> tree.  And, I see no reason to push a clean-up patch at this late rc
> stage...

A lot of stuff goes into Linus' tree without entering linux-next at all.
But, as you say, this clean up patch, and, coming through the tip trees, I
would have expected to be in linux-next for at least a day ...

Things like this happen all the time ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__14_Nov_2008_18_27_18_+1100_0BzN8nz+CYWz.WLY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkdKFYACgkQjjKRsyhoI8zpvACdG0Wulb03XM6/3HTAeh2vlSQM
rJUAoLEfDfw82FOG2T1E/vC5ruCY4Hdf
=6QVW
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Nov_2008_18_27_18_+1100_0BzN8nz+CYWz.WLY--
