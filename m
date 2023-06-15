Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545F4EB64DD
	for <linux-next@archiver.kernel.org>; Thu, 15 Jun 2023 08:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244467AbjFOIcx (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 15 Jun 2023 04:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244629AbjFOIcv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Jun 2023 04:32:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6E41720;
        Thu, 15 Jun 2023 01:32:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 52D8862AA3;
        Thu, 15 Jun 2023 08:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADEAC433C8;
        Thu, 15 Jun 2023 08:32:47 +0000 (UTC)
Date:   Thu, 15 Jun 2023 09:32:44 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Oliver Upton <oliver.upton@linux.dev>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <ZIrMrHt8IpUKL8DG@arm.com>
References: <20230615124558.2cea58b3@canb.auug.org.au>
 <ZIq/s8p10EGI9fqu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIq/s8p10EGI9fqu@linux.dev>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 15, 2023 at 07:37:23AM +0000, Oliver Upton wrote:
> On Thu, Jun 15, 2023 at 12:45:58PM +1000, Stephen Rothwell wrote:
> > Today's linux-next merge of the kvm-arm tree got a conflict in:
> > 
> >   arch/arm64/kernel/kaslr.c
> > 
> > between commit:
> > 
> >   6e13b6b923b3 ("arm64: kaslr: split kaslr/module initialization")
> >   e46b7103aef3 ("arm64: module: move module randomization to module.c")
> > 
> > from the arm64 tree and commit:
> > 
> >   0ddc312b7c73 ("arm64: Turn kaslr_feature_override into a generic SW feature override")
> > 
> > from the kvm-arm tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This is
> > now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your
> > tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
> 
> Diff LGTM, thanks Stephen.
> 
> Catalin, I'd like to resolve this in the kvmarm tree and merge
> for-next/module-alloc. You alright with that?

Yes, feel free to pull that into your tree.

-- 
Catalin
