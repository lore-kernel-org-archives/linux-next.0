From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Wed, 13 Aug 2008 10:58:00 +0200
Message-ID: <20080813085800.GF23417@elte.hu>
References: <20080813152907.b76a06e3.sfr@canb.auug.org.au> <20080813073205.GA398@elte.hu> <48A28DD9.7010108@cs.helsinki.fi> <20080813075808.GA11645@elte.hu> <1218615288.7813.310.camel@penberg-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:47387 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752512AbYHMI6X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 04:58:23 -0400
Content-Disposition: inline
In-Reply-To: <1218615288.7813.310.camel@penberg-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vegard Nossum <vegard.nossum@gmail.com>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>


* Pekka Enberg <penberg@cs.helsinki.fi> wrote:

> Hi Ingo,
> 
> On Wed, 2008-08-13 at 09:58 +0200, Ingo Molnar wrote:
> > (This would be doable and pretty painless as long as slab.git is
> > purely append-only and not rebased.)
> 
> Heh, it's not, as I never quite understood the workflow for that. But 
> that's another discussion, I suppose.

what's your current workflow, what causes the sha1's for commits to 
change frequently? Do you work with patches (i.e. it's not really a Git 
workflow at all and you regenerate the git tree all the time you export 
it from your patch queue), or do you perhaps git-rebase often to clean 
up patches?

	Ingo
