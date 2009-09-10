From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: linux-next: m86k/m68knommu tree build failure
Date: Thu, 10 Sep 2009 15:37:57 +1000
Message-ID: <4AA890B5.8000207@snapgear.com>
References: <20090910151137.fb71c103.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754300AbZIJFia@vger.kernel.org>
In-Reply-To: <20090910151137.fb71c103.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Stephen Rothwell wrote:
> Today's linux-next build (m68k defconfig) failed like this:
> 
> kernel/built-in.o: In function `ptrace_resume':
> ptrace.c:(.text+0xc5d6): undefined reference to `user_disable_single_step'
> ptrace.c:(.text+0xc5fe): undefined reference to `user_enable_single_step'
> ptrace.c:(.text+0xc620): undefined reference to `user_disable_single_step'
> 
> Caused by commit 5db612ef70d24be12f6dbf5d06b23bcd6bc2fc05 ("m68knommu:
> define arch_has_single_step() and friends").  This commit added
> definitions of these functions for m68knommu, but added declarations (and
> arch_has_single_step()) in a common header file.

Ah, yes, thanks. I'll fix that. I don't regularly build for m68k,
so I missed that in my test builds.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
