From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 26 May 2015 15:16:02 -0700
Message-ID: <20150526151602.38898d76a918321bf1edc3da@linux-foundation.org>
References: <20150525211801.679d9015@canb.auug.org.au>
	<20150525140315.GA26958@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150525140315.GA26958@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrea Arcangeli <aarcange@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 25 May 2015 16:03:15 +0200 Andrea Arcangeli <aarcange@redhat.com> wrote:

> On Mon, May 25, 2015 at 09:18:01PM +1000, Stephen Rothwell wrote:
> > Hi Andrew,
> > 
> > After merging the akpm-current tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > __NR_syscalls (364) is not one more than the last syscall (364)
> > 
> > Caused by commit d7766613717b ("userfaultfd: activate syscall").  (BTW,
> > I notice that this patch was not cc'd to any ppc maintainers :-()
> > 
> > I have added this fix patch for today:
> 
> So another option is to just drop the arch/powerpc part of the patch
> from -mm. It's up to you, there's no arch dependent code in the
> syscall though and the config option is not specific to x86 either. I
> enabled the syscall on powerpc in my tree to facilitate the testing so
> the patchset included that change to arch/powerpc, but it would be ok
> to enable the syscall only later upstream, after it has been tested.

Yes, it would be prudent to avoid enabling it until the feature has
been appropriately runtime tested on powerpc.  How's that
tools/testing/selftests/ test harness coming along ;)
