From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: percpu tree build warning
Date: Thu, 12 Nov 2009 17:45:58 +1100
Message-ID: <20091112174558.128cea97.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Nov_2009_17_45_58_+1100_E_s=WeGidihPSJTw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45742 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750894AbZKLGp7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Nov 2009 01:45:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__12_Nov_2009_17_45_58_+1100_E_s=WeGidihPSJTw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

drivers/net/loopback.c: In function 'loopback_get_stats':
drivers/net/loopback.c:109: warning: initialization discards qualifiers fro=
m pointer target type

The line in question is:

	lb_stats =3D per_cpu_ptr(pcpu_lstats, i);

Where "lb_stats" and "pcpu_lstats" are both "const struct pcpu_lstats
*".  I guess this is because of __verify_pcpu_ptr().

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Nov_2009_17_45_58_+1100_E_s=WeGidihPSJTw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr7ryYACgkQjjKRsyhoI8yaeACfQWv7Gd0vjM+1nOKdt8ljbros
py4An0OvPDgXgfRwlPGv2xNwFyroRMk1
=cHkk
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Nov_2009_17_45_58_+1100_E_s=WeGidihPSJTw--
