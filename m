From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] sound: fix trivial build error in mpc5200_dma.c
Date: Tue, 28 Feb 2012 10:27:29 +0000
Message-ID: <20120228102728.GB3121@opensource.wolfsonmicro.com>
References: <1330204350-386-1-git-send-email-paul.gortmaker@windriver.com>
 <20120227145926.GK3191@opensource.wolfsonmicro.com>
 <4F4BFC16.2090602@freescale.com>
 <20120227235630.GC23230@opensource.wolfsonmicro.com>
 <CAP=VYLrdAqUrn0WERvbM_JqVSPWxU94ZJkF7C0HaJysy6fCy7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38106 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S964940Ab2B1K1c (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Feb 2012 05:27:32 -0500
Content-Disposition: inline
In-Reply-To: <CAP=VYLrdAqUrn0WERvbM_JqVSPWxU94ZJkF7C0HaJysy6fCy7A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Timur Tabi <timur@freescale.com>, perex@perex.cz, tiwai@suse.de, lrg@ti.com, linux-next@vger.kernel.org


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 27, 2012 at 07:43:20PM -0500, Paul Gortmaker wrote:
> On Mon, Feb 27, 2012 at 6:56 PM, Mark Brown

> > The first line of the changelog which gets treated specially in various
> > ways.

> Automated scripts?  Something else?   I'd be interested to know.

Things that use log summaries like git send-email and request-pull which
pick out the first line of the changelog and do something different with
it.

> I have to admit being confused by this as well.  I paged through the
> git whatchanged info, and guessed that I should have used a prefix
> like "ASoC: mpc5200_dma" (camelcase sic) but I think that to expect
> that level of awareness from general contributors is probably expecting
> a bit much.  I like to think I'm not totally clueless, but I would have
> never thought of the above in advance...

Well, most people seem to manage to get it right (I expect on the basis
that they write a log which looks like the other logs for the code).  If
you're thinking far enough to put a subsystem prefix on the commit log
in the first place it seems reasonable to expect one that's in use
rather than just creating one.

> In any case, if I have further fixups I happen across, I will try to feed
> your bots the correct prefix.

It's nothing custom on my side, I only use the vanilla git porcelain
(though I do do things like grepping mailing lists visually so when
things aren't CCed properly I'm less likely to notice the mailing list
version of them).  I'd expect there are people with subject line based
filters, though - patchwork might care for example.

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPTKwKAAoJEBus8iNuMP3dtmsP/0tkICmJcEcXwpkA6fNDVKJn
6PdyIauooETPB0vZssRXTei9usa9to0u6HQyNS5XS/kQc6jBhQ82n9jArnu+s5QH
6ENc9PWI+mfKM4xSvW6C/HzcMJdqQYp6j99tjMSBGPlwPfKLp8Fme8ERuKcoXDpF
Gu/azTBOe7CwDNB46wF7ojXmXQArUqeHUAeAuTQ3kUsqF1WUdDLrT1lPwz+IHXvN
tcKClQA5gQZ2Vd4oO6Zjm+x3YoOnKHKl/Wh6szSE2yNeznvQSkTT8TiyJLQn3km2
t5+91RG25U1SjeKNesLFhA1qU8GNEQK9DXYbPplaj3Om6Pu33ZgIlq0iMXK2Vt82
CFqH+7ebKMQxtOqGljSTQWlA/hAiFeYTiQy21dH270Toa7Dd/xQ/nVddc6uTPlrP
82j5VzBdKokIB87cUdzrGx1LfQcJ/E7gQqgqatOBAmIqMK1wicnFTo/pZ+PH/ZrN
WMzYXCsf2mj2gaw3MvXyfl+XTJ8SRxTfmXznw1m/NeOKzdP+Y2U4c1n14V+6EzlF
3wmgv/FS3ywlc5mydOsXvuFQHQOSqY7nB6KU51NsHBZC8NBYJwm/d4hdoSoxTFLt
kgMEkp/YOH6REJXahitnJmZrzSeY15fV2eJws6OZR6e+EBsiGFrENXX9yOEGwrCp
hL8vNU0WazGqCtmhtuDD
=nNy+
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
