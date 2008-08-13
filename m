From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Wed, 13 Aug 2008 09:32:05 +0200
Message-ID: <20080813073205.GA398@elte.hu>
References: <20080813152907.b76a06e3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:42003 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751952AbYHMHc1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 03:32:27 -0400
Content-Disposition: inline
In-Reply-To: <20080813152907.b76a06e3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the kmemcheck tree got a conflict in
> mm/slab.c between commit fccd5095804ffc190cb2371c319cb4f5b2c0ee14
> ("kmemtrace: SLAB hooks") from the slab tree and commit
> 30532cb3c49a2a9fed94127aab26003c52398a51 ("slab: add hooks for
> kmemcheck") from the kmemcheck tree.
> 
> Simply overlapping additions of includes.

thanks Stephen! I suspect these resolutions will live in linux-next for 
the next 2 months, as that's the soonest there will be a natural merge 
between slab.git and tip/kmemcheck.

	Ingo
