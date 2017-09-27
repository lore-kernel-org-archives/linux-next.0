From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Wed, 27 Sep 2017 13:42:56 +1000
Message-ID: <20170927134256.3e8d3b9c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prarit Bhargava <prarit@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
produced this warning:

kernel/printk/printk.c:1983:12: warning: 'printk_time' defined but not used [-Wunused-variable]
 static int printk_time;
            ^

Introduced by commit

  310b454a8653 ("printk: Add monotonic, boottime, and realtime timestamps")

-- 
Cheers,
Stephen Rothwell
