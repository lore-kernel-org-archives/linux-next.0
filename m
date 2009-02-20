From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the slab tree with the ftrace tree
Date: Fri, 20 Feb 2009 10:25:22 +0200
Message-ID: <1235118322.29813.24.camel@penberg-laptop>
References: <20090220165728.7f2cec61.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:49608 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753681AbZBTIZY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Feb 2009 03:25:24 -0500
In-Reply-To: <20090220165728.7f2cec61.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Fri, 2009-02-20 at 16:57 +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the slab tree got a conflict in mm/slub.c
> between commit 5b882be4e00e53a44f47ad7eb997cac2938848bf ("kmemtrace: SLUB
> hooks") from the ftrace tree and commit
> 8573e12414365585bfd601dc8c093b3efbef8854 ("SLUB: Do not pass 8k objects
> through to the page allocator") from the slab tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Looks good to me! Thanks once again Stephen!
