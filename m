From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Tue, 11 Dec 2018 10:16:20 +0000
Message-ID: <20181211101619.GA35824@arrakis.emea.arm.com>
References: <20181211085257.6e689038@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181211085257.6e689038@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Will Deacon <will.deacon@arm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 11, 2018 at 08:52:57AM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the arm64 tree got conflicts in:
> 
>   Documentation/arm64/silicon-errata.txt
>   arch/arm64/Kconfig
> 
> between commit:
> 
>   ce8c80c536da ("arm64: Add workaround for Cortex-A76 erratum 1286807")
> 
> from Linus' tree and commit:
> 
>   a457b0f7f50d ("arm64: Add configuration/documentation for Cortex-A76 erratum 1165522")
> 
> from the arm64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

It looks fine. Thanks Stephen.

-- 
Catalin
