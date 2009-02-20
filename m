From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: hid tree build warning
Date: Sat, 21 Feb 2009 10:11:00 +1100
Message-ID: <20090221101100.b35d5a45.sfr@canb.auug.org.au>
References: <20090220190846.46ec3d76.sfr@canb.auug.org.au>
	<alpine.LNX.1.10.0902201254100.18874@jikos.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__21_Feb_2009_10_11_00_+1100_qNCFaHJ5BDdHTi7W"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43280 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752345AbZBTXLI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Feb 2009 18:11:08 -0500
In-Reply-To: <alpine.LNX.1.10.0902201254100.18874@jikos.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>

--Signature=_Sat__21_Feb_2009_10_11_00_+1100_qNCFaHJ5BDdHTi7W
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Fri, 20 Feb 2009 12:55:07 +0100 (CET) Jiri Kosina <jkosina@suse.cz> wrot=
e:
>
> Thanks a lot for catching this, I have fixed it (moved hid_reset_resume()=
=20
> into the ifdef CONFIG_PM part of the source) and pushed the fix to the=20
> branch you pull into -next.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__21_Feb_2009_10_11_00_+1100_qNCFaHJ5BDdHTi7W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmfOIQACgkQjjKRsyhoI8wf2ACggL7nYph0F1nHHTFdGiCvKIp+
22AAoInoRaHveJOA/GmF6TlUK//AWdM8
=munH
-----END PGP SIGNATURE-----

--Signature=_Sat__21_Feb_2009_10_11_00_+1100_qNCFaHJ5BDdHTi7W--
