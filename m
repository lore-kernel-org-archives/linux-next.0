From: Baoquan He <bhe@redhat.com>
Subject: Re: linux-next: manual merge of the tip tree with the iommu tree
Date: Tue, 22 Aug 2017 16:11:54 +0800
Message-ID: <20170822081154.GD12401@x1>
References: <20170822135057.776f3509@canb.auug.org.au>
 <20170822055758.GB12401@x1>
 <20170822174951.52dab2d1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170822174951.52dab2d1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 08/22/17 at 05:49pm, Stephen Rothwell wrote:
> Hi Baoquan,
> 
> On Tue, 22 Aug 2017 13:57:58 +0800 Baoquan He <bhe@redhat.com> wrote:
> >
> > On 08/22/17 at 01:50pm, Stephen Rothwell wrote:
> > > from the iommu tree and commit:
> > > 
> > >   2543a786aa25 ("iommu/amd: Allow the AMD IOMMU to work with memory encryption")  
> > 
> > Could you tell where the above commit is put? I can have a look.
> > 
> > > from the tip tree.
>     ^^^^^^^^^^^^^^^^^
> 
> The tip tree is
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
> 	branch auto-latest

Thanks a lot!

I have commit 2543a786aa25, not sure which branch it's put in. I tried
to apply it to the current tip/auto-latest, and saw the conflicts. I
think your change is correct. Maybe Joerg can also help have a look.

Thanks
Baoquan
