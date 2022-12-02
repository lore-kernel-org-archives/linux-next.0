Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8044C4332F
	for <linux-next@archiver.kernel.org>; Fri,  2 Dec 2022 09:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbiLBJhl (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 2 Dec 2022 04:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbiLBJhk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Dec 2022 04:37:40 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9427D114;
        Fri,  2 Dec 2022 01:37:36 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NNnsl2Zc0z4xN3;
        Fri,  2 Dec 2022 20:37:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1669973851;
        bh=HgOcyu133X5TabU40GR4c197EsaCaAilQufyZi+kGao=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=hUJ5Sizc5PF+l8d6uuAz1aiHNHMYZmJEjA+o/a4DRn4kF+bpIJCaDkstxMo8U9SrM
         3UUbz50tIK9+Mljqx6Fpwsrw2cygz/IQ/Vph6GCS6VZ+sJSFpnAyP66VesL8cMNUb4
         63xXRvQFfxOq6mETqBhTzFITfn+zaX+vIQSF9wifSUk50lUr1pMK7Cln6wfhQquMac
         vYv3eA3XIY1OyiDg/m9L3E4mJjQdeCyHW2b/sccYMSpe8OspZKpB+66sgNrIZrZyWx
         9sqiZkIl8DYE4AizWEc9NPXoo0JtBIP+tJLQFW2m37fYxztqulpntDXfd8j/zE+Apo
         oif0ZdnohENSg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Benjamin Gray <bgray@linux.ibm.com>,
        "Christopher M. Riedl" <cmr@bluescreens.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the tip tree
In-Reply-To: <20221202112646.5813c34b@canb.auug.org.au>
References: <20221202112646.5813c34b@canb.auug.org.au>
Date:   Fri, 02 Dec 2022 20:37:29 +1100
Message-ID: <87lenq16zq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> arch/powerpc/lib/code-patching.c: In function 'text_area_cpu_up_mm':
> arch/powerpc/lib/code-patching.c:157:14: error: implicit declaration of function 'copy_init_mm' [-Werror=implicit-function-declaration]
>   157 |         mm = copy_init_mm();
>       |              ^~~~~~~~~~~~
>
> Caused by commit
>
>   107b6828a7cd ("x86/mm: Use mm_alloc() in poking_init()")
>
> interacting with commit
>
>   55a02e6ea958 ("powerpc/code-patching: Use temporary mm for Radix MMU")
>
> from the powerpc tree.
>
> I partially reverted commit 107b6828a7cd - I left the change to
> arch/x86/mm/init.c applied.  Though, I wonder if the powerpc tree should
> use mm_alloc() instead of copy_init_mm() as well?  The tip tree commit
> says:
>
>     Instead of duplicating init_mm, allocate a fresh mm. The advantage is
>     that mm_alloc() has much simpler dependencies. Additionally it makes
>     more conceptual sense, init_mm has no (and must not have) user state
>     to duplicate.

I needed to rebase my next anyway, so I've squashed in a change to use
mm_alloc() in the powerpc commit. So this issue will be gone on Monday.

cheers
