From: Matt Fleming <matt.fleming@intel.com>
Subject: Re: linux-next: build warning after merge of the ptrace tree
Date: Mon, 29 Aug 2011 21:18:14 +0100
Message-ID: <1314649094.3649.1.camel@mfleming-mobl1.ger.corp.intel.com>
References: <20110829152704.e533760bfb83fc7480333b20@canb.auug.org.au>
	 <20110829182018.GA14729@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110829182018.GA14729@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleg Nesterov <oleg@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 2011-08-29 at 20:20 +0200, Oleg Nesterov wrote:
> Hi Stephen,
> 
> On 08/29, Stephen Rothwell wrote:
> >
> > After merging the ptrace tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> >
> > fs/autofs4/waitq.c: In function 'autofs4_wait':
> > fs/autofs4/waitq.c:462:17: warning: unused variable 'irqflags'
> >
> > Introduced by commit 33ee1d9bc213 ("autofs4: Use set_current_blocked()").
> 
> Argh. Thanks again.
> 
> I've committed the trivial fix.

Thanks Oleg! Sorry about that, my build was pretty loud and I missed
this warning in the noise.
