From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: boot failure after merge of the akpm tree
Date: Fri, 31 May 2019 12:27:58 +1000
Message-ID: <1559269507.z7w3zfjexi.astroid@bobo.none>
References: <20190530161741.0b4c3e92@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530161741.0b4c3e92@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux =?iso-8859-1?q?Kernel=0A?= Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell's on May 30, 2019 4:17 pm:
> Hi all,
>=20
> My qemu boot (PowerPC le guest on PowerPC le host, with and without kvm,
> using a kernel built with powerpc_pseries_le_defconfig) oopses during boo=
t
> like this:
>=20
> -------------------------------------------------------------------------=
----
> numa: Node 0 CPUs: 0
> Using standard scheduler topology
> devtmpfs: initialized
> clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_n=
s: 19112604462750000 ns
> futex hash table entries: 256 (order: -1, 32768 bytes)
> ------------[ cut here ]------------
> kernel BUG at mm/vmalloc.c:472!
> Oops: Exception in kernel mode, sig: 5 [#1]
> LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc2 #2
> NIP:  c000000000369b18 LR: c000000000369c74 CTR: c000000000176e30
> REGS: c00000007e6636e0 TRAP: 0700   Not tainted  (5.2.0-rc2)
> MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24024882  XER: 200=
00000
> CFAR: c000000000369c78 IRQMASK: 0=20
> GPR00: c000000000369c74 c00000007e663970 c00000000119c100 000000000000000=
1=20
> GPR04: 000000007ec20000 00000001f4fe19cb 00000001f5398c84 c00000000138000=
0=20
> GPR08: 0000000000000000 0000000000000001 0000000000000001 00000000000002b=
2=20
> GPR12: 0000000000004000 c000000001380000 c000000000010fc0 000000000000000=
1=20
> GPR16: 0000000000010000 800000000000018e c000000000df9988 000000000000000=
0=20
> GPR20: 0000000000010000 0000000000002dc2 0000000000000dc0 000000000000002=
2=20
> GPR24: c00000007e2204c0 0000000000000dc2 0000000000010000 c00a00000000000=
0=20
> GPR28: c008000000000000 0000000000010000 ffffffffffffffff 0000000000000dc=
0=20
> NIP [c000000000369b18] __vmalloc_node_range+0x1f8/0x410
> LR [c000000000369c74] __vmalloc_node_range+0x354/0x410
> Call Trace:
> [c00000007e663970] [c000000000369c74] __vmalloc_node_range+0x354/0x410 (u=
nreliable)
> [c00000007e663a70] [c000000000369d80] __vmalloc+0x50/0x60
> [c00000007e663ae0] [c000000000299a98] bpf_prog_alloc_no_stats+0x58/0x120
> [c00000007e663b20] [c000000000299b90] bpf_prog_alloc+0x30/0xe0
> [c00000007e663b60] [c000000000a49dd8] bpf_prog_create+0x68/0x100
> [c00000007e663ba0] [c000000000f4f2a8] ptp_classifier_init+0x4c/0x80
> [c00000007e663be0] [c000000000f4b9e8] sock_init+0xe0/0x100
> [c00000007e663c10] [c000000000010b60] do_one_initcall+0x60/0x2c0
> [c00000007e663ce0] [c000000000ee45b0] kernel_init_freeable+0x37c/0x478
> [c00000007e663db0] [c000000000010fe4] kernel_init+0x2c/0x148
> [c00000007e663e20] [c00000000000c0cc] ret_from_kernel_thread+0x5c/0x70
> Instruction dump:
> 60000000 2c230000 418200dc e9580020 79e91f24 7c6a492a 40920170 8138002c=20
> 394f0001 794f0020 7f895040 419dffbc <0fe00000> 60000000 3f400001 4bfffedc=
=20
> ---[ end trace 49ed8f97d467e164 ]---
>=20
> Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00000005
> -------------------------------------------------------------------------=
----
>=20
> The BUG is:
>=20
> 	BUG_ON(page_shift !=3D PAGE_SIZE);
>=20
> in the !CONFIG_HAVE_ARCH_HUGE_VMAP version of vmap_hpages_range().
>=20
> I am guessing this is something to do with the vmalloc changes in Andrew'=
s
> patches (or it could be the fixup I did to Nick's patch).
>=20
> I have reverted
>=20
>   c353e2997976 ("mm/vmalloc: hugepage vmalloc mappings")
>   a826492f28d9 ("mm: move ioremap page table mapping function to mm/")
>=20
> (and my fix up) for today and things seem to work (if only because the
> BUG() has been removed :-)).

Good to know, maybe I didn't test powerpc without later enabling=20
patches...

The series also has a compile bug on ARM I have to work out, so
yeah drop those for now, I'll post a v2. The large system map patches
that I posted in that series can stay I think.

Thanks,
Nick
=
