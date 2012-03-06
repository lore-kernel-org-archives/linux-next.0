From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: bad merge in the moduleh tree
Date: Mon, 5 Mar 2012 19:51:32 -0500
Message-ID: <CAP=VYLqJ8ER+tbpVqsvtrUottYP7O+k495Vtjp0Ep2Oa1NsqMw@mail.gmail.com>
References: <20120306105749.4eb0fcccacfe9352e8042f06@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:53653 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932277Ab2CFAvc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Mar 2012 19:51:32 -0500
In-Reply-To: <20120306105749.4eb0fcccacfe9352e8042f06@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 5, 2012 at 6:57 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi Paul,
>
> I noticed this merge in the moduleh tree:
>
> dc69707e944e "Merge branch 'module-3.4' into for-sfr"
>
> This merge result in multplie includes of kernel.h in lib/average.c a=
nd
> lib/list_debug.c.

Is there a better way to present these into linux-next vs. me merging
them into one stream?  I want to keep the module-3.4 content separate
from the bug-3.4 content  (and let Linus do the pull & merge) but at
the same time I want these commit IDs tested in linux-next.  The topics
are most likely one-shot deals, so adding a separate entity into linux-=
next
for each of them doesn't seem to be worthwhile.

Anyway for now, I'll go re-check the merge and make sure it is dup free
for tomorrow.  Thanks for the heads up.

Paul.
--

>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
