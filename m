From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure
Date: Tue, 1 Jul 2008 00:46:18 +1000
Message-ID: <20080701004618.57dec8f1.sfr@canb.auug.org.au>
References: <20080630232248.8d993f1d.sfr@canb.auug.org.au>
	<20080630140644.GA5167@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_00_46_18_+1000_fkUn7u7pYeWbH4FG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41187 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750842AbYF3OqW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 10:46:22 -0400
In-Reply-To: <20080630140644.GA5167@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Tue__1_Jul_2008_00_46_18_+1000_fkUn7u7pYeWbH4FG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 30 Jun 2008 16:06:44 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> hm, there's no known (or even any recently fixed) kbuild related problem=
=20
> in the stuff that comes towards linux-next from -tip. I've done an=20
> integration run earlier today - have you already picked that up?

No, I collected all the trees at about 9:30 am my time i.e. about 15
hours ago.

However, there have been several changes in this area in the kbuild tree
over the past few days ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_00_46_18_+1000_fkUn7u7pYeWbH4FG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkho8boACgkQjjKRsyhoI8wfPwCgnJXnSnTTj7UmfVjuKyTbvRWX
+EQAn2mWSveNTHLV8+4BJjk2Vpg+aCpG
=Fq2i
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_00_46_18_+1000_fkUn7u7pYeWbH4FG--
