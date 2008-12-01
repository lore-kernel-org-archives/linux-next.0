From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: boot failure on 8 way PowerPC
Date: Mon, 1 Dec 2008 18:07:17 +1100
Message-ID: <20081201180717.af808a3b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Dec_2008_18_07_17_+1100_.ioMrjthPzPnRtVz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48268 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750709AbYLAHHh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Dec 2008 02:07:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__1_Dec_2008_18_07_17_+1100_.ioMrjthPzPnRtVz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Booting next-20081128 on an 8 way (4 core, threaded) Power 5+ lpar
produces this panic:

Begin: Mounting root file system... ...
Begin: Running /scripts/local-top ...
Done.
Begin: Waiting for root file system... ...
Kernel panic - not syncing: bad return code qirr - rc =3D fffffffffffffffc

Call Trace:
[c0000000bce4b4b0] [c0000000000108cc] .show_stack+0x5c/0x1b0 (unreliable)
[c0000000bce4b560] [c00000000005dcd8] .panic+0x88/0x1d0
[c0000000bce4b610] [c000000000040e28] .smp_xics_message_pass+0xf8/0x230
[c0000000bce4b6b0] [c00000000002b0f0] .arch_send_call_function_ipi+0x60/0xb0
[c0000000bce4b740] [c00000000008d64c] .smp_call_function_many+0x20c/0x360
[c0000000bce4b810] [c00000000008d7d8] .smp_call_function+0x38/0x50
[c0000000bce4b890] [c000000000064e44] .on_each_cpu+0x24/0x90
[c0000000bce4b930] [c0000000001230c4] .invalidate_bh_lrus+0x24/0x40
[c0000000bce4b9b0] [c00000000012b3b4] .kill_bdev+0x34/0x60
[c0000000bce4ba30] [c00000000012bfa4] .__blkdev_put+0x1d4/0x220
[c0000000bce4bae0] [c0000000000f59c4] .__fput+0xf4/0x250
[c0000000bce4bb80] [c0000000000f1b70] .filp_close+0xa0/0x100
[c0000000bce4bc10] [c0000000000609c4] .put_files_struct+0x154/0x170
[c0000000bce4bcc0] [c000000000062574] .do_exit+0x184/0x900
[c0000000bce4bda0] [c000000000062d40] .do_group_exit+0x50/0xf0
[c0000000bce4be30] [c0000000000084ac] syscall_exit+0x0/0x40

The rc =3D fffffffffffffffc is an error code from the hypervisor and means
"bad parameter".

I bisected it down to:

commit 8418cd49a5c479812c4e550bfafb4388fc1fc9ab
Author: Rusty Russell <rusty@rustcorp.com.au>
Date:   Fri Nov 28 10:11:29 2008 +1100

    cpumask:smp_call_function_many
   =20
    Impact: Implementation change to remove cpumask_t from stack.
   =20
    Actually change smp_call_function_mask() to smp_call_function_many().
    We avoid cpumasks on the stack in this version.
   =20
    (S390 has its own version, but that's going away apparently).
   =20
    We have to do some dancing to figure out if 0 or 1 other cpus are in
    the mask supplied and the online mask without allocating a tmp
    cpumask.  It's still fairly cheap.
   =20
    We allocate the cpumask at the end of the call_function_data
    structure: if allocation fails we fallback to smp_call_function_single
    rather than using the baroque quiescing code (which needs a cpumask on
    stack).
   =20
    (Thanks to Hiroshi Shimamoto for spotting several bugs in previous vers=
ions!)
   =20
    Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
    Signed-off-by: Mike Travis <travis@sgi.com>
    Cc: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
    Cc: npiggin@suse.de
    Cc: axboe@kernel.dk

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Dec_2008_18_07_17_+1100_.ioMrjthPzPnRtVz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkzjSUACgkQjjKRsyhoI8xtUwCfTi+rKQkRiF6XghKReY8NRnHe
iLQAnjn3lFrUz6paFZqScplBLW+WVx08
=k29v
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Dec_2008_18_07_17_+1100_.ioMrjthPzPnRtVz--
