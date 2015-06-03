From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with Linus'
 tree
Date: Wed, 3 Jun 2015 14:04:40 +1000
Message-ID: <20150603140440.0cc405b5@canb.auug.org.au>
References: <20150602160723.3b519d63@canb.auug.org.au>
	<20150603032750.GA49670@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mfxDPQL4cTIPTuQQcIQpVgR"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33665 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750723AbbFCEEr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2015 00:04:47 -0400
In-Reply-To: <20150603032750.GA49670@vmdeb7>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Philippe Coval <philippe.coval@open.eurogiciel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Tunin <hanipouspilot@gmail.com>

--Sig_/mfxDPQL4cTIPTuQQcIQpVgR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Darren,

On Tue, 2 Jun 2015 20:27:50 -0700 Darren Hart <dvhart@infradead.org> wrote:
>
> Thanks for the heads' up. This happens because my -next branch is based o=
n *-rc1
> as I think was recommended at the last kernel summit. Since rc1 I sent Li=
nus the
> G50-30, but by rc6 I didn't feel good about sending the similar G50-30 fi=
x, so
> that is in my rc1 branch.
>=20
> I am happy to rebase my -next on rc6 to avoid the conflict, but I believe=
 the
> rebase is considered poor practice.

This is a fairly trivial conflict and Linus will have no trouble fixing
it up as well when he merges your tree in the next window

> You said no action required, but if there is something I can do to avoid =
this
> kind of manual effort on your part (and a manual merge by Linus in the up=
coming
> merge window), I'm happy to update my process to accommodate.

This is fine.  git rerere remembers these conflict resolutions for me,
so I only have to fix them once (usually).

For a more complex conflict, you might consider merging the branch that
you had Linus merge (or a later -rc) with, of course, a nice
explanation in the merge commit message, but in this case that would be
overkill.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/mfxDPQL4cTIPTuQQcIQpVgR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbnzdAAoJEMDTa8Ir7ZwVX4YP/R8vHXs9a7ZXSfySUYTmRG0Z
Hr4Jhtuh45uUS07btgnfjdlizDchglL08o/wy7rQssOVb3JGCumAIRdYEpy9xEXd
DROTuFRFqcf9x0kqw25wjVcl/g6PNSnv3ePVCHGCDA73cdsO+L5kh1dnT1jDNCo3
QoUNyrF70ADdSlxecClAYhWNnY5X62sfx/C+THX5G55ccN1qEYmY462ctAtrg6bZ
NJKXnsF8nr13P44MVI3iq5WkJEW2pfifNC+u7NxamQFpyG3uLevus+Zup0WQlVWC
zEBnYonghO0tvam6H5RePvylodt+tuMM6v65+vb1P2q/lIiqm3RJC1UfqJ1SPQYR
NofoFBaLl4FOsRv35HjH9pOXFWFtqLzs7swYgVK6EyNJGd4bJaEYdrzRnk3EBNDe
Lk44OOT2C0IbZ8eSzDGrSkH189FHazLoxKQ7Gp9MlXFNRKFVMFgRWJw2P3Ly9+Uu
uBJCh592yKUJU2P+1HQFw/Apa5qKQZquMszHahR/2L2SvNK0xG9fvhEKpvavizUp
QqufY3c7h/6YlWs7RyunOFizHFxL1/pthlI/Ewi+LCpfAtcy5hcXVDEXWKCJlwfg
PfZt8GuJIPq9H007UeuI02Dp2yuBPiUiRQR8V6wngnFbB6jYMId+EnUbAfbABLJ7
4BZRF4LTzqRDqa5ipUNE
=B7uB
-----END PGP SIGNATURE-----

--Sig_/mfxDPQL4cTIPTuQQcIQpVgR--
