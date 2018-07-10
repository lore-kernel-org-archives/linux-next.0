From: Petr Mladek <pmladek@suse.com>
Subject: Re: linux-next: build warning after merge of the printk tree
Date: Tue, 10 Jul 2018 11:19:09 +0200
Message-ID: <20180710091909.rwgtahcew6grhd6n@pathway.suse.cz>
References: <20180710164514.22c552db@canb.auug.org.au>
 <CGME20180710064527epcas1p16fd9ad765711d69264b3251890bbcc2e@epcms5p5>
 <2014348883.271177.1531206974788.JavaMail.jboss@ep1ml503>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2014348883.271177.1531206974788.JavaMail.jboss@ep1ml503>
Sender: linux-kernel-owner@vger.kernel.org
To: Maninder Singh <maninder1.s@samsung.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vaneet Narang <v.narang@samsung.com>, PANKAJ MISHRA <pankaj.m@samsung.com>
List-Id: linux-next.vger.kernel.org

On Tue 2018-07-10 12:46:14, Maninder Singh wrote:
> Hi Petr,
>  
> > Hi all,
>  
> > After merging the printk tree, today's linux-next build (x86_64
> > allnoconfig) produced this warning:
>  
> > kernel/printk/printk.c:2033:13: warning: 'suppress_message_printing' defined but not used [-Wunused-function]
> > static bool suppress_message_printing(int level) { return false; }
>              ^~~~~~~~~~~~~~~~~~~~~~~~~
>  
> seems there is no user for suppress_message_printing when CONFIG_PRINTK is disabled,
> because earlier it was getting used in console_unlock and now we shifted this into vprintk_emit
> which will be disabled on disabling CONFIG_PRINTk.
> 
> should we remove this defination when CONFIG_PRINTK is disabled ?
> 
> > Introduced by commit
> >  375899cddcbb ("printk: make sure to print log on console.")

Grr, I wonder how I missed it. I usually try build with CONFIG_PRINTK
disabled.

Anyway, I have just pushed the following patch into printk.git,
branch for-4.19:


>From 7b83946e61a1e4a080d48c24396aeb18b6366203 Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Tue, 10 Jul 2018 10:44:53 +0200
Subject: [PATCH] printk: Fix warning about unused suppress_message_printing
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

suppress_message_printing() is not longer called in console_unlock().
Therefore it is not longer needed with disabled CONFIG_PRINTK.

This fixes the warning:

kernel/printk/printk.c:2033:13: warning: ‘suppress_message_printing’ defined but not used [-Wunused-function]
 static bool suppress_message_printing(int level) { return false; }

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Suggested-by: Maninder Singh <maninder1.s@samsung.com>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index fcc1992c040a..e2cb0fc18e2d 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2021,7 +2021,6 @@ static void call_console_drivers(const char *ext_text, size_t ext_len,
 				 const char *text, size_t len) {}
 static size_t msg_print_text(const struct printk_log *msg,
 			     bool syslog, char *buf, size_t size) { return 0; }
-static bool suppress_message_printing(int level) { return false; }
 
 #endif /* CONFIG_PRINTK */
 
-- 
2.13.7
