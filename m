From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Oct 15
Date: Tue, 16 Oct 2018 07:24:39 +1100
Message-ID: <20181016072439.42613abd@canb.auug.org.au>
References: <20181015192546.15faf3a1@canb.auug.org.au>
        <20181015182637.GA16445@roeck-us.net>
        <20181016071240.3f62816d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hFNmF3Jj0D7c+SX.8sV79qt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016071240.3f62816d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Rob Herring <robherring2@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/hFNmF3Jj0D7c+SX.8sV79qt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 16 Oct 2018 07:12:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 15 Oct 2018 11:26:37 -0700 Guenter Roeck <linux@roeck-us.net> wro=
te:
> >
> > ALl ppc qemu tests (including big endian pseries) also generate a warni=
ng.
> >=20
> > WARNING: CPU: 0 PID: 0 at mm/memblock.c:1301 .memblock_alloc_range_nid+=
0x20/0x68

That is:

static phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
                                        phys_addr_t align, phys_addr_t star=
t,
                                        phys_addr_t end, int nid,
                                        enum memblock_flags flags)
{
       if (WARN_ON_ONCE(!align))
                align =3D SMP_CACHE_BYTES;

Looks like patch

  "memblock: stop using implicit alignment to SMP_CACHE_BYTES"

missed some places ...

> > Modules linked in:
> > CPU: 0 PID: 0 Comm: swapper Not tainted 4.19.0-rc7-next-20181015 #1
> > NIP:  c000000000f99198 LR: c000000000f99490 CTR: c000000000bb8364
> > REGS: c000000001217a78 TRAP: 0700   Not tainted  (4.19.0-rc7-next-20181=
015)
> > MSR:  0000000080021000 <CE,ME>  CR: 24000422  XER: 20000000
> > IRQMASK: 1=20
> > GPR00: c000000000f99490 c000000001217d00 c00000000121a500 0000000000000=
0c0=20
> > GPR04: 0000000000000000 0000000000000000 0000000000000000 fffffffffffff=
fff=20
> > GPR08: 0000000000000000 00000000000000c0 0000000000000018 0000000000000=
0b7=20
> > GPR12: 0000000000000040 c000000000fe7840 0000000000000000 0000000000000=
000=20
> > GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000=
000=20
> > GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000=
000=20
> > GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000=
000=20
> > GPR28: c000000000000304 c000000001262088 00000000000000c0 c000000000fea=
500=20
> > NIP [c000000000f99198] .memblock_alloc_range_nid+0x20/0x68
> > LR [c000000000f99490] .memblock_alloc_base+0x18/0x48
> > Call Trace:
> > [c000000001217d00] [c000000002a00000] 0xc000000002a00000 (unreliable)
> > [c000000001217d80] [c000000000f99490] .memblock_alloc_base+0x18/0x48
> > [c000000001217df0] [c000000000f7a274] .allocate_paca_ptrs+0x3c/0x74
> > [c000000001217e70] [c000000000f78bf0] .early_init_devtree+0x288/0x320
> > [c000000001217f10] [c000000000f79b6c] .early_setup+0x80/0x130
> > [c000000001217f90] [c000000000000528] start_here_multiplatform+0x68/0x80

--=20
Cheers,
Stephen Rothwell

--Sig_/hFNmF3Jj0D7c+SX.8sV79qt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvE94cACgkQAVBC80lX
0Gx72Af+J7j/HQpnXqTOaoXhTJfrn/kMP1PLBJQ/AqSa43liPmSQ+1KZ5iDtF6GW
p0+1gQyLCEYwnxadat4Pmfs6iadVo4NUoVshTTps9vx8U0xLxO0xEHTR7fwqsc7E
X4thIt2RlvN5W5ikPWaUqMfvtXiFe+5+sHjyHA5ADyDdmX4TqAM0R27Dw2Wd+VJw
5Iw+zqsK6YLtkQGfLea78o3wvOlqKs9N+h9kPws1Rf0p0bCMDkeBPYtQTHEZM8vr
sgDAFuWcVc1wMkEI11i8tzzwOzKpGRt6lLLmrgPdiQldgbX1DHLJ0w7W6stq3MQN
t+KS1u65FdG3t0Qdfb4YzNMjN0nByQ==
=lsXR
-----END PGP SIGNATURE-----

--Sig_/hFNmF3Jj0D7c+SX.8sV79qt--
