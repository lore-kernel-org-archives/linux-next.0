From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: firmware build failure
Date: Wed, 4 Jun 2008 20:40:50 +1000
Message-ID: <20080604204050.6b60dc2a.sfr@canb.auug.org.au>
References: <20080604164623.3d5f38d2.sfr@canb.auug.org.au>
	<1212571377.4042.70.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__4_Jun_2008_20_40_50_+1000_m83=qnc4MoWPU7Sy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40854 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754049AbYFDKlE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2008 06:41:04 -0400
In-Reply-To: <1212571377.4042.70.camel@shinybook.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__4_Jun_2008_20_40_50_+1000_m83=qnc4MoWPU7Sy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, 04 Jun 2008 10:22:57 +0100 David Woodhouse <dwmw2@infradead.org> wr=
ote:
>
> On Wed, 2008-06-04 at 16:46 +1000, Stephen Rothwell wrote:
> > -                 echo "    .align $(ASM_ALIGN)"                       =
 >>$@;\
> > +                 echo "    .p2align $${ASM_ALIGN}"                    =
 >>$@;\
>=20
> Ah, thanks. I did originally start doing it with big C files with char
> arrays, which made this part easier -- but I really wanted to
> use .incbin so I didn't have to copy the whole of the object into
> 'source' code. Just checking that that actually does the right thing on
> ppc and ppc64 too, and I'll refactor it to include that. And the kaweth
> fix.

Great, thanks.

> Then I'll go seeking the usb tree of which you speak, with the ti patch
> that conflicts. This not the tree at
> kernel.org:/pub/scm/linux/kernel/git/gregkh/usb-2.6.git labelled 'junk
> tree; please ignore', I assume?

It is a quilt series here:
http://kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/gregkh-04-usb/

All the trees and their sources are listed in the file Next/Trees in the
linux-next tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Jun_2008_20_40_50_+1000_m83=qnc4MoWPU7Sy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIRnE5TgG2atn1QN8RAn44AJ9Fg3r/dbq4nWt3NEAnpYoNLlZF1wCfep+1
8jCBjd70ybYRwwNS3UbY0EM=
=O0HB
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Jun_2008_20_40_50_+1000_m83=qnc4MoWPU7Sy--
