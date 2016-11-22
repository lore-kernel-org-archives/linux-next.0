From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with Linus' tree
Date: Tue, 22 Nov 2016 11:44:25 -0600
Message-ID: <87r363h0jq.fsf@xmission.com>
References: <20161122191719.3e438d1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161122191719.3e438d1e@canb.auug.org.au> (Stephen Rothwell's
        message of "Tue, 22 Nov 2016 19:17:19 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Stoakes <lstoakes@gmail.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> Today's linux-next merge of the userns tree got conflicts in:
>
>   arch/alpha/kernel/ptrace.c
>   arch/blackfin/kernel/ptrace.c
>   arch/cris/arch-v32/kernel/ptrace.c
>   arch/ia64/kernel/ptrace.c
>   arch/mips/kernel/ptrace32.c
>   arch/powerpc/kernel/ptrace32.c
>   include/linux/mm.h
>   kernel/ptrace.c
>   mm/memory.c
>   mm/nommu.c
>
> between commit:
>
>   442486ec1096 ("mm: replace __access_remote_vm() write parameter with gup_flags")
> (and others)
>
> from Linus' tree and commit:
>
>   0cabf9a438e1 ("ptrace: Don't allow accessing an undumpable mm")
>
> from the userns tree.
>
> I just used the version of the userns tree from next-20161117 for today.
> Please merge v4.9-rc2 and fix up the conflicts (or just rebase onto
> v4.9-rc2).

Will do.  Thank you.

Eric
