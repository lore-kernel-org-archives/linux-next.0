From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: import of rr tree failed
Date: Fri, 9 Jan 2009 09:24:49 +1100
Message-ID: <20090109092449.c35fe6bb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__9_Jan_2009_09_24_49_+1100__J4uW+hexgVMB2h8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35875 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754934AbZAHWY5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Jan 2009 17:24:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__9_Jan_2009_09_24_49_+1100__J4uW+hexgVMB2h8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

The import of the rr tree this morning failed like this:

cpualloc:documentation.patch
cpualloc:get_cpu_ptr.patch
error: patch failed: arch/alpha/include/asm/percpu.h:71
error: arch/alpha/include/asm/percpu.h: patch does not apply
error: patch failed: include/asm-generic/percpu.h:82
error: include/asm-generic/percpu.h: patch does not apply

I will use yesterday's tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__9_Jan_2009_09_24_49_+1100__J4uW+hexgVMB2h8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklmfTEACgkQjjKRsyhoI8wdQACfQvLXk2YXChx8y2TZTqHQa+W7
zokAn3UrPo+xRiaKKyhkaOhk4RokBwD4
=9rRy
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Jan_2009_09_24_49_+1100__J4uW+hexgVMB2h8--
