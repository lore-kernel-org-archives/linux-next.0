From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: build failure after merge of the slab tree
Date: Mon, 31 Jan 2011 21:32:19 +0200
Message-ID: <1296502339.30654.13.camel@jaguar>
References: <20110131144246.dfa2abe3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:42161 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753553Ab1AaTcn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Jan 2011 14:32:43 -0500
In-Reply-To: <20110131144246.dfa2abe3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Tso <tytso@MIT.EDU>

On Mon, 2011-01-31 at 14:42 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the slab tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/ext4/mballoc.c: In function 'ext4_exit_mballoc':
> fs/ext4/mballoc.c:2750: error: implicit declaration of function 'kmem_cache_name'
> fs/ext4/mballoc.c:2750: warning: cast to pointer from integer of different size
> 
> Caused by commit 63310467a3d1ed6a0460ec1f4268126cd1ceec2e ("mm: Remove
> support for kmem_cache_name()").  Clearly the last user has not gone, yet.
> 
> I have used the version of the slab tree from next-20110121 for today.

Christoph, Ted? Should I revert the patch from slab.git?
