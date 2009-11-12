From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sysctl tree build failure
Date: Thu, 12 Nov 2009 19:14:51 +1100
Message-ID: <20091112191451.d21250f2.sfr@canb.auug.org.au>
References: <20091112184805.1c0720cb.sfr@canb.auug.org.au>
	<m1ljicp3l0.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Nov_2009_19_14_51_+1100_PcV3.W.WdM3c97PA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47073 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751878AbZKLIOu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Nov 2009 03:14:50 -0500
In-Reply-To: <m1ljicp3l0.fsf@fess.ebiederm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__12_Nov_2009_19_14_51_+1100_PcV3.W.WdM3c97PA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Thu, 12 Nov 2009 00:08:59 -0800 ebiederm@xmission.com (Eric W. Biederman=
) wrote:
>
> Thank you, and my apologies.  I thought I had tried it with every
> applicable compile option but apparently not.
>=20
> Ugh.  It looks like I have a small refcount leak in that case as
> well.  Blind I was.
>=20
> Thank you very I will have this fixed shortly.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Nov_2009_19_14_51_+1100_PcV3.W.WdM3c97PA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr7w/sACgkQjjKRsyhoI8z9JgCfQ+l25S9stVvfUJxGCPgZadnW
uOwAniLl9+cYUIkoqo17d8xjtK0TON8m
=Lv8w
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Nov_2009_19_14_51_+1100_PcV3.W.WdM3c97PA--
