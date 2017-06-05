From: Daniel Micay <danielmicay@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 05 Jun 2017 09:34:31 -0400
Message-ID: <1496669671.343.5.camel@gmail.com>
References: <20170605170117.6a1fc15e@canb.auug.org.au>
         <1496667976.343.3.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496667976.343.3.camel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

> It also probably finds more architecture-specific issues and may need
> compatibility fixes for them. I could mark it as compatible with only
> arm64 and x86(_64) since they're what I've tested to build and work at
> runtime and the compile-time errors could be turned into warnings for
> now, if it's mandatory that FORTIFY_SOURCE=y doesn't find problems at
> compile-time anywhere. If it's a warning, it will still catch the
> issue
> at runtime like the rest where the size isn't a constant.

I'm already leaving out intra-object overflow checks and the alloc_size
attributes in this initial submission to make it easier to land so
scaling it back a bit more (errors -> warnings, gating on archs) isn't a
problem if it's needed to get started.
