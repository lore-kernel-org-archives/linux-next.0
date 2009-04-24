From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Next April 24 : BUG: lock held at task exit time!
Date: Fri, 24 Apr 2009 17:55:09 +1000
Message-ID: <20090424175509.561c96ad.sfr@canb.auug.org.au>
References: <20090424150456.ff35e4ea.sfr@canb.auug.org.au>
	<49F1626D.6080102@in.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__24_Apr_2009_17_55_09_+1000_BzaLvDqRx/gHM5wx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33241 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753153AbZDXHzT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Apr 2009 03:55:19 -0400
In-Reply-To: <49F1626D.6080102@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@ozlabs.org, Ingo Molnar <mingo@redhat.com>, peterz@infradead.org, Hugh Dickins <hugh@veritas.com>, Al Viro <viro@ZenIV.linux.org.uk>, Oleg Nesterov <oleg@redhat.com>

--Signature=_Fri__24_Apr_2009_17_55_09_+1000_BzaLvDqRx/gHM5wx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Fri, 24 Apr 2009 12:25:41 +0530 Sachin Sant <sachinp@in.ibm.com> wrote:
>
> While booting today's next tree on a powerpc box [ power 6 blade]
> observed the following :
>=20
> khelper used greatest stack depth: 10176 bytes left
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [ BUG: lock held at task exit time! ]
> -------------------------------------
> khelper/21 is exiting with locks still held!
> 2 locks held by khelper/21:
>  #0:  (rcu_read_lock){.+.+.+}, at: [<c0000000001382fc>]=20
> .check_unsafe_exec+0x44/0x148
>  #1:  (rcu_read_lock){.+.+.+}, at: [<c000000000138368>]=20
> .check_unsafe_exec+0xb0/0x148
>=20
> stack backtrace:
> Call Trace:
> [c000000044483cf0] [c000000000011a54] .show_stack+0x6c/0x16c (unreliable)
> [c000000044483da0] [c00000000009ae14] .debug_check_no_locks_held+0x98/0xb4
> [c000000044483e20] [c000000000073b1c] .do_exit+0x758/0x7b0
> [c000000044483f00] [c0000000000853d8] .____call_usermodehelper+0x170/0x174
> [c000000044483f90] [c00000000002bd8c] .kernel_thread+0x54/0x70
> net_namespace: 2000 bytes
>=20
> Complete dmesg attached. Let me know if you need any other info. I will=20
> try yesterday's next
> tree to check if this problem can be recreated.

Almost certainly commit 874a9e18f25c86dbc199ad32ddd9ca44d25290e8
("check_unsafe_exec: s/lock_task_sighand/rcu_read_lock/") which has a
typo (two locks instead of lock/unlock) as pointed out by Hugh Dickins
(<Pine.LNX.4.64.0904240526080.15735@blonde.anvils> on LKML).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__24_Apr_2009_17_55_09_+1000_BzaLvDqRx/gHM5wx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknxcF0ACgkQjjKRsyhoI8xbwQCeOIN6mOp7i/Fzwosg5CC9/UuW
El8An3/bga4D8EL7FtrPCG+D4VUzvBx2
=Yo2H
-----END PGP SIGNATURE-----

--Signature=_Fri__24_Apr_2009_17_55_09_+1000_BzaLvDqRx/gHM5wx--
