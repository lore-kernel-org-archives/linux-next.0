From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: New kvm.git branch for linux-next
Date: Thu, 10 Sep 2009 10:20:02 +1000
Message-ID: <20090910102002.001b1fb7.sfr@canb.auug.org.au>
References: <4AA7EC06.1070109@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__10_Sep_2009_10_20_02_+1000_BFxSmUZ2MHzSaAya"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48115 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752713AbZIJAUM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Sep 2009 20:20:12 -0400
In-Reply-To: <4AA7EC06.1070109@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, linux-next <linux-next@vger.kernel.org>, kvm-devel <kvm@vger.kernel.org>

--Signature=_Thu__10_Sep_2009_10_20_02_+1000_BFxSmUZ2MHzSaAya
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

On Wed, 09 Sep 2009 20:55:18 +0300 Avi Kivity <avi@redhat.com> wrote:
>
> Stephen, please pick up the 'linux-next' branch of kvm.git instead=20
> 'master' as you do now.  This will better reflect what is actually going=
=20
> to -next, will cause fewer merge errors, and will improve -next=20
> bisectability.
>=20
> (this is actually a symbolic ref to kvm-updates/2.6.32 which will be=20
> updated when kvm-updates/2.6.33 is created)

That sounds great.  I have changed over starting from today.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__10_Sep_2009_10_20_02_+1000_BFxSmUZ2MHzSaAya
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkqoRjIACgkQjjKRsyhoI8zLHgCghxx0pL3W/YTpDVm+nDfkooHB
5rUAniIlfv/I8dpaAztRCRInCv9Z+Y91
=TsS6
-----END PGP SIGNATURE-----

--Signature=_Thu__10_Sep_2009_10_20_02_+1000_BFxSmUZ2MHzSaAya--
