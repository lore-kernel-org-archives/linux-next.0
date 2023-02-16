Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6036DC636CC
	for <linux-next@archiver.kernel.org>; Thu, 16 Feb 2023 18:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjBPSG1 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 16 Feb 2023 13:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbjBPSG0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Feb 2023 13:06:26 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDA650AF1;
        Thu, 16 Feb 2023 10:06:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5292862072;
        Thu, 16 Feb 2023 18:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E920C4339B;
        Thu, 16 Feb 2023 18:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676570769;
        bh=Ljr2eUs6eDwokyGBfab5ui2UKsebb30+uWqGpYOP/Vo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UyMVtzJSxon765RySRZXqQ1iaoudYWiVwA6sg9ERgiN2Q9AlRIir02lfWcixt5jbH
         NwwTvkQIi+wJLFP1UILZfWxB/Hq3m1paIA7XkZ1KH/iq15Md8/z5MuAA2ig1ph6Dtp
         xRzzLJr0YRf6p2qwNfIyuPla91kZll9hmf+LJMeEKWYkd40i1x717+2qMXoucx5VF7
         efhnsB0LCKqRFAI/uR+9Ss1s3l1ce65yTUqT4pnaggk5CK946JEPKvwfX7vePgj7XE
         PBMNVdNTRDSov2BSKCyq6xYI7s1QmpPq3P+kA2OFiPBs1swja1XoK0z2VQN3YXuQqZ
         DHU0GUC3n1wEw==
Date:   Thu, 16 Feb 2023 10:06:07 -0800
From:   Josh Poimboeuf <jpoimboe@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
Message-ID: <20230216180607.w666rnbtm5fumziq@treble>
References: <20230216144031.45b1fc12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230216144031.45b1fc12@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 16, 2023 at 02:40:31PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc
> pseries_le_defconfig) produced this warning:
> 
> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x6128: unannotated intra-function call
> 
> I have no idea what caused this.

Adding Sathvika and Christophe.

The short term fix would be something like the below, but...

If powerpc objtool is only doing mcount, does it even make sense to run
objtool on asm files?  If so, there are probably a lot more cleanups
needed for the asm code.

So I'm thinking either we should cleanup all the powerpc asm code with
annotations like below, or we should try to make objtool mcount-mode
ignore asm files.


diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 3a7266fa8a18..1febb56ebaeb 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -472,7 +472,7 @@ SYM_FUNC_START_LOCAL(__mmu_off)
 	b	.	/* prevent speculative execution */
 SYM_FUNC_END(__mmu_off)
 
-start_initialization_book3s:
+SYM_FUNC_START_LOCAL(start_initialization_book3s)
 	mflr	r25
 
 	/* Setup some critical 970 SPRs before switching MMU off */
@@ -494,6 +494,7 @@ start_initialization_book3s:
 
 	mtlr	r25
 	blr
+SYM_FUNC_END(start_initialization_book3s)
 #endif
 
 /*
