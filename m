From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: linux-next: rr tree build failure
Date: Mon, 3 Aug 2009 14:22:27 -0600
Message-ID: <200908031422.28171.bjorn.helgaas@hp.com>
References: <20090803133203.81174a8e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g5t0007.atlanta.hp.com ([15.192.0.44]:2002 "EHLO
	g5t0007.atlanta.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbZHCUW2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Aug 2009 16:22:28 -0400
In-Reply-To: <20090803133203.81174a8e.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>

On Sunday 02 August 2009 09:32:03 pm Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/acpi/osl.c: In function 'bind_to_cpu0':
> drivers/acpi/osl.c:194: error: implicit declaration of function 'set_cpus_allowed'
> 
> Caused by commit 74b5820808215f65b70b05a099d6d3c969b82689 ("ACPI: bind
> workqueues to CPU 0 to avoid SMI corruption") (from the acpi tree but now
> in Linus' tree) interacting with commit
> 17e249fb40c814a72f08c1356cb47ec9f87f81a8
> ("cpumask:remove-set_cpus_allowed") from the rr tree.
> 
> I have reverted that rr tree commit for today.

Here's a patch to fix this.  Since Linus' tree still contains instances
of set_cpus_allowed(), I'm guessing this patch should be added to the rr
tree?

Bjorn



ACPI: remove cpumask_t usage

set_cpus_allowed() is on the way out; replace it with
set_cpus_allowed_ptr().

Reference: http://lkml.org/lkml/2008/11/6/448

Signed-off-by: Bjorn Helgaas <bjorn.helgaas@hp.com>
CC: Rusty Russell <rusty@rustcorp.com.au>

diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 5691f16..e196a75 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -191,7 +191,7 @@ acpi_status __init acpi_os_initialize(void)
 
 static void bind_to_cpu0(struct work_struct *work)
 {
-	set_cpus_allowed(current, cpumask_of_cpu(0));
+	set_cpus_allowed_ptr(current, cpumask_of(0));
 	kfree(work);
 }
 
