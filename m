From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 09:25:36 +0200
Message-ID: <20080606072536.GA19334@elte.hu>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au> <20080605195604.41623687.akpm@linux-foundation.org> <20080606071707.GB9708@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1764199AbYFFH0I@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080606071707.GB9708@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


* Ingo Molnar <mingo@elte.hu> wrote:

> * Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > On Thu, 5 Jun 2008 17:52:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > I have created today's linux-next tree at
> > > git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
> > 
> > Instantly oopses on two x86_64 boxes with this config:
> > http://userweb.kernel.org/~akpm/config-akpm2.txt
> > 
> > oops: http://userweb.kernel.org/~akpm/p6056454.jpg
> >
> > At a guess I'd say the sched_domains code is calling into slab before 
> > slab is initalised.  Something like that.
> 
> did SLUB change in linux-next? There is no such problem in -tip.

i just successfully booted your config on 4 separate 64-bit test-systems 
with latest -tip. (two dual-core boxes, a quad and a 16way box) Latest 
-tip includes sched-next and x86-next as well.

	Ingo
