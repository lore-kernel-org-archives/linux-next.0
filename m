From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Wed, 13 Aug 2008 14:37:13 +0300
Message-ID: <1218627433.7813.320.camel@penberg-laptop>
References: <20080813152907.b76a06e3.sfr@canb.auug.org.au>
	 <20080813073205.GA398@elte.hu> <48A28DD9.7010108@cs.helsinki.fi>
	 <20080813075808.GA11645@elte.hu> <1218615288.7813.310.camel@penberg-laptop>
	 <20080813085800.GF23417@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:40456 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750980AbYHMLhK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Aug 2008 07:37:10 -0400
In-Reply-To: <20080813085800.GF23417@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vegard Nossum <vegard.nossum@gmail.com>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>

Hi Ingo,

On Wed, 2008-08-13 at 10:58 +0200, Ingo Molnar wrote:
> what's your current workflow, what causes the sha1's for commits to 
> change frequently? Do you work with patches (i.e. it's not really a Git 
> workflow at all and you regenerate the git tree all the time you export 
> it from your patch queue), or do you perhaps git-rebase often to clean 
> up patches?

No, I don't work with patches. A lot of the churn comes from the fact
that I have been dropping and re-applying SLUB defrag patches from
Christoph lately. I keep them in a topic branch and pull them for my
'for-next' branch that appears in linux-next.

The basic workflow for me is as follows:

  - Whenever someone sends me a patch, I apply it to my 'testing' 
    branch, do a little bit testing there and if everything seems fine,
    I pull the branch to my 'for-next' branch.

  - After few days, I pull (or cherry pick) the patches to 'for-linus' 
    branch and ask Linus to pull. Whenever he pulls, I usually rebase 
    all of my branches to Linus' master.

  - For development, I maintain topic branches that are _not_ 
    append-only (such as SLUB defrag and kmemtrace). Whenever something 
    changes there I do a git-reset --hard on 'for-next' and re-pull the 
    topic branches there.

  - Also, I usually rebase my whole tree after an -rc release or two 
    just to keep my tree in-sync with mainline. That usually doesn't 
    affect my patches at all.

So AFAICT most of the changes to SHA1s are due to me doing development
in the topic branches and recreating the 'for-next' branch.

		Pekka
