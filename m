From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Mon, 22 Feb 2016 09:26:29 +0000
Message-ID: <20160222092629.GB24203@e104818-lin.cambridge.arm.com>
References: <20160222133322.04517906@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160222133322.04517906@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 22, 2016 at 01:33:22PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the kvm-arm tree got a conflict in:
> 
>   arch/arm64/kvm/hyp.S
> 
> between commit:
> 
>   a0bf9776cd0b ("arm64: kvm: deal with kernel symbols outside of linear mapping")
> 
> from the arm64 tree and commit:
> 
>   253dcab4c363 ("arm64: KVM: VHE: Patch out use of HVC")
> 
> from the kvm-arm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

This looks correct as well. Thanks.

-- 
Catalin
