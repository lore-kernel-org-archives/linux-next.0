From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: linux-next: Tree for Jan 18
Date: Thu, 19 Jan 2017 12:19:11 +0000
Message-ID: <CAKv+Gu8vGQ5o2SngN59njESR4j4Ui-MggdWr_hTq3K-50JEXXQ@mail.gmail.com>
References: <20170118163225.5776630e@canb.auug.org.au> <CAP=VYLoirfK_wBSZuV_9YO_Cnm1SN=CsQ0zN5dZ6pMF4nU3D5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:35309 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752402AbdASMTM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Jan 2017 07:19:12 -0500
Received: by mail-io0-f170.google.com with SMTP id j18so36000029ioe.2
        for <linux-next@vger.kernel.org>; Thu, 19 Jan 2017 04:19:12 -0800 (PST)
In-Reply-To: <CAP=VYLoirfK_wBSZuV_9YO_Cnm1SN=CsQ0zN5dZ6pMF4nU3D5g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>

On 18 January 2017 at 20:44, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> On Wed, Jan 18, 2017 at 12:32 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> Changes since 20170117:
>>
>> The arm-soc tree gained a conflict against the arm tree.
>>
>> The amlogic tree gained a conflict against the arm-soc tree.
>>
>> Non-merge commits (relative to Linus' tree): 3676
>>  4511 files changed, 139928 insertions(+), 85028 deletions(-)
>
> Crypto now fails on arm allmodconfig:
>
> arch/arm/crypto/Makefile:25: These ARMv8 Crypto Extensions modules
> need binutils 2.23 or higher
> arch/arm/crypto/Makefile:26:  aes-arm-ce.o sha1-arm-ce.o sha2-arm-ce.o
> ghash-arm-ce.o crct10dif-arm-ce.o crc32-arm-ce.o
>   AS [M]  arch/arm/crypto/aes-neonbs-core.o
>   CC [M]  arch/arm/crypto/aes-neonbs-glue.o
> /home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S: Assembler messages:
> /home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:817:
> Error: bad type for scalar -- `vmov q1h[1],r10'
> /home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:817:
> Error: bad type for scalar -- `vmov q1h[0],r9'
> /home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:817:
> Error: bad type for scalar -- `vmov q1l[1],r8'
> /home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:817:
> Error: bad type for scalar -- `vmov q1l[0],r7'
> /home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:818:
> Error: bad type for scalar -- `vmov q2h[1],r10'
> /home/paul/git/linux-head/arch/arm/crypto/aes-neonbs-core.S:818:
> Error: bad type for scalar -- `vmov q2h[0],r9'
>
> [many more similar scalar errors deleted]
>
> The 2.2.3 warning was there in the past, but it wasn't fatal.  I'm using
> an older binutils 2.22 from the kernel.org crosstool stuff.
>
> Seems sfr's builds get the same issue:
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/12910945/
>
> A mindless "git bisect run" comes up with:
>
> cc477bf645736739e69d31fdf715281ef0dd5f9b is the first bad commit
> commit cc477bf645736739e69d31fdf715281ef0dd5f9b
> Author: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Date:   Wed Jan 11 16:41:54 2017 +0000
>
>     crypto: arm/aes - replace bit-sliced OpenSSL NEON code
>
> Maybe binnutils 2.22 is finally too old?
>

This fixes it for me

diff --git a/arch/arm/crypto/aes-neonbs-core.S
b/arch/arm/crypto/aes-neonbs-core.S
index c9477044fbba..12da247164d1 100644
--- a/arch/arm/crypto/aes-neonbs-core.S
+++ b/arch/arm/crypto/aes-neonbs-core.S
@@ -766,13 +766,13 @@ ENTRY(aesbs_cbc_decrypt)
 ENDPROC(aesbs_cbc_decrypt)

        .macro          next_ctr, q
-       vmov            \q\()h[1], r10
+       vmov.32         \q\()h[1], r10
        adds            r10, r10, #1
-       vmov            \q\()h[0], r9
+       vmov.32         \q\()h[0], r9
        adcs            r9, r9, #0
-       vmov            \q\()l[1], r8
+       vmov.32         \q\()l[1], r8
        adcs            r8, r8, #0
-       vmov            \q\()l[0], r7
+       vmov.32         \q\()l[0], r7
        adc             r7, r7, #0
        vrev32.8        \q, \q
        .endm

so I will propose this to Herbert as a followup patch.

Thanks,
Ard.
