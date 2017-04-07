From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm tree with the arm64 tree
Date: Fri, 7 Apr 2017 19:25:54 +1000
Message-ID: <20170407192554.5841e181@canb.auug.org.au>
References: <20170407174120.0b0baadf@canb.auug.org.au>
        <20170407084835.GA18291@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170407084835.GA18291@e104818-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>, Laura Abbott <labbott@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Catalin,

On Fri, 7 Apr 2017 09:48:35 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> Thanks for fixing this up. Not ideal, indeed, but I can push a clean-up
> patch after -rc1 to move set_memory_valid() to an arm64-specific
> set_memory.h (which would include asm-generic/set_memory.h). Given that
> my for-next branch is based on 4.11-rc3, I can't do this now without
> risking breaking other things.

Actually, I suspect that the patch in Andrew's series will be updated
to do that.  This part of Andrew's patch series is applied on top of
all the other linux-next trees and is sent to Linus fairly late in the
merge window.
-- 
Cheers,
Stephen Rothwell
