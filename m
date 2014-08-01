From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the ftrace tree
Date: Fri, 1 Aug 2014 14:44:20 +1000
Message-ID: <20140801144420.4ba1c011@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aI.ALIqRkdhyln5l74Pl+kf"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41753 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750770AbaHAEo3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 Aug 2014 00:44:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark D Rustad <mark.d.rustad@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Paolo Bonzini <pbonzini@redhat.com>

--Sig_/aI.ALIqRkdhyln5l74Pl+kf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in
arch/x86/kvm/mmutrace.h between commit 7b039cb4c5a9 ("tracing: Add
trace_seq_buffer_ptr() helper function") from the ftrace tree and
commit 42cbc04fd3b5 ("x86/kvm: Resolve shadow warnings in macro
expansion") from the kvm tree.

I fixed it up (I dropped the ftrace tree's change to this file) and can
carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/aI.ALIqRkdhyln5l74Pl+kf
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJT2xspAAoJEMDTa8Ir7ZwVuHUQAJHLisz/E4W5cB5J0Dp2t8L9
1VDbmS+03rEjVqurjkla9AwueDaAbIM4DlEqhzbqLbC17LNxx2jcAGA7d8Rdv27L
xD5VQeY/6Ab4mxVgr4RMZlaMQ79z9XIlNbep9nKfHM006eBPHpD++yGlcpuOdTsD
sxYZ2Ui8GgjTAAF3xj6x+kDcuXG3C7Dl1zWFyBVmpe24f9ZbI4ntAzSXpq0bC+Py
BYIhpYBnDefhCdhN7/EMMGUFBkKy78mywNYthIKlT4uLas1FBF0ppC2kgVq+zFnR
NzlVuAfGcZ6cpbwQO/WicyZ5dIPF5AC2FqsbaRT6vxSa7msndP0EQZpGprcWzprd
OpvsAJ5OnDQPZIjyfvSvaGyNN7eYIGQO9YCTjTNQYHGdq+ubObF3RT9r1y5JgEhu
IKWdPDgJStAJnOsIB++wK15rCGi+qx+YgIegDOrOYTlL4uCSKo+dsxk9Yo2revWV
BchM81C/BXHzrbaLn6OFUhnL82/7V/8w+m6iEjvDcxsKw97GekyJviuAqtbIuEoU
UJmReVWB3UQElqImWc4IuqxTFV7RuVF45M2MJutAmqbokf5VYgivtqvcU52JHEW7
oniyEoFsVukD/7nZrGn/Ct2Ftx4q1CW/PqCgK04K+h4lgI3xAfNbFuhJeDPrYw0L
zvQ7kZSMQOp5Cup6zqPk
=kMUJ
-----END PGP SIGNATURE-----

--Sig_/aI.ALIqRkdhyln5l74Pl+kf--
