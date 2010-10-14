From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for October 13
Date: Wed, 13 Oct 2010 17:38:26 -0700
Message-ID: <20101013173826.f4b911b4.akpm@linux-foundation.org>
References: <20101013154522.7b087a20.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101013154522.7b087a20.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Feng Tang <feng.tang@intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, 13 Oct 2010 15:45:22 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

In an i386 allmodconfig build, compilation of
arch/x86/kernel/early_printk_mrst.c is emitting a call to
__this_fixmap_does_not_exist().  
