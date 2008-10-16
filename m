From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] mfd/wm8350: don't export static functions
Date: Thu, 16 Oct 2008 13:04:16 +0100
Message-ID: <20081016120416.GA5753@rakim.wolfsonmicro.main>
References: <20081016204754.a41646e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756375AbYJPME3@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081016204754.a41646e5.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, ppc-dev <linuxppc-dev@ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 16, 2008 at 08:47:54PM +1100, Stephen Rothwell wrote:
> Today's linux-next build (powerpc allyesconfig) failed like this:

> drivers/mfd/wm8350-core.c:1131: error: __ksymtab_wm8350_create_cache causes a section type conflict

> Caused by commit 89b4012befb1abca5e86d232bc0e2a797b0d9825 ("mfd: Core
> support for the WM8350 AudioPlus PMIC"). wm8350_create_cache is not used
> elsewhere, so remove the EXPORT_SYMBOL.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
