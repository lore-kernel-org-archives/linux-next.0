From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: x86/cpufreq merge conflict
Date: Mon, 19 May 2008 14:39:27 +1000
Message-ID: <20080519143927.e8b43d39.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_May_2008_14_39_27_+1000_JnGSBmCsDNgJFMK4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51684 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750785AbYESEjh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 00:39:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

--Signature=_Mon__19_May_2008_14_39_27_+1000_JnGSBmCsDNgJFMK4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Ingo,

Today's linux-next cpufreq merge got a conflict in
drivers/cpufreq/cpufreq.c between commit
fdbf6c63c1bd250d45a59a6392fa18ccb360837b ("x86: Use performance variant
for_each_cpu_mask_nr") from the x86 tree and commit
ae47c109341198f814767d2f06a1c1e4c7910fb9 ("[CPUFREQ] change cpu freq
arrays to per_cpu variables") from the cpufreq tree.  The conflict is
just contextual with the former changing for_each_cpu_mask to
for_each_cpu_mask_nr in a couple of places right next to the latter
changing "cpufreq_cpu_data[j]" to "per_cpu(cpufreq_cpu_data, j)".

I did the obvious fixups but maybe worth a look.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_May_2008_14_39_27_+1000_JnGSBmCsDNgJFMK4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMQSETgG2atn1QN8RAiW9AJ4nL36gq+ZIFUy7ISfWv4bGv1UUmQCdFBqJ
IFO2L5ZC46KG2X46y+uQ5LE=
=WQX4
-----END PGP SIGNATURE-----

--Signature=_Mon__19_May_2008_14_39_27_+1000_JnGSBmCsDNgJFMK4--
