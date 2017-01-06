From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: old commit in the y2038 tree
Date: Fri, 06 Jan 2017 13:22:25 +0100
Message-ID: <2173477.QlbtKEgGTM@wuerfel>
References: <20161221113652.3586ab19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161221113652.3586ab19@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tina Ruchandani <ruchandani.tina@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wednesday, December 21, 2016 11:36:52 AM CET Stephen Rothwell wrote:
> Hi Arnd,
> 
> The y2038 tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git#y2038)
> is based on v4.6-rc3 and consists of a single commit:
> 
>   549eb7b22e24 ("AFS: Correctly use 64-bit time for UUID")
> 
> that was written in October 2015 and commited in April 2016.  I am just
> wondering if you have plans for that commit and/or that branch?

My plan was to have that picked up with other other patches that
I've reposted it a couple of times from that branch. Everything
else was, and I've dropped it from my branch now.

I still have a number of other patches pending for y2038 that
are not in that branch, and I'll try again when I get around
to sending the next batch.

	Arnd
