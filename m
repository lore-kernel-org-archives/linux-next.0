From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 14 Apr 2015 09:34:54 +1000
Message-ID: <20150414093454.7a22ea9a@canb.auug.org.au>
References: <20150330171334.6f377ba7@canb.auug.org.au>
	<20150330071536.GF24899@n2100.arm.linux.org.uk>
	<20150330190812.5512205f@canb.auug.org.au>
	<5519646C.9010802@mentor.com>
	<20150330150838.GL24899@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/U8sGDzLK+0dezvjSt4CFuUo"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33783 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750935AbbDMXfM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 19:35:12 -0400
In-Reply-To: <20150330150838.GL24899@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Nathan Lynch <Nathan_Lynch@mentor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/U8sGDzLK+0dezvjSt4CFuUo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Mon, 30 Mar 2015 16:08:38 +0100 Russell King - ARM Linux <linux@arm.linu=
x.org.uk> wrote:
>
> On Mon, Mar 30, 2015 at 09:57:48AM -0500, Nathan Lynch wrote:
> > On 03/30/2015 03:08 AM, Stephen Rothwell wrote:
> > > Hi Russell,
> > >=20
> > > On Mon, 30 Mar 2015 08:15:37 +0100 Russell King - ARM Linux <linux@ar=
m.linux.org.uk> wrote:
> > >>
> > >> I'll drop the VDSO stuff from the ARM tree; I can't see a way to keep
> > >> it in my tree and keep my tree buildable without dragging in the tip
> > >> tree.
> > >=20
> > > Does it affect your tree on its own?  If not, then it can be fixed wh=
en
> > > merged as I have done, or if you look at the tip tree, all you really
> > > need to merge is tip timers/core branch (which I am sure the tip guys
> > > can tell you if it is stable enough) which is about 28 commits ...
> > >=20
> > >> The ARM VDSO stuff will just have to wait for 4.2 instead.
> > >=20
> > > If that works for you.
> >=20
> > FWIW, Stephen's merge fix is correct and I have run my vdso tests
> > without problems on OMAP5 with next-20150330.
>=20
> Hopefully, I can pull the tip stuff but if not, I'll try to remember
> to include Stephen's patch with my pull request, but I can't make any
> guarantees - Stephen's email will very quickly get buried in my mailbox,
> and I'll most likely forget about it too... I'm notoriously bad with
> email...

This patch is now needed when the arm tree is merged with Linus' tree
(the tip tree part has been merged).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/U8sGDzLK+0dezvjSt4CFuUo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLFKsAAoJEMDTa8Ir7ZwVwNMP/3Gy3+KZ6nfNmuLxmjB+Nk2p
8q92q0WqE7XNB162OTypqP4DlcL1Bc5GV0iJAor4NttQJYqwsFQCbg7UjAPkAMma
Dr9mRR/Ms1UQXdqzq2LLvnak5O9Dn0wwydvUL6ddgyNuAYLO1cxRriOE5pvlcozn
ddKWjqMQR5CJXQgDaroaOvnysPfzIx1ZZo1A1+z24STB7lJJfnzBJ12BPStge9Qj
X4bZ9BR3KVuCUoqEruW6opSa32vZma5b9HabK0myKS0dLdoDUWsICvlQwJGeiZQT
DxDLH8tJ2StLaLgiusHBHvlOfwqB7Eu0YfbXwTnfy7K9XtcaZM72nRpXD84oQ9Km
T4kQ01S6mhz1lVyE9PjwI4y6coT8k++c7yEO7bIbgBdOrgWFAKMyVGEScJAVLNfu
osbq3zo91s7Zi80cgdAIjjsvSSHxUYUAdsfymgOo2fyP2IRsnqVfY5fe3yu2Kf1v
JGlCVuQBwcFwJw2U7QlmS+4U0LspkVvU4SLNlcm+cSl/J2w58x2w/ncI6v2TnaZ9
CpzEEjrq6bk6pIFaF/8TQpUqudea4Tk6G7ZsOX3DKJ9Da3wdx8mqHrLCxr/VIZSc
7CF1thfs372goCBIrfoRK7jbTai7XDKbKhsx6bZyg1PodsYbmqRv8JFOnyB/Z8sU
Jn2vlDtdmi6+fRtob9hY
=b+YO
-----END PGP SIGNATURE-----

--Sig_/U8sGDzLK+0dezvjSt4CFuUo--
