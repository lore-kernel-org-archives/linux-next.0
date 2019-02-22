From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Fri, 22 Feb 2019 08:37:44 +0100
Message-ID: <535192d6-2142-05a6-4088-0f71d744c345@c-s.fr>
References: <20190222181403.4ce373bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222181403.4ce373bd@canb.auug.org.au>
Content-Language: fr
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



Le 22/02/2019 à 08:14, Stephen Rothwell a écrit :
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> make[4]: *** No rule to make target 'arch/powerpc/mm/ptdump/core.o', needed by 'arch/powerpc/mm/ptdump/built-in.a'.
> 
> Caused by commit
> 
>    5df1cfa43394 ("powerpc: Move page table dump files in a dedicated subdirectory")
> 
> I have reverted that commit for today.
> 

In the Makefile, replace core.o by ptdump.o (or rename the file ptdump.c 
to core.c). Michael, what was your intention ?

Christophe
