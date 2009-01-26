From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the slab tree with the ftace tree
Date: Mon, 26 Jan 2009 10:36:51 +0200
Message-ID: <1232959011.21504.0.camel@penberg-laptop>
References: <20090126153131.8a6dcf9a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:50005 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750861AbZAZIgy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Jan 2009 03:36:54 -0500
In-Reply-To: <20090126153131.8a6dcf9a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Stephen,

On Mon, 2009-01-26 at 15:31 +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the slab tree got conflicts in
> include/linux/slub_def.h and mm/slub.c between commit
> 5b882be4e00e53a44f47ad7eb997cac2938848bf ("kmemtrace: SLUB hooks") from
> the ftrace tree and commit 97a4871761e735b6f1acd3bc7c3bac30dae3eab9
> ("SLUB: revert direct page allocator pass through") from the slab tree.
> 
> I fixed them up (see below, worth a check) and can carry the fix as
> necessary.

Yup, looks good to me. The kmalloc_large() function is dropped by the
page allocator pass-through revert in linux-next. Thanks!

		Pekka
