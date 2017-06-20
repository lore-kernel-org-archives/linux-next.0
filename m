From: "Baicar, Tyler" <tbaicar@codeaurora.org>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Tue, 20 Jun 2017 12:26:01 -0600
Message-ID: <3a8d87ae-93ac-09a1-b653-94862ebdfb39@codeaurora.org>
References: <20170616152136.161630bf@canb.auug.org.au>
 <20170619091942.GA2702@arm.com> <1497866790.22624.164.camel@linux.intel.com>
 <20170619102240.GC2702@arm.com>
 <afe3af71-36d4-df49-07a9-2e3fba3a5c16@codeaurora.org>
 <20170620084007.GA30664@arm.com> <20170620084307.GA9703@lst.de>
 <1497948465.22624.167.camel@linux.intel.com>
 <25d08c14-eea7-8b58-675a-1124200b50a6@codeaurora.org>
 <20170620182034.GF28035@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:58258 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750823AbdFTS0T (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jun 2017 14:26:19 -0400
In-Reply-To: <20170620182034.GF28035@arm.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 6/20/2017 12:20 PM, Will Deacon wrote:
> On Tue, Jun 20, 2017 at 12:13:13PM -0600, Baicar, Tyler wrote:
>> I have sent you the rebased patches. I took Christoph's uuid-types tree and
>> added this patch onto it:
>>
>> 7bf130e4a065 ("ACPI/APEI: Handle GSIV and GPIO notification types")
>>
>> And then added my patches onto that. This will hopefully now avoid conflicts
>> with any other patch.
> No, patch 6 fails to apply:
>
> On Tue, Jun 20, 2017 at 12:07:27PM -0600, Tyler Baicar wrote:
>> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
>> index 7e3ddbe..81ebb9b 100644
>> --- a/drivers/acpi/apei/ghes.c
>> +++ b/drivers/acpi/apei/ghes.c
>> @@ -116,11 +116,7 @@ static inline bool is_hest_type_generic_v2(struct ghes *ghes)
>>    * Two virtual pages are used, one for IRQ/PROCESS context, the other for
>>    * NMI context (optionally).
>>    */
>> -#ifdef CONFIG_HAVE_ACPI_APEI_NMI
>>   #define GHES_IOREMAP_PAGES           2
>> -#else
>> -#define GHES_IOREMAP_PAGES           1
>> -#endif
>>   #define GHES_IOREMAP_IRQ_PAGE(base)	(base)
>>   #define GHES_IOREMAP_NMI_PAGE(base)	((base) + PAGE_SIZE)
>>   
>> @@ -159,10 +155,14 @@ static void ghes_ioremap_exit(void)
>>   static void __iomem *ghes_ioremap_pfn_nmi(u64 pfn)
>>   {
>>   	unsigned long vaddr;
>> +	phys_addr_t paddr;
>> +	pgprot_t prot;
>>   
>>   	vaddr = (unsigned long)GHES_IOREMAP_NMI_PAGE(ghes_ioremap_area->addr);
>> -	ioremap_page_range(vaddr, vaddr + PAGE_SIZE,
>> -			   pfn << PAGE_SHIFT, PAGE_KERNEL);
>> +
>> +	paddr = pfn << PAGE_SHIFT;
>> +	prot = arch_apei_get_mem_attribute(paddr);
>> +	ioremap_page_range(vaddr, vaddr + PAGE_SIZE, paddr, prot);
>>   
>>   	return (void __iomem *)vaddr;
>>   }
>> @@ -774,6 +774,50 @@ static int ghes_notify_hed(struct notifier_block *this, unsigned long event,
>>   	.notifier_call = ghes_notify_hed,
> In Christoph's tree, this line is:
>
> 	.notifier_call = ghes_notify_sci,
>
> http://git.infradead.org/users/hch/uuid.git/blob/refs/heads/uuid-types:/drivers/acpi/apei/ghes.c#l720
>
> so something still isn't right. What did you actually base your patches
> on?
Yes, that line is changed in this patch 7bf130e4a065 ("ACPI/APEI: Handle 
GSIV and GPIO notification types")

It is the other patch that was conflicting with this patch series when 
we tried to marge although it was a trivial conflict. I applied this 
patch to Christoph's tree and then put my patches on top of that.

commit 7bf130e4a0653f6cec83a387de5de0c2c9fa4dba
Author: Shiju Jose <shiju.jose@huawei.com>
Date:   Fri May 19 11:39:11 2017 +0200

     ACPI/APEI: Handle GSIV and GPIO notification types

     System Controller Interrupts are received by ACPI's error device, which
     in turn notifies the GHES code. The same is true of APEI's GSIV and
     GPIO notification types. Add support for GSIV and GPIO sharing the SCI
     register/unregister/notifier code. Rename the list and notifier to show
     this is no longer just SCI, but anything from the Hardware Error 
Device.

     Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
     [ Rewrite commit log. ]
     Signed-off-by: James Morse <james.morse@arm.com>
     [ Some small cleanups ontop. ]
     Signed-off-by: Borislav Petkov <bp@suse.de>
     Tested-by: Tyler Baicar <tbaicar@codeaurora.org>
     Reviewed-by: James Morse <james.morse@arm.com>
     Link: 
http://lkml.kernel.org/r/86258A5CC0A3704780874CF6004BA8A62E695201@FRAEML521-MBX.china.huawei.com
     Cc: "Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>
     Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
     Cc: "Zhengqiang (turing)" <zhengqiang10@huawei.com>
     Cc: "fu.wei@linaro.org" <fu.wei@linaro.org>
     Cc: "xuwei (O)" <xuwei5@hisilicon.com>
     Cc: Gabriele Paoloni <gabriele.paoloni@huawei.com>
     Cc: Geliang Tang <geliangtang@gmail.com>
     Cc: John Garry <john.garry@huawei.com>
     Cc: Len Brown <lenb@kernel.org>
     Cc: Prarit Bhargava <prarit@redhat.com>
     Cc: Punit Agrawal <punit.agrawal@arm.com>
     Cc: linux-acpi@vger.kernel.org
     Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index d0855c0..d2c8a92 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -89,14 +89,14 @@
  module_param_named(disable, ghes_disable, bool, 0);

  /*
- * All error sources notified with SCI shares one notifier function,
- * so they need to be linked and checked one by one.  This is applied
- * to NMI too.
+ * All error sources notified with HED (Hardware Error Device) share a
+ * single notifier callback, so they need to be linked and checked one
+ * by one. This holds true for NMI too.
   *
   * RCU is used for these lists, so ghes_list_mutex is only used for
   * list changing, not for traversing.
   */
-static LIST_HEAD(ghes_sci);
+static LIST_HEAD(ghes_hed);
  static DEFINE_MUTEX(ghes_list_mutex);

  /*
@@ -702,14 +702,14 @@ static irqreturn_t ghes_irq_func(int irq, void *data)
      return IRQ_HANDLED;
  }

-static int ghes_notify_sci(struct notifier_block *this,
-                  unsigned long event, void *data)
+static int ghes_notify_hed(struct notifier_block *this, unsigned long 
event,
+               void *data)
  {
      struct ghes *ghes;
      int ret = NOTIFY_DONE;

      rcu_read_lock();
-    list_for_each_entry_rcu(ghes, &ghes_sci, list) {
+    list_for_each_entry_rcu(ghes, &ghes_hed, list) {
          if (!ghes_proc(ghes))
              ret = NOTIFY_OK;
      }
@@ -718,8 +718,8 @@ static int ghes_notify_sci(struct notifier_block *this,
      return ret;
  }

-static struct notifier_block ghes_notifier_sci = {
-    .notifier_call = ghes_notify_sci,
+static struct notifier_block ghes_notifier_hed = {
+    .notifier_call = ghes_notify_hed,
  };

  #ifdef CONFIG_HAVE_ACPI_APEI_NMI
@@ -966,7 +966,10 @@ static int ghes_probe(struct platform_device *ghes_dev)
      case ACPI_HEST_NOTIFY_POLLED:
      case ACPI_HEST_NOTIFY_EXTERNAL:
      case ACPI_HEST_NOTIFY_SCI:
+    case ACPI_HEST_NOTIFY_GSIV:
+    case ACPI_HEST_NOTIFY_GPIO:
          break;
+
      case ACPI_HEST_NOTIFY_NMI:
          if (!IS_ENABLED(CONFIG_HAVE_ACPI_APEI_NMI)) {
              pr_warn(GHES_PFX "Generic hardware error source: %d 
notified via NMI interrupt is not supported!\n",
@@ -1024,13 +1027,17 @@ static int ghes_probe(struct platform_device 
*ghes_dev)
              goto err_edac_unreg;
          }
          break;
+
      case ACPI_HEST_NOTIFY_SCI:
+    case ACPI_HEST_NOTIFY_GSIV:
+    case ACPI_HEST_NOTIFY_GPIO:
          mutex_lock(&ghes_list_mutex);
-        if (list_empty(&ghes_sci))
-            register_acpi_hed_notifier(&ghes_notifier_sci);
-        list_add_rcu(&ghes->list, &ghes_sci);
+        if (list_empty(&ghes_hed))
+            register_acpi_hed_notifier(&ghes_notifier_hed);
+        list_add_rcu(&ghes->list, &ghes_hed);
          mutex_unlock(&ghes_list_mutex);
          break;
+
      case ACPI_HEST_NOTIFY_NMI:
          ghes_nmi_add(ghes);
          break;
@@ -1066,14 +1073,18 @@ static int ghes_remove(struct platform_device 
*ghes_dev)
      case ACPI_HEST_NOTIFY_EXTERNAL:
          free_irq(ghes->irq, ghes);
          break;
+
      case ACPI_HEST_NOTIFY_SCI:
+    case ACPI_HEST_NOTIFY_GSIV:
+    case ACPI_HEST_NOTIFY_GPIO:
          mutex_lock(&ghes_list_mutex);
          list_del_rcu(&ghes->list);
-        if (list_empty(&ghes_sci))
-            unregister_acpi_hed_notifier(&ghes_notifier_sci);
+        if (list_empty(&ghes_hed))
+            unregister_acpi_hed_notifier(&ghes_notifier_hed);
          mutex_unlock(&ghes_list_mutex);
          synchronize_rcu();
          break;
+
      case ACPI_HEST_NOTIFY_NMI:
          ghes_nmi_remove(ghes);
          break;

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
