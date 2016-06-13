From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: duplicate patches in the kspp and kbuild trees
Date: Mon, 13 Jun 2016 16:53:44 -0700
Message-ID: <CAGXu5jLh7gXMcdU=F0qWc1S61YX-QmfQHpUfb+sxkQLUXu1Hqw@mail.gmail.com>
References: <20160614094019.14fac372@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:36118 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932430AbcFMXxr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Jun 2016 19:53:47 -0400
Received: by mail-wm0-f48.google.com with SMTP id n184so98880265wmn.1
        for <linux-next@vger.kernel.org>; Mon, 13 Jun 2016 16:53:46 -0700 (PDT)
In-Reply-To: <20160614094019.14fac372@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>

On Mon, Jun 13, 2016 at 4:40 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> As of today, there are four duplicate patches (different commits)
> in the kspp and kbuild trees.
>
>   Shared library support
>   GCC plugin infrastructure
>   Add Cyclomatic complexity GCC plugin
>   Add sancov plugin
>
> are in both trees as different commits :-(  They have been in the kbuild
> tree for a couple of days already.  One of you should be merging the
> other's branch, or you both should be mergeing a common branch.
>
> Also, Kees, the versions in your tree do not have your Signed-off-by
> (but do have Michal's).

Strange, I pulled these directly from linux-next. Michal had an
auto-responder saying he was going to be out-of-office, so I wanted to
make sure the !COMPILE_TEST fix got in.

Sounds like I should merge the kbuild tree, rather than cherry-picking
from linux-next? I will adjust.

Sorry for the confusion!

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
