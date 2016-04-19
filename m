From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pm tree
Date: Tue, 19 Apr 2016 12:59:38 +1000
Message-ID: <20160419125938.4e482ad3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/cpufreq/longhaul.c

between commit:

  b49c22a6ca36 ("cpufreq: Convert printk(KERN_<LEVEL> to pr_<level>")

from the pm tree and commit:

  93984fbd4e33 ("x86/cpufeature: Replace cpu_has_apic with boot_cpu_has() usage")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/cpufreq/longhaul.c
index beae5cf5c62c,247bfa8eaddb..000000000000
--- a/drivers/cpufreq/longhaul.c
+++ b/drivers/cpufreq/longhaul.c
@@@ -932,8 -945,9 +932,8 @@@ static int __init longhaul_init(void
  	}
  #endif
  #ifdef CONFIG_X86_IO_APIC
- 	if (cpu_has_apic) {
+ 	if (boot_cpu_has(X86_FEATURE_APIC)) {
 -		printk(KERN_ERR PFX "APIC detected. Longhaul is currently "
 -				"broken in this configuration.\n");
 +		pr_err("APIC detected. Longhaul is currently broken in this configuration.\n");
  		return -ENODEV;
  	}
  #endif
