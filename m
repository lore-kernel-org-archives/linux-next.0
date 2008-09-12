From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: x86 tree build failure
Date: Fri, 12 Sep 2008 17:31:41 +1000
Message-ID: <20080912173141.5b268bed.sfr@canb.auug.org.au>
References: <20080912095618.728658a5.sfr@canb.auug.org.au>
	<20080912060527.GA22003@amd.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Sep_2008_17_31_41_+1000_S5Pe7xtwJ72g_GFR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34414 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752004AbYILHby (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 03:31:54 -0400
In-Reply-To: <20080912060527.GA22003@amd.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Fri__12_Sep_2008_17_31_41_+1000_S5Pe7xtwJ72g_GFR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joerg,

On Fri, 12 Sep 2008 08:05:27 +0200 Joerg Roedel <joerg.roedel@amd.com> wrot=
e:
>
> do you have these commits in next/master already? I tried to find out

Not until tomorrow some time, sorry.

> why it fails (the build failure is weird because
> PCI_DEVICE_ID_AMD_10H_NB_MISC and PCI_DEVICE_ID_AMD_11H_NB_MISC
> are defined in the same place in tip/master).

tip/master has more trees merged than the x86 tree (and indeed
PCI_DEVICE_ID_AMD_10H_NB_MISC turns up in the timers tree).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Sep_2008_17_31_41_+1000_S5Pe7xtwJ72g_GFR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjKGt0ACgkQjjKRsyhoI8yqbgCfaalF/wdXQhT0oQRs46PhMeb1
XYwAn2bIupGP2TfAvNtCkrmvJHpmEU9R
=CtxY
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Sep_2008_17_31_41_+1000_S5Pe7xtwJ72g_GFR--
