From: Eric B Munson <emunson@akamai.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 16 Jul 2015 10:36:59 -0400
Message-ID: <55A7C18B.7030104@akamai.com>
References: <20150716152036.3551cef7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150716152036.3551cef7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/16/2015 01:20 AM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm 
> multi_v7_defconfig) failed like this:
> 
> arch/arm/kernel/entry-common.S: Assembler messages: 
> arch/arm/kernel/entry-common.S:108: Error: __NR_syscalls is not
> equal to the size of the syscall table
> 
> Caused by commit
> 
> d221fc1f0f25 ("mm: mlock: add new mlock, munlock, and munlockall
> system calls")
> 
> I have added the following fix patch for today:

Andrew,

I have an updated set that addresses the build failures by completing
the system call additions.  It does not yet address Jon's concern
about applying MLOCK_ONFAULT to a region with pages that are already
present (this is in progress).

Do you want the updated syscalls now or wait until the whole thing is
ready?

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au> Date: Thu, 16 Jul
> 2015 14:58:53 +1000 Subject: [PATCH] mm: mlock: fix for add new
> mlock, munlock, and munlockall system calls
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au> --- 
> arch/arm/include/asm/unistd.h | 2 +- arch/arm/kernel/calls.S
> | 2 +- 2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/include/asm/unistd.h
> b/arch/arm/include/asm/unistd.h index 32640c431a08..2516c09d65d7
> 100644 --- a/arch/arm/include/asm/unistd.h +++
> b/arch/arm/include/asm/unistd.h @@ -19,7 +19,7 @@ * This may need
> to be greater than __NR_last_syscall+1 in order to * account for
> the padding in the syscall table */ -#define __NR_syscalls  (388) 
> +#define __NR_syscalls  (392)

IIUC, this should be 391.

> 
> /* * *NOTE*: This is a ghost syscall private to the kernel.  Only
> the diff --git a/arch/arm/kernel/calls.S b/arch/arm/kernel/calls.S 
> index 514e77b26414..88808221383b 100644 ---
> a/arch/arm/kernel/calls.S +++ b/arch/arm/kernel/calls.S @@ -399,7
> +399,7 @@ CALL(sys_execveat) CALL(sys_mlock2) CALL(sys_munlock2) 
> -/* 400 */	CALL(sys_munlockall2) +/* 390 */	CALL(sys_munlockall2) 
> #ifndef syscalls_counted .equ syscalls_padding, ((NR_syscalls + 3)
> & ~3) - NR_syscalls #define syscalls_counted
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVp8GLAAoJELbVsDOpoOa9D7AQAIzPHDWeQwR5wDBBo1OyrY8N
vczsi8h9P4HlTfXH3jv6TYkcTdRRgLJN5ExIcFXUj3dRC+foYjLg+WvSszpJBuBT
ACc8jjuR+TdcDBSPrQ52QJiGwjKmQZ061HtWyCglveHl6fcAdgVq0/VLjjuEKGGj
uOFUNNjzWxCkGViOUzTdAsUsY/G6MlDMDERHUsdKkQYF4lofcaQB31L3EvcNBFHU
r9XIgzyiLDgJ22BgNs0tHBrv3JuQgrf3cEYIhYfwXj8JyrrCHo3IvcfkafGYCrIT
cTTPpnfTjPKWD2P14R4OAuLViB3GLGeKc//aSS3UZh3y0m1Bzw157BXGCQawqrUu
xRH+Ft0+gwcmI6Ez/trqu25NTq1KnOsot9XZFK2l3R0CYfYMwNOOUiNRk2+3PElk
gLu8nhGCF+f4OE7S5zQjcnnZ9rCAEprg/9ewMdRQXlT4719msDuQdzgequrzl55+
bQJQCPGIvyZhiP+Eh3LgvhJky/XY2xacs5FaHOgTYIeuHd794VQhncEbrbthMS3S
t94JjTAWssi7nHvau0ASZ3iR5R7iw0WJrvAARUiqkoZxMXQiOW5Tb3KQ+C9gp4KZ
l6w23L7MhdAMGrY5yLX1o+itet6o3nUksi4DK3qFNcr1gKVYwkXsEIkk6Bv3lRyx
rAFP155JAY6t3kyTso+I
=276b
-----END PGP SIGNATURE-----
