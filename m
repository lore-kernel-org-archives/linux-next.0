From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sound tree build failure
Date: Fri, 14 Nov 2008 18:46:33 +1100
Message-ID: <20081114184633.4b5ab1f6.sfr@canb.auug.org.au>
References: <20081114145630.31f312ce.sfr@canb.auug.org.au>
	<s5hiqqqlsw8.wl%tiwai@suse.de>
	<20081114175856.2ab38113.sfr@canb.auug.org.au>
	<s5habc2lr9b.wl%tiwai@suse.de>
	<20081114182718.e93352c3.sfr@canb.auug.org.au>
	<s5h1vxelpp0.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__14_Nov_2008_18_46_33_+1100_QnzhdJlQ9JYidxWA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44700 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750734AbYKNHqr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Nov 2008 02:46:47 -0500
In-Reply-To: <s5h1vxelpp0.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>

--Signature=_Fri__14_Nov_2008_18_46_33_+1100_QnzhdJlQ9JYidxWA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Fri, 14 Nov 2008 08:41:31 +0100 Takashi Iwai <tiwai@suse.de> wrote:
>
> BTW, what would be the best fix?  To me, the easiest is to revert the
> commit.  But, if other HRTIMER_CB_IRQSAFE_* flag is known and confirmed
> to work like HRTIMER_CB_IRQSAFE, I can simply change to it as a fix.

I don't know, sorry - that is why I am leaving fixes to those who do.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__14_Nov_2008_18_46_33_+1100_QnzhdJlQ9JYidxWA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkdLNkACgkQjjKRsyhoI8y2kgCfWv5bLH7DbMvBEg3J4jL7iy7S
NowAn0Rg3fQmCQrzdapbdwNBUnN1A8Ul
=V3M9
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Nov_2008_18_46_33_+1100_QnzhdJlQ9JYidxWA--
