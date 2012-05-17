From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: question about the sound tree
Date: Thu, 17 May 2012 17:01:36 +1000
Message-ID: <20120517170136.9fccc6861e300df08ec62a8f@canb.auug.org.au>
References: <20120517092438.fce7979fcd25c1fca03268f0@canb.auug.org.au>
	<s5hipfvbbix.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__17_May_2012_17_01_36_+1000_MsHHj_CuIpH+hu_T"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:44156 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759137Ab2EQHBt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 May 2012 03:01:49 -0400
In-Reply-To: <s5hipfvbbix.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Dave Airlie <airlied@linux.ie>

--Signature=_Thu__17_May_2012_17_01_36_+1000_MsHHj_CuIpH+hu_T
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Thu, 17 May 2012 07:51:34 +0200 Takashi Iwai <tiwai@suse.de> wrote:
>
> This is a part of the support of the audio client for VGA-switcheroo.
> Three patches to vga_switcheroo.o and its clients are needed.
> Since vga_switcheroo.c was changed for 3.5, I had to rebase my works
> on the recent drm branch, and Dave suggested to pick up his
> drm-next-core branch (and pulled my branch to his tree, too).
>=20
> The development was done in a separate branch (topic/hda-switcheroo)
> in sound git tree, and yesterday I merged it to for-next branch.
> If this causes a problem, I can get it out again easily.  Just let me
> know.

That's all fine, I was just curious.

> For a branch to send to Linus, I'll re-merge (not rebase, of course)
> these topic branches to make them straight, and reasons shall be
> mentioned in the merge commits.

Excellent.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__17_May_2012_17_01_36_+1000_MsHHj_CuIpH+hu_T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPtKJQAAoJEECxmPOUX5FE+F4P/1O8M4vEivSBajpcwoCxKcE5
krQr3naHoAvmm0+446Wfi3x0eaGWeQQbKfWtS8VO1WkPJCKI2sk3X33G/jsXoYsv
SNJa8jvY3Sb9R27Ms8094M54FUtTzZoTuVzWkBgevhb/AHvqYHBV9pZG7WbOdGPU
eSTDtTbk0BYCt+en5pQfq6oXbF0dVGZAF0gDNWz1aPUWfBID61fdD9dIb0RuGxd4
CjvuRrtKSOWtdME3HfM7UrFDPVyya1QIiqLHSWRtZrOMsPoe5hmmCo1s290+CTvd
zJQIzf83w0+u3VxRM+vPE72Q70I0cVo2+mihMvk6yUe/4pFgmCMPb0gKJ3x0fBBV
bxoC1ao35wNTxLGRwnQZ9a9RtlqxxAbdcp1KOu8gp13hT8EM4UH8gSUKlvOy5Cza
d2PozgLxJ3sE71iP/f1JcqOpbLWpTo/q8Ix8wfBdrTgpQVgNl80nAI/cBV/pmFJ2
SXDLnhlMsjZPz7qDzWqWFqBJ1/3b61wFb2RD+jDWJV2b2pQ4KTatC9JLtcCrXbS9
DwfgegZy3CNYswO5864PBnuWG/wUU6JrpaMYFCL6K2n82U4Trc4e3ZSrMq2v3+8F
C/iliNsjVZaXIqHjuxJ4TuJecDezPwk7UvvnMqzMiY6QccVk0Y58QqFVJ72H8A0a
pfEYylRBakbnD8T+bajC
=DtE3
-----END PGP SIGNATURE-----

--Signature=_Thu__17_May_2012_17_01_36_+1000_MsHHj_CuIpH+hu_T--
