From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: duplicate patches in the kspp and kbuild trees
Date: Tue, 14 Jun 2016 14:32:03 +1000
Message-ID: <20160614143203.220d0722@canb.auug.org.au>
References: <20160614094019.14fac372@canb.auug.org.au>
	<CAGXu5jLh7gXMcdU=F0qWc1S61YX-QmfQHpUfb+sxkQLUXu1Hqw@mail.gmail.com>
	<CAGXu5jJK25pMi1kG2vUfWkZkDBxCVeLUVs61a=m8qmHDTjPg9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46089 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750805AbcFNEcF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Jun 2016 00:32:05 -0400
In-Reply-To: <CAGXu5jJK25pMi1kG2vUfWkZkDBxCVeLUVs61a=m8qmHDTjPg9g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: Michal Marek <mmarek@suse.cz>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>

Hi Kees,

On Mon, 13 Jun 2016 16:57:15 -0700 Kees Cook <keescook@google.com> wrote:
>
> On Mon, Jun 13, 2016 at 4:53 PM, Kees Cook <keescook@google.com> wrote:
> >
> > Strange, I pulled these directly from linux-next. Michal had an
> > auto-responder saying he was going to be out-of-office, so I wanted to
> > make sure the !COMPILE_TEST fix got in.
> >
> > Sounds like I should merge the kbuild tree, rather than cherry-picking
> > from linux-next? I will adjust.  

Cherry-picking produces new commits (with new SHA1s etc), while merging
(or rebasing on top of the other versions) will have the same commits
(not just patches).

Having the same commits means that they never produce conflicts after
further changes to the same files (unless both sides of the merge make
further changes to the same files).

> I've done this merge correctly now and pushed a forced update on the kspp tree.

Thanks for that.  Now you just have to hope that Michal never rebases
that part of his tree from under you.  (Michal: hint! :-))

-- 
Cheers,
Stephen Rothwell
