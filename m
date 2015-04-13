From: Borislav Petkov <bp@suse.de>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Mon, 13 Apr 2015 13:06:20 +0200
Message-ID: <20150413110620.GD22325@pd.tnic>
References: <20150413203917.1e7ea535@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59991 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751349AbbDMLIj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 07:08:39 -0400
Content-Disposition: inline
In-Reply-To: <20150413203917.1e7ea535@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@kernel.org>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 13, 2015 at 08:39:17PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (powerpc allnoconfig)
> failed like this:
> 
> init/main.c: In function 'rest_init':
> init/main.c:387:2: error: implicit declaration of function 'smpboot_thread_init' [-Werror=implicit-function-declaration]
>   smpboot_thread_init();
>   ^
> 
> Caused by commit c55f6e1f6f69 ("cpu: Defer smpboot kthread unparking
> until CPU known to scheduler").  The declaration in include/linux/cpu.h
> is protected by CONFIG_SMP, its use is not.
> 
> I have reverted that commit for today.

Thanks for the report Stephen, I know today is the day of b0rked
linux-next builds :-(

I think Ingo merged Paul's patch already so here's a fix ontop:

---
From: Borislav Petkov <bp@suse.de>
Date: Mon, 13 Apr 2015 13:01:32 +0200
Subject: [PATCH] smpboot: Fix CONFIG_SMP=n build

Stephen Rothwell reported a CONFIG_SMP=n breakage with latest rcu/next.
The timing of this is very unfortunate as we've been hunting this bug
hastily over the weekend, just to be in time for the merge window.

So here's a fix ontop.

Signed-off-by: Borislav Petkov <bp@suse.de>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: <x86@kernel.org>
Link: http://lkml.kernel.org/r/20150413203917.1e7ea535@canb.auug.org.au
---
 include/linux/cpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 091badf0f6ba..bbdee1e6cf48 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -198,6 +198,10 @@ static inline void __unregister_cpu_notifier(struct notifier_block *nb)
 {
 }
 
+static inline void smpboot_thread_init(void)
+{
+}
+
 static inline void cpu_maps_update_begin(void)
 {
 }
-- 
2.3.5

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
