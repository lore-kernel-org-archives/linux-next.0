From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Jan 18
Date: Wed, 18 Jan 2017 15:44:59 -0500
Message-ID: <CAP=VYLoirfK_wBSZuV_9YO_Cnm1SN=CsQ0zN5dZ6pMF4nU3D5g@mail.gmail.com>
References: <20170118163225.5776630e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170118163225.5776630e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Herbert Xu <herbert@gondor.apana.org.au>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 18, 2017 at 12:32 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Changes since 20170117:
>
> The arm-soc tree gained a conflict against the arm tree.
>
> The amlogic tree gained a conflict against the arm-soc tree.
>
> Non-merge commits (relative to Linus' tree): 3676
>  4511 files changed, 139928 insertions(+), 85028 deletions(-)

Crypto now fails on arm allmodconfig:

arch/arm/crypto/Makefile:25: These ARMv8 Crypto Extensions modules
need binutils 2.23 or higher
arch/arm/crypto/Makefile:26:  aes-arm-ce.o sha1-arm-ce.o sha2-arm-ce.o
ghash-arm-ce.o crct10dif-arm-ce.o crc32-arm-ce.o
  AS [M]  arch/arm/crypto/aes-neonbs-core.o
  CC [M]  arch/arm/crypto/aes-neonbs-glue.o
/home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S: Assembler messages:
/home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:817:
Error: bad type for scalar -- `vmov q1h[1],r10'
/home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:817:
Error: bad type for scalar -- `vmov q1h[0],r9'
/home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:817:
Error: bad type for scalar -- `vmov q1l[1],r8'
/home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:817:
Error: bad type for scalar -- `vmov q1l[0],r7'
/home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:818:
Error: bad type for scalar -- `vmov q2h[1],r10'
/home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:818:
Error: bad type for scalar -- `vmov q2h[0],r9'

[many more similar scalar errors deleted]

The 2.2.3 warning was there in the past, but it wasn't fatal.  I'm using
an older binutils 2.22 from the kernel.org crosstool stuff.

Seems sfr's builds get the same issue:

http://kisskb.ellerman.id.au/kisskb/buildresult/12910945/

A mindless "git bisect run" comes up with:

cc477bf645736739e69d31fdf715281ef0dd5f9b is the first bad commit
commit cc477bf645736739e69d31fdf715281ef0dd5f9b
Author: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Wed Jan 11 16:41:54 2017 +0000

    crypto: arm/aes - replace bit-sliced OpenSSL NEON code

Maybe binnutils 2.22 is finally too old?

Paul.
--
