From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the powerpc tree
Date: Fri, 20 May 2011 14:14:25 +1000
Message-ID: <20110520141425.dd38cb7d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_May_2011_14_14_25_+1000_xAAV=6AbXkTTvSll"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Milton Miller <miltonm@bga.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__20_May_2011_14_14_25_+1000_xAAV=6AbXkTTvSll
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
arch/powerpc/kernel/smp.c between commit 23d72bfd8f9f ("powerpc:
Consolidate ipi message mux and demux") from the powerpc tree and commit
184748cc50b2 ("sched: Provide scheduler_ipi() callback in response to
smp_send_reschedule()") from the tip tree.

The former superceded part of the latter's changes, so I just used the
former for that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_May_2011_14_14_25_+1000_xAAV=6AbXkTTvSll
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN1eqhAAoJEDMEi1NhKgbsR+IIAKKfRcS7sd8JgO2z23qr7Z/w
41pG3hRdtEco7wvvL5j0dwyRbBqHINt4bq5g54PZvdke1ztH4acXfdPN9B933Izf
l+wijwxpcq2O33goFwYdIe2iZRvSLF8a4mwFNLOUG2avr3Uhyy6AXGZPYWPwt5eo
qUM1mjogl4i/r3Z3upi07Uee9pUMDwlk6g4mzDI02tWKIE+kGoUNnGbjXnxO4tvR
mco7/rxHYywgnxW1PiMM/hj/LqhQFOLpldRG6RxYLkjqLr8PstRmLkXL3z2KJ5AD
BBwMZOfdXNiYaIFxyldLw6KYjiayqLwi/bQsg0GLts1kovwDIQydh0SEbre5Q4k=
=vlAW
-----END PGP SIGNATURE-----

--Signature=_Fri__20_May_2011_14_14_25_+1000_xAAV=6AbXkTTvSll--
