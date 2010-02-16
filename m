From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the devicetree tree with the
	microblaze tree
Date: Tue, 16 Feb 2010 14:38:04 -0700
Message-ID: <fa686aa41002161338u25e58cc5m74e4b3c6e39b584b@mail.gmail.com>
References: <20100215181335.f53ad8a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f185.google.com ([209.85.223.185]:32924 "EHLO
	mail-iw0-f185.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933090Ab0BPViZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Feb 2010 16:38:25 -0500
In-Reply-To: <20100215181335.f53ad8a0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@petalogix.com>

On Mon, Feb 15, 2010 at 12:13 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
>
> Today's linux-next merge of the devicetree tree got a conflict in
> arch/microblaze/include/asm/prom.h between commit
> 8d0fd5d72f5bcc597427afd73c6d5ba97fe4780f ("microblaze: Enable PCI,
> missing files") from the microblaze tree and commit
> df0edeb59eb559be0bee53452fda2f5cc0ae133f ("of: remove undefined
> request_OF_resource & release_OF_resource") from the devicetree tree.
>
> Just context changes. I fixed it up (see below) and can carry the fix as
> necessary.

Michal, with respect to the current ongoing discussion, I hope you're
not planning on merging the microblaze PCI patches when Linus opens
the merge window.

g.
