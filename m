From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the x86/cpus4096 trees
Date: Thu, 5 Mar 2009 14:59:43 +1100
Message-ID: <20090305145943.145b3ad9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Mar_2009_14_59_43_+1100_THoNF84=2S1c9RPR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33388 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753304AbZCEEYn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Mar 2009 23:24:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Thu__5_Mar_2009_14_59_43_+1100_THoNF84=2S1c9RPR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
drivers/firmware/dcdbas.c between commit
c90e785be2fd9dfaef1f030d0314e44052553736 ("cpumask: use cpumask_var_t in
dcdbas.c") from the x86 and cpus4096 trees and commit
d4e7753fce670a269f55d4b7cafe9d3e77d7d26f (misc:work_on_cpu-dcdbas"") from
the rr tree.

It appears that the former patch is effectively replaced by the latter.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Mar_2009_14_59_43_+1100_THoNF84=2S1c9RPR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmvTi8ACgkQjjKRsyhoI8zR7gCfepvZne2BpW+M75GBA81i2+7g
/NUAoItWebbhlpYjjD30xnl8I9sqCcS7
=QhSS
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Mar_2009_14_59_43_+1100_THoNF84=2S1c9RPR--
