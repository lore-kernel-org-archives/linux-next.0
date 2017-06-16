From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Date: Fri, 16 Jun 2017 13:25:03 +1000
Message-ID: <20170616132503.776d6d51@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39845 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750792AbdFPDZF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jun 2017 23:25:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shiju Jose <shiju.jose@huawei.com>, James Morse <james.morse@arm.com>, Borislav Petkov <bp@suse.de>, Tyler Baicar <tbaicar@codeaurora.org>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/acpi/apei/ghes.c

between commit:

  d0189b2eef2e ("acpi: apei: handle SEA notification type for ARMv8")

from the arm64 tree and commit:

  7bf130e4a065 ("ACPI/APEI: Handle GSIV and GPIO notification types")

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

diff --cc drivers/acpi/apei/ghes.c
index dfdb33f09f0a,d2c8a9286fa8..000000000000
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@@ -810,59 -718,10 +810,59 @@@ static int ghes_notify_hed(struct notif
  	return ret;
  }
  
- static struct notifier_block ghes_notifier_sci = {
- 	.notifier_call = ghes_notify_sci,
+ static struct notifier_block ghes_notifier_hed = {
+ 	.notifier_call = ghes_notify_hed,
  };
  
 +#ifdef CONFIG_ACPI_APEI_SEA
 +static LIST_HEAD(ghes_sea);
 +
 +/*
 + * Return 0 only if one of the SEA error sources successfully reported an error
 + * record sent from the firmware.
 + */
 +int ghes_notify_sea(void)
 +{
 +	struct ghes *ghes;
 +	int ret = -ENOENT;
 +
 +	rcu_read_lock();
 +	list_for_each_entry_rcu(ghes, &ghes_sea, list) {
 +		if (!ghes_proc(ghes))
 +			ret = 0;
 +	}
 +	rcu_read_unlock();
 +	return ret;
 +}
 +
 +static void ghes_sea_add(struct ghes *ghes)
 +{
 +	mutex_lock(&ghes_list_mutex);
 +	list_add_rcu(&ghes->list, &ghes_sea);
 +	mutex_unlock(&ghes_list_mutex);
 +}
 +
 +static void ghes_sea_remove(struct ghes *ghes)
 +{
 +	mutex_lock(&ghes_list_mutex);
 +	list_del_rcu(&ghes->list);
 +	mutex_unlock(&ghes_list_mutex);
 +	synchronize_rcu();
 +}
 +#else /* CONFIG_ACPI_APEI_SEA */
 +static inline void ghes_sea_add(struct ghes *ghes)
 +{
 +	pr_err(GHES_PFX "ID: %d, trying to add SEA notification which is not supported\n",
 +	       ghes->generic->header.source_id);
 +}
 +
 +static inline void ghes_sea_remove(struct ghes *ghes)
 +{
 +	pr_err(GHES_PFX "ID: %d, trying to remove SEA notification which is not supported\n",
 +	       ghes->generic->header.source_id);
 +}
 +#endif /* CONFIG_ACPI_APEI_SEA */
 +
  #ifdef CONFIG_HAVE_ACPI_APEI_NMI
  /*
   * printk is not safe in NMI context.  So in NMI handler, we allocate
@@@ -1096,15 -966,10 +1096,18 @@@ static int ghes_probe(struct platform_d
  	case ACPI_HEST_NOTIFY_POLLED:
  	case ACPI_HEST_NOTIFY_EXTERNAL:
  	case ACPI_HEST_NOTIFY_SCI:
+ 	case ACPI_HEST_NOTIFY_GSIV:
+ 	case ACPI_HEST_NOTIFY_GPIO:
  		break;
 +	case ACPI_HEST_NOTIFY_SEA:
 +		if (!IS_ENABLED(CONFIG_ACPI_APEI_SEA)) {
 +			pr_warn(GHES_PFX "Generic hardware error source: %d notified via SEA is not supported\n",
 +				generic->header.source_id);
 +			rc = -ENOTSUPP;
 +			goto err;
 +		}
 +		break;
+ 
  	case ACPI_HEST_NOTIFY_NMI:
  		if (!IS_ENABLED(CONFIG_HAVE_ACPI_APEI_NMI)) {
  			pr_warn(GHES_PFX "Generic hardware error source: %d notified via NMI interrupt is not supported!\n",
@@@ -1162,16 -1027,17 +1165,20 @@@
  			goto err_edac_unreg;
  		}
  		break;
+ 
  	case ACPI_HEST_NOTIFY_SCI:
+ 	case ACPI_HEST_NOTIFY_GSIV:
+ 	case ACPI_HEST_NOTIFY_GPIO:
  		mutex_lock(&ghes_list_mutex);
- 		if (list_empty(&ghes_sci))
- 			register_acpi_hed_notifier(&ghes_notifier_sci);
- 		list_add_rcu(&ghes->list, &ghes_sci);
+ 		if (list_empty(&ghes_hed))
+ 			register_acpi_hed_notifier(&ghes_notifier_hed);
+ 		list_add_rcu(&ghes->list, &ghes_hed);
  		mutex_unlock(&ghes_list_mutex);
  		break;
 +	case ACPI_HEST_NOTIFY_SEA:
 +		ghes_sea_add(ghes);
 +		break;
+ 
  	case ACPI_HEST_NOTIFY_NMI:
  		ghes_nmi_add(ghes);
  		break;
@@@ -1218,9 -1084,7 +1228,10 @@@ static int ghes_remove(struct platform_
  		mutex_unlock(&ghes_list_mutex);
  		synchronize_rcu();
  		break;
 +	case ACPI_HEST_NOTIFY_SEA:
 +		ghes_sea_remove(ghes);
 +		break;
+ 
  	case ACPI_HEST_NOTIFY_NMI:
  		ghes_nmi_remove(ghes);
  		break;
