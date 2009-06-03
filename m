From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: wireless tree build failure
Date: Wed, 3 Jun 2009 12:52:02 +1000
Message-ID: <20090603125202.d507e59f.sfr@canb.auug.org.au>
References: <20090422115738.524272c8.sfr@canb.auug.org.au>
	<1240390746.17388.64.camel@johannes.local>
	<20090422230333.e1f7d3db.sfr@canb.auug.org.au>
	<20090422130612.GB3288@tuxdriver.com>
	<1240407191.21978.17.camel@johannes.local>
	<20090422133601.GA25039@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__3_Jun_2009_12_52_02_+1000_+JWRUbF9aUbE76me"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48683 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754570AbZFCCzu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Jun 2009 22:55:50 -0400
In-Reply-To: <20090422133601.GA25039@srcf.ucam.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, Len Brown <lenb@kernel.org>

--Signature=_Wed__3_Jun_2009_12_52_02_+1000_+JWRUbF9aUbE76me
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 22 Apr 2009 14:36:01 +0100 Matthew Garrett <mjg59@srcf.ucam.org> wr=
ote:
>
> On Wed, Apr 22, 2009 at 03:33:11PM +0200, Johannes Berg wrote:
> > But that's not the interesting part -- the thing is the rfkill rewrite.
> > I don't know how to handle that w/o breaking all users. I had hoped to
> > finish this very soon to be ready early in .31, but I'm still waiting
> > for Thinkpad and Toshiba conversions (and I forgot who wanted to look at
> > Toshiba), but if new users are being added in other trees then that's a
> > problem.
>=20
> oqo-wmi can be ignored for the moment - Len, can you drop it from your=20
> tree for now? I'll clean that bit up as well.

So the rfkill rewrite has now hit the wireless tree, so today's build
(x86_64_allmodconfig) failure looks like this:

drivers/platform/x86/oqo-wmi.c:716: warning: 'enum rfkill_state' declared i=
nside parameter list
drivers/platform/x86/oqo-wmi.c:716: warning: its scope is only this definit=
ion or declaration, which is probably not what you want
drivers/platform/x86/oqo-wmi.c: In function 'oqo_rfkill_get':
drivers/platform/x86/oqo-wmi.c:727: error: dereferencing pointer to incompl=
ete type
drivers/platform/x86/oqo-wmi.c:727: error: 'RFKILL_STATE_SOFT_BLOCKED' unde=
clared (first use in this function)
drivers/platform/x86/oqo-wmi.c:729: error: dereferencing pointer to incompl=
ete type
drivers/platform/x86/oqo-wmi.c:729: error: 'RFKILL_STATE_UNBLOCKED' undecla=
red (first use in this function)
drivers/platform/x86/oqo-wmi.c: At top level:
drivers/platform/x86/oqo-wmi.c:734: warning: 'enum rfkill_state' declared i=
nside parameter list
drivers/platform/x86/oqo-wmi.c:734: error: parameter 2 ('state') has incomp=
lete type
drivers/platform/x86/oqo-wmi.c: In function 'oqo_rfkill_toggle':
drivers/platform/x86/oqo-wmi.c:740: error: 'RFKILL_STATE_UNBLOCKED' undecla=
red (first use in this function)
drivers/platform/x86/oqo-wmi.c: In function 'oqo_rfkill_init':
drivers/platform/x86/oqo-wmi.c:752: error: implicit declaration of function=
 'rfkill_allocate'
drivers/platform/x86/oqo-wmi.c:752: warning: assignment makes pointer from =
integer without a cast
drivers/platform/x86/oqo-wmi.c:759: error: dereferencing pointer to incompl=
ete type
drivers/platform/x86/oqo-wmi.c:761: error: dereferencing pointer to incompl=
ete type
drivers/platform/x86/oqo-wmi.c:761: error: 'RFKILL_STATE_SOFT_BLOCKED' unde=
clared (first use in this function)
drivers/platform/x86/oqo-wmi.c:763: error: dereferencing pointer to incompl=
ete type
drivers/platform/x86/oqo-wmi.c:763: error: 'RFKILL_STATE_UNBLOCKED' undecla=
red (first use in this function)
drivers/platform/x86/oqo-wmi.c:765: error: dereferencing pointer to incompl=
ete type
drivers/platform/x86/oqo-wmi.c:766: error: dereferencing pointer to incompl=
ete type
drivers/platform/x86/oqo-wmi.c:767: error: dereferencing pointer to incompl=
ete type
drivers/platform/x86/oqo-wmi.c:772: error: implicit declaration of function=
 'rfkill_free'

So I have reverted commit 9c82cd255907ad639bed4ffc8fcaf1bd59badb50
("platform/x86: Add oqo-wmi driver for model 2 OQO backlight and rfkill
control") and commit 94c4b5977f33894cc316edf07c5cb72b5d193628 ("oqo:
dev_set_name()") that depend son it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Jun_2009_12_52_02_+1000_+JWRUbF9aUbE76me
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkol5VIACgkQjjKRsyhoI8zfrACgm1F/GwH+xFhIdrcgX0vrSS/x
cy0AnA29YT8vhlGGDdkBI8w1YzXvccIU
=DMQz
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Jun_2009_12_52_02_+1000_+JWRUbF9aUbE76me--
