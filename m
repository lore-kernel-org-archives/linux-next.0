From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: ia64 dies in slab code on next-20120906
Date: Fri, 7 Sep 2012 11:26:06 +1000
Message-ID: <20120907112606.7d09e84c4782b748a95e1946@canb.auug.org.au>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__7_Sep_2012_11_26_06_+1000_AFUF.NDRvFOqv3R+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:39431 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207Ab2IGB0S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Sep 2012 21:26:18 -0400
In-Reply-To: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Luck <tony.luck@intel.com>
Cc: linux-next@vger.kernel.org, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>

--Signature=_Fri__7_Sep_2012_11_26_06_+1000_AFUF.NDRvFOqv3R+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 6 Sep 2012 11:39:16 -0700 Tony Luck <tony.luck@intel.com> wrote:
>
> Worked fine yesterday on next-20120905, crashes today. First sign of trou=
ble
> was an unaligned access, then a NULL dereference. SL*B related bits of
> my config:
>=20
> CONFIG_SLUB_DEBUG=3Dy
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> CONFIG_SLABINFO=3Dy
> # CONFIG_SLUB_DEBUG_ON is not set
> # CONFIG_SLUB_STATS is not set

I get a similar crash on some of my PowerPC boot tests:

config bits:

CONFIG_SLUB_DEBUG=3Dy
# CONFIG_SLAB is not set
CONFIG_SLUB=3Dy
CONFIG_SLABINFO=3Dy
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set

console log:

Memory: 10297068k/10485760k available (12364k kernel code, 188692k reserved=
, 1228k data, 904k bss, 472k init)
Unable to handle kernel paging request for data at address 0x6c6f632d343039=
36
Faulting instruction address: 0xc0000000001ba73c
Oops: Kernel access of bad area, sig: 11 [#1]
SMP NR_CPUS=3D32 NUMA pSeries
Modules linked in:
NIP: c0000000001ba73c LR: c0000000001ba9a4 CTR: 0000000000000000
REGS: c000000000d2f860 TRAP: 0300   Not tainted  (3.6.0-rc4-autokern1)
MSR: 8000000002001032 <SF,VEC,ME,IR,DR,RI>  CR: 24028084  XER: 00000001
SOFTE: 0
CFAR: 00000000000057ac
DAR: 6c6f632d34303936, DSISR: 40000000
TASK =3D c000000000c58b00[0] 'swapper' THREAD: c000000000d2c000 CPU: 0
GPR00: 0000000080010400 c000000000d2fae0 c000000000d2bf70 c00000027e000000=
=20
GPR04: f000000008b901c0 c00000027e008000 0000000000000000 0000000000000001=
=20
GPR08: 0000000022000000 6c6f632d34303936 000000000000000e 0000000000000000=
=20
GPR12: 0000000044022088 c00000000fffb000 0000000001080000 c00000027e002040=
=20
GPR16: c00000027fee9298 c000000000d4d060 0000000000001680 0000000000000001=
=20
GPR20: c000000000d2fc90 0000000000000000 0000000000000000 0000000000210d00=
=20
GPR24: 0000000000000000 f000000008b901c0 c00000027e008000 c00000027e008000=
=20
GPR28: c00000027e008000 c00000027e008000 c000000000ca32e0 c00000027e000000=
=20
NIP [c0000000001ba73c] .setup_object+0x7c/0xa0
LR [c0000000001ba9a4] .new_slab+0x244/0x3e0
Call Trace:
[c000000000d2fae0] [c000000000d2fb60] init_thread_union+0x3b60/0x4000 (unre=
liable)
[c000000000d2fb70] [c0000000001ba9a4] .new_slab+0x244/0x3e0
[c000000000d2fc20] [c0000000001bb794] .__slab_alloc+0x364/0x5a0
[c000000000d2fd70] [c0000000001bc8b8] .kmem_cache_alloc+0xb8/0x1f0
[c000000000d2fe20] [c000000000bd030c] .kmem_cache_init+0x128/0x378
[c000000000d2fef0] [c000000000b9d974] .start_kernel+0x1e0/0x48c
[c000000000d2ff90] [c0000000000096f8] .start_here_common+0x20/0x28
Instruction dump:
eba1ffe8 ebc1fff0 ebe1fff8 7c0803a6 4e800020 7ca42b78 38a000bb 4bffe5a9=20
7fe3fb78 7fa4eb78 4bffff0d 4bffffc0 <e8090000> f8410028 7fa3eb78 7c0903a6=20

The data address above is "loc-4096" ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__7_Sep_2012_11_26_06_+1000_AFUF.NDRvFOqv3R+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQSU0uAAoJEECxmPOUX5FEfFQP/iuScqCXcRkpIPMtJKYZ34CR
KjsTJeNwLEiyBf+CV94DReRgo+e7zoCuTnv6en0h5yi2//ncIdGjKJQqaRvdtbXv
8PGMR+0s7BixxTtp7SG5/ZuTfZbD+8dRd4B3yDHxPjQAB6/FSNE9XHUXnBvUCjYG
G8OPYZPAsV1f7mfwH+gPVUb/9Fs30lp2vCAjIo0AWfn7bMQhILpfNJBM84fDgoE+
6KPKKYSiGRSmvIXMAJhTJ8uDX/wq8KhdgTQF76yzBv5+Ui4UO/uSBg+BJSVPTXL2
2LwBPmTt0Bfv6HZ+1CvsKtm7o3kaKoeCaaC7phDolNQP40xPa8Yc5Wdvl/n/AXrd
OUyg/YOgj0aaqFsZ5KwBFBIbnJWmQXsJcaASCVyclWV+oZ69UMEEk8QQ6QLnzjEc
2kq+yDP/w//PfmZpzqrDQe0ma6gcB4WNkavylGCoAgYn8+0Xzwrt4Gz8+CsCHVUb
Gkmsh9EKGs1ke1iavrgF4gsRyYKLRaTGJIlpHxJyVvmEIUtjsxI+JAzMj22+HIiI
p2CeqZeOBYcHHmZnD0QrsSXL+Lwqt4mA9V5MkgDKpkMD0hGhBQLYOoHIgf815H4H
oz08vNORy9LbVorbMUZj6phN6T19/IFfPaoyolVzQshh3LH4q6nSl38BEZ2gxm4u
Uut6LX22U7oVb1T3tefq
=2VsE
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Sep_2012_11_26_06_+1000_AFUF.NDRvFOqv3R+--
