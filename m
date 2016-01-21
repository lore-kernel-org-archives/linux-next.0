From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 21 Jan 2016 11:17:05 +0530
Message-ID: <20160121054705.GA5350@sudip-pc>
References: <20160121161156.69051295@canb.auug.org.au>
 <20160121051709.GA4749@sudip-pc>
 <20160121162545.367f8ec2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160121162545.367f8ec2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Jan 21, 2016 at 04:25:45PM +1100, Stephen Rothwell wrote:
> Hi Sudip,
> 
> On Thu, 21 Jan 2016 10:47:09 +0530 Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
> >
> > On Thu, Jan 21, 2016 at 04:11:56PM +1100, Stephen Rothwell wrote:
> > > Hi Andrew,
> > > 
> > > After merging the akpm-current tree, today's linux-next build (arm
> > > efm32_defconfig) failed like this:
> > > 
> > > fs/proc/task_nommu.c:132:28: error: 'mm' undeclared (first use in this function)
> > > 
> > > Caused by commit
> > > 
> > >   e87d4fd02f40 ("proc: revert /proc/<pid>/maps [stack:TID] annotation")  
> > 
> > posted a patch for it few minutes ago.
> > https://patchwork.kernel.org/patch/8077421/
> 
> Thanks, I have added that to the akpm-current tree for tomorrow in case
> Andrew does not get around to it.

Adding that will uncover one more build failure, and the patch for that
is at:
https://patchwork.kernel.org/patch/8077891/

regards
sudip
