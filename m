From: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH] KVM: fix compile warning
Date: Tue, 27 Jul 2010 18:40:31 -0300
Message-ID: <20100727214031.GB12889@amt.cnet>
References: <20100726151405.2dfd20ee.sfr@canb.auug.org.au>
 <4C4D216B.5040004@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C4D216B.5040004@cn.fujitsu.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KVM list <kvm@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 26, 2010 at 01:47:23PM +0800, Xiao Guangrong wrote:
> 
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the kvm tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> > 
> > arch/x86/kvm/mmu.c: In function 'kvm_mmu_pte_write':
> > arch/x86/kvm/mmu.c:2908: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~'
> > 
> > Introduced by commit af8720393c71a8f81ade71c404798d80c68c5d73 ("KVM: MMU:
> > add missing reserved bits check in speculative path").
> 
> Hi Stephen,
> 
> Thanks for your report, this patch can fix it.
> 
> Subject: [PATCH] KVM: fix compile warning
> 
> Fix:
> arch/x86/kvm/mmu.c: In function 'kvm_mmu_pte_write':
> arch/x86/kvm/mmu.c:2908: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~'
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>
> ---
>  arch/x86/kvm/mmu.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.
