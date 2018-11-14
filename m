From: Joel Stanley <joel@jms.id.au>
Subject: Re: linux-next: build warnings from Linus' tree
Date: Wed, 14 Nov 2018 15:24:04 +1030
Message-ID: <CACPK8XeDHt46rUJWQ1n=4fRWioogs9K0Z8dkxUa=E2ShfQ1Vdg@mail.gmail.com>
References: <20180612081413.323d85b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612081413.323d85b8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alan Modra <amodra@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hello Alan,

On Tue, 12 Jun 2018 at 07:44, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Building Linus' tree, today's linux-next build (powerpc ppc64_defconfig)
> produced these warning:
>
> ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
> ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
> ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
>
> This may just be because I have started building using the native Debian
> gcc for the powerpc builds ...

Do you know why we started creating these?

If it's intentional, should we be putting including them in the same
way as .hash sections?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/kernel/vmlinux.lds.S#n282

  .hash : AT(ADDR(.hash) - LOAD_OFFSET) { *(.hash) }

Cheers,

Joel
