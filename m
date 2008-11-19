From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: driver-core tree build failure
Date: Wed, 19 Nov 2008 17:51:12 +1100
Message-ID: <20081119175112.416adc24.sfr@canb.auug.org.au>
References: <20081119113031.28e2ae68.sfr@canb.auug.org.au>
	<20081119164317.9bfff78d.sfr@canb.auug.org.au>
	<20081119062644.GB4444@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_Nov_2008_17_51_12_+1100_k2R0ST9NhTfw9ZKR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44271 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751317AbYKSGv3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 01:51:29 -0500
In-Reply-To: <20081119062644.GB4444@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Wed__19_Nov_2008_17_51_12_+1100_k2R0ST9NhTfw9ZKR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, 18 Nov 2008 22:26:44 -0800 Greg KH <greg@kroah.com> wrote:
>
> Right now there is no such dependancy (USB should build and apply just
> fine without driver core, and staging depends on neither of these from
> what I can see.)

The real problem is that because you tell me that usb is based on
driver-core, then if I merge the usb tree it will pull in all of
driver-core again after I have dropped it.  So if the trees are really
independent, you could change (or remove) the NEXT-BASE comment in the
series files.  But that means that you do have to test them independently
as well, so it is probably not worth the effort.

> But that's ok, I'll fix up the driver-core tree right now.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_Nov_2008_17_51_12_+1100_k2R0ST9NhTfw9ZKR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkjt2AACgkQjjKRsyhoI8yKygCfYkfS6xfat2eyDFP+OiQHmtco
vJgAn04ftEsu74K8WKyv2HKOC1S0/Arh
=E1MJ
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Nov_2008_17_51_12_+1100_k2R0ST9NhTfw9ZKR--
