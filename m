From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: linux-next: error when fetching the bcm2835 tree
Date: Tue, 4 Sep 2018 22:07:15 +0200 (CEST)
Message-ID: <1892655944.623.1536091635278@email.1und1.de>
References: <20180828074200.440fb5ca@canb.auug.org.au>
 <87wos1gny5.fsf@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87wos1gny5.fsf@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Eric Anholt <eric@anholt.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

> Eric Anholt <eric@anholt.net> hat am 4. September 2018 um 19:41 geschrieben:
> 
> 
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > [ Unknown signature status ]
> > Hi Eric,
> >
> > Fetching the bcm2835 tree (git://github.com/anholt/linux.git#for-next)
> > produces this error:
> >
> > fatal: Couldn't find remote ref refs/heads/for-next
> 
> I'd passed responsibility for the git tree off to Stefan while I'm
> mostly-unavailable due to new baby.  Maybe Stefan had deleted the branch
> for a bit?

sorry for that. I deleted the branch and i manually setup the new one later.

I hope, everything is fine now?

> 
> Stefan -- the for-next branch is what linux-next pulls in, and I was
> regenerating it whenever I pushed -next branches.  You can find one set
> of scripts for helping generate a for-next branch at
> git://git.kernel.org/pub/scm/linux/kernel/git/tegra/maint-scripts.git

Cool

Stefan
