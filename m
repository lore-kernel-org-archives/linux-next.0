From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: linux-next: manual merge of the m68knommu tree with the m68k
 tree
Date: Wed, 22 Jun 2011 16:34:11 +1000
Message-ID: <4E018CE3.7070101@snapgear.com>
References: <20110622111256.3857df1e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:30496 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753372Ab1FVGhU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Jun 2011 02:37:20 -0400
In-Reply-To: <20110622111256.3857df1e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Stephen,

On 22/06/11 11:12, Stephen Rothwell wrote:
> Today's linux-next merge of the m68knommu tree got a conflict in
> arch/m68k/include/asm/bitops_mm.h between commit 17c74432b88e
> ("m68k/bitops: Make bitmap data pointer of atomic ops volatile") from the
> m68k tree and commit 2cb0d89e66b1 ("m68k: merge mmu and non-mmu
> bitops.h") from the m68knommu tree.
>
> The latter effectively deletes in the file and in doing the merge,
> removes the funtions that were modified by the former commit.  So I just
> removed the file.

That would be right. The changes that Geert's patch makes are in
my merge patch.

Geert: do you want me to hold of on merging the bitops.h files?

Regards
Greg


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
