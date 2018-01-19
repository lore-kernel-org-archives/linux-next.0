From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the powerpc tree with the powerpc-fixes tree
Date: Fri, 19 Jan 2018 22:18:11 +1100
Message-ID: <87efmmayh8.fsf@concordia.ellerman.id.au>
References: <20180118092112.0e46a25c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37037 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755589AbeASLSO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Jan 2018 06:18:14 -0500
In-Reply-To: <20180118092112.0e46a25c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>
>   arch/powerpc/kernel/setup-common.c
>
> between commit:
>
>   349524bc0da6 ("powerpc: Don't preempt_disable() in show_cpuinfo()")
>
> from the powerpc-fixes tree and commit:
>
>   f5f563012a70 ("powerpc: Make newline in cpuinfo unconditional")
>
> from the powerpc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Nah that guy is a jerk.

Thanks for the report.

cheers
