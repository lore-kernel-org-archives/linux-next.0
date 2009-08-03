From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cpufreq tree build failure
Date: Mon, 3 Aug 2009 12:28:19 +1000
Message-ID: <20090803122819.6b738cad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__3_Aug_2009_12_28_19_+1000_..T3wy8lpz4KxTwl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60790 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753187AbZHCC20 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Aug 2009 22:28:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Renninger <trenn@suse.de>

--Signature=_Mon__3_Aug_2009_12_28_19_+1000_..T3wy8lpz4KxTwl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "cpufreq_global_kobject" [drivers/cpufreq/cpufreq_ondemand.ko] undef=
ined!

Caused by commit 35b104d88338e5eddb36c670fea4752f6c10c82f ("[CPUFREQ]
ondemand - Use global sysfs dir for tuning settings").  Presumably
cpufreq_global_kobject needs an EXPORT_SYMBOL.

I have used the cpufreq tree from next-20090731 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__3_Aug_2009_12_28_19_+1000_..T3wy8lpz4KxTwl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkp2S0MACgkQjjKRsyhoI8x1kQCeMIbO+0M6iUJ+Z2TYAzvXb8Pp
lx8Anj9vWRX58jmZmYA/ySTi2yYW0xjp
=TatP
-----END PGP SIGNATURE-----

--Signature=_Mon__3_Aug_2009_12_28_19_+1000_..T3wy8lpz4KxTwl--
