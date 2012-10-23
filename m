From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 22 Oct 2012 21:21:45 -0700
Message-ID: <1350966105.7502.25.camel@joe-AO722>
References: <20121023144221.5ae3061a11766df8175b959d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121023144221.5ae3061a11766df8175b959d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay@vrfy.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2012-10-23 at 14:42 +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> kernel/printk/printk_syslog.c: In function 'printk_syslog_print':
> kernel/printk/printk_syslog.c:108:3: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
> kernel/printk/printk_syslog.c: In function 'do_syslog':
> kernel/printk/printk_syslog.c:245:3: error: implicit declaration of function 'access_ok' [-Werror=implicit-function-declaration]
> kernel/printk/printk_syslog.c:245:18: error: 'VERIFY_WRITE' undeclared (first use in this function)
> kernel/printk/printk_syslog.c:245:18: note: each undeclared identifier is reported only once for each function it appears in
> 
> Caused by commit 598815e5f25f ("printk: add printk_syslog.c and .h").
> 
> Presumably missing an (or some) include files - see Rule 1 in
> Documentation/SubmitChecklist.

Yup, missing at least <linux/uaccess.h> which x86 gets
via an arch specific include.

I compiled it only x86.

I'll resubmit that one.
