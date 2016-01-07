From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
Date: Fri, 8 Jan 2016 07:03:30 +1100
Message-ID: <20160108070330.0a2fcb89@canb.auug.org.au>
References: <20151218163351.5bfd2def@canb.auug.org.au>
	<20160107201503.6d5ec159@canb.auug.org.au>
	<87ziwhpazc.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33174 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750768AbcAGUDc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jan 2016 15:03:32 -0500
In-Reply-To: <87ziwhpazc.fsf@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Aneesh,

On Thu, 07 Jan 2016 22:45:19 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > This merge fix up patch now looks like this:  
> 
> 
> What about the #define pfn_pte part ? We don't need that now ?

That is done as part of the merge conflict resolution.  This is an
extra needed merge resolution patch due to code being moved between
files.  You can see the entire merge resolution using

  git diff-tree --cc 5a028bd9b7de

in next-20160107.

The #defines are there in

  arch/powerpc/include/asm/book3s/32/pgtable.h
  arch/powerpc/include/asm/book3s/64/hash.h
  arch/powerpc/include/asm/nohash/pgtable.h

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
