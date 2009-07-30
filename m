From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: Boot failure on x86_64 (OOPS set_cpu_sibling_map() )
Date: Thu, 30 Jul 2009 15:56:23 +0200
Message-ID: <20090730135623.GB16659@aftab>
References: <20090730182143.eadf36e6.sfr@canb.auug.org.au>
 <4A718338.6050907@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sg2ehsobe002.messaging.microsoft.com ([207.46.51.76]:28071 "EHLO
	SG2EHSOBE002.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750925AbZG3N4i convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Jul 2009 09:56:38 -0400
Content-Disposition: inline
In-Reply-To: <4A718338.6050907@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>

Hi,

On Thu, Jul 30, 2009 at 04:55:44PM +0530, Sachin Sant wrote:
> Today's Next failed to boot on a x86_64 box with following traces
>=20
> ACPI: Core revision 20090625
> BUG: unable to handle kernel NULL pointer dereference at (null)
> IP: [<ffffffff81328c7b>] set_cpu_sibling_map+0x24f/0x353

I can't trigger it here, please send me your .config. In the meantime,
you could try the following:

--
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 3ede593..5fd57fe 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1070,6 +1070,7 @@ void __init native_smp_prepare_cpus(unsigned int =
max_cpus)
 	for_each_possible_cpu(i) {
 		zalloc_cpumask_var(&per_cpu(cpu_sibling_map, i), GFP_KERNEL);
 		zalloc_cpumask_var(&per_cpu(cpu_core_map, i), GFP_KERNEL);
+		zalloc_cpumask_var(&per_cpu(cpu_node_map, i), GFP_KERNEL);
 		zalloc_cpumask_var(&cpu_data(i).llc_shared_map, GFP_KERNEL);
 	}
 	set_cpu_sibling_map(0);
--=20
1.6.3.3


--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
