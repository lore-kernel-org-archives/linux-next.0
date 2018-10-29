From: Hangbin Liu <liuhangbin@gmail.com>
Subject: Re: linux-next: build failure in Linus' tree
Date: Mon, 29 Oct 2018 09:38:50 +0800
Message-ID: <20181029013850.GL24677@leo.usersys.redhat.com>
References: <20181029093532.38a3888e@canb.auug.org.au>
 <CAHk-=wi475eRvUDctiWdBWsEB7UYgr8OrpPzrd=xkevUpTSCuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHk-=wi475eRvUDctiWdBWsEB7UYgr8OrpPzrd=xkevUpTSCuA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
List-Id: linux-next.vger.kernel.org

On Sun, Oct 28, 2018 at 03:45:16PM -0700, Linus Torvalds wrote:
> On Sun, Oct 28, 2018 at 3:35 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the origin tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> 
> linux-next is back! Wheee..
> 
> >   5a2de63fd1a5 ("bridge: do not add port to router list when receives query with source 0.0.0.0")
> 
> David?
> 
>                  Linus

Sorry, I forgot to check if IPv6 is configured. Nikolay has helped post
a fix for this issue.

Regards
Hangbin
