From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the vfs tree
Date: Tue, 19 Jun 2018 11:53:35 +1000
Message-ID: <20180619115335.59ad4e8d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2nBrgHGOdhIXZyxi7vtU15b"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2nBrgHGOdhIXZyxi7vtU15b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from arch/powerpc/include/asm/thread_info.h:27:0,
                 from include/linux/thread_info.h:38,
                 from include/asm-generic/preempt.h:5,
                 from ./arch/powerpc/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:81,
                 from include/linux/spinlock.h:51,
                 from include/linux/wait.h:9,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:6,
                 from include/uapi/linux/aio_abi.h:31,
                 from include/linux/syscalls.h:74,
                 from fs/statfs.c:2:
fs/statfs.c: In function 'fsinfo_generic_limits':
arch/powerpc/include/asm/page.h:38:20: warning: large integer implicitly tr=
uncated to unsigned type [-Woverflow]
 #define PAGE_SIZE  (ASM_CONST(1) << PAGE_SHIFT)
                    ^
fs/statfs.c:448:25: note: in expansion of macro 'PAGE_SIZE'
  lim->max_symlink_len =3D PAGE_SIZE;
                         ^~~~~~~~~

Introduced by commit

  4afa2cf6f155 ("fsinfo: Add a system call to allow querying of filesystem =
information")

--=20
Cheers,
Stephen Rothwell

--Sig_/2nBrgHGOdhIXZyxi7vtU15b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsoYh8ACgkQAVBC80lX
0GyphggAgniJkJG+PXU3KCpVLmtq/4XokZdimnm98gUWRyF/u61lKN12+m9fPkAI
gZK+Jsa87VytZqlAIiv52XgGjbakY4xb0uFU8xBhivXn5bVvOFoyxGYtMSMfw4wp
dX9w80t+rpVvKVv69L53nYoDyhsLIHB52SI5vqieIbsuhZtLxOxz5EFJhk4+dmw8
9qN/8+jlQeT5j/0gBFNhk212bMflFVm6JxO3nwpa6drYt730HO3vLLZ4CG1gEEBN
eHSPtSOFa4SfdN2zW2v5PUOaEENyOZbPTNldwTPaNQVALn/Bc1cImIkybsChhRy8
mW7CR1a4M8pDMbCDg1il7zdaBnV1kQ==
=HPGs
-----END PGP SIGNATURE-----

--Sig_/2nBrgHGOdhIXZyxi7vtU15b--
