From: Mulyadi Santosa <mulyadi.santosa@gmail.com>
Subject: Re: linux-next: manual merge of the trivial tree with Linus' tree
Date: Mon, 8 Mar 2010 09:41:53 +0700
Message-ID: <f284c33d1003071841n617191e6vade447b3413ee9f9@mail.gmail.com>
References: <20100308132043.f6dcc0cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:35870 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753337Ab0CHCmO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 7 Mar 2010 21:42:14 -0500
In-Reply-To: <20100308132043.f6dcc0cd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Andrew Morton <akpm@linux-foundation.org>

On Mon, Mar 8, 2010 at 9:20 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Jiri,
>
> Today's linux-next merge of the trivial tree got a conflict in
> Documentation/filesystems/proc.txt between commit
> 34e55232e59f7b19050267a05ff1226e5cd122a5 ("mm: avoid false sharing of
> mm_counter") from Linus' tree and commit
> cb2992a60b7e73fbabe9ffe54056eed0022f2ed2 ("doc: typo - Table 1-2 should
> refer to "status", not "statm"") from the trivial tree.

Thanks for the notification and the fix. I am glad my trivial patch is
considered into the  next level of code merge....

-- 
regards,

Mulyadi Santosa
Freelance Linux trainer and consultant

blog: the-hydra.blogspot.com
training: mulyaditraining.blogspot.com
