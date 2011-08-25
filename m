From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the moduleh tree with the arm tree
Date: Thu, 25 Aug 2011 12:33:51 -0400
Message-ID: <4E56796F.8090703@windriver.com>
References: <20110825151748.8e41e0ded739187a1432cf0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110825151748.8e41e0ded739187a1432cf0b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Medhurst <tixy@yxit.co.uk>, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On 11-08-25 01:17 AM, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the moduleh tree got a conflict in
> arch/arm/mach-bcmring/mm.c between commit 2d5e975b2194 ("ARM:
> mach-bcmring: Setup consistent dma size at boot time") from the arm tree
> and commit 9bc7d81e271e ("arm: fix implicit use of page.h in
> mach-bcmring/mach-jornada") from the moduleh tree.

I can't really relocate the page.h inclusion in a trivial way to
make this conflict go away.  But since the implicit header use fixes
for arm are independent and don't actually depend on anything in the
rest of the module.h tree, I can set about to giving these to Russell
for his arm-next branch anytime.  I'll do that shortly.

Thanks,
Paul.

> 
> Jst context changes I fixed it up (see below) and can carry the fix as
> necessary.
