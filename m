From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the vfs tree with the powerpc tree
Date: Wed, 01 May 2013 10:31:33 +0530
Message-ID: <5180A1AD.4060409@linux.vnet.ibm.com>
References: <20130501120636.0e54681b2dfb7ebe6aeb27c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp08.in.ibm.com ([122.248.162.8]:37598 "EHLO
	e28smtp08.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751157Ab3EAFCF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 May 2013 01:02:05 -0400
Received: from /spool/local
	by e28smtp08.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Wed, 1 May 2013 10:25:42 +0530
In-Reply-To: <20130501120636.0e54681b2dfb7ebe6aeb27c4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org

On 05/01/2013 07:36 AM, Stephen Rothwell wrote:
> Hi Al,
>
> Today's linux-next merge of the vfs tree got a conflict in
> arch/powerpc/kernel/rtas_flash.c between commit fb4696c39573
> ("powerpc/rtas_flash: Fix bad memory access") from the powerpc tree and
> commits ad18a364f186 ("powerpc/rtas_flash: Free kmem upon module exit")
> and 2352ad01409d ("ppc: Clean up rtas_flash driver somewhat") from the
> vfs tree.
>

Stephen,

As Ben mentioned earlier, there are outstanding comments from me which
needs to be addressed by Dave, before its merged.


-Vasant

> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
