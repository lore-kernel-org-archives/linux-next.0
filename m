From: Yu Zhang <yu.c.zhang@linux.intel.com>
Subject: Re: linux-next: Fixes tag needs some work in the kvm tree
Date: Wed, 20 Feb 2019 15:02:33 +0800
Message-ID: <20190220070233.lca2kquyzypofyh7@linux.intel.com>
References: <20190216183433.71b7cfa7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190216183433.71b7cfa7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Christopherson <sean.j.christopherson@intel.com>
List-Id: linux-next.vger.kernel.org

Thanks for the notification, Stephen.
@Paolo, should I resubmit the patch to correct?

On Sat, Feb 16, 2019 at 06:34:33PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   aa8359972cfc ("KVM: x86/mmu: Differentiate between nr zapped and list unstable")
> 
> Fixes tag
> 
>   Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing quotes
>     Please do not split Fixes tags over more than one line
> 
> In commit
> 
>   4d3f8e4ff75e ("kvm: vmx: Fix typos in vmentry/vmexit control setting")
> 
> Fixes tag
> 
>   Fixes: 'commit f99e3daf94ff ("KVM: x86: Add Intel PT virtualization work mode")'
> 
> has these problem(s):
> 
>   - No SHA1 recognised
>     The leading word 'commit' is unexpected and the surrounding single
>     quotes likewise.
>     Please just use
> 	git log -1 --format='Fixes: %h ("%s")' <SHA>
> 
> -- 
> Cheers,
> Stephen Rothwell

B.R.
Yu
