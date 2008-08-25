From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the oprofile tree
Date: Mon, 25 Aug 2008 19:08:22 +1000
Message-ID: <20080825190822.591685e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49956 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752364AbYHYJIb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 05:08:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Robert Richter <robert.richter@amd.com>, Cyrill Gorcunov <gorcunov@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

Hi Ingo,

Today's linux-next merge of the oprofile tree got a conflict in
arch/x86/kernel/apic_32.c between commit
274cfe5912eebe9d4e1a4c451fe617289a181fcf ("x86: apic - rearrange
functions and comments") from the x86 tree and commits
286f571837ba9d67625afd015366d79345abb414 ("x86: apic_*.c: add description
to AMD's extended LVT functions"),
09691616850b3614dfb44790e1e1419b6a7f5d13 ("x86: apic: export symbols for
extended interrupt LVT functions") and
6aa360e6c16c145edf1837690e0f7aaea6b86ef3 ("x86: apic: changing export
symbols to *_GPL") from the oprofile tree.

The former moved some code that was updated by the latter.  I fixed it up
(see below) and can carry it.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/apic_32.c
index a91c57c,0ff576d..0000000
--- a/arch/x86/kernel/apic_32.c
+++ b/arch/x86/kernel/apic_32.c
@@@ -291,36 -241,6 +291,40 @@@ static void __setup_APIC_LVTT(unsigned 
  }
  
  /*
 + * Setup extended LVT, AMD specific (K8, family 10h)
 + *
 + * Vector mappings are hard coded. On K8 only offset 0 (APIC500) and
 + * MCE interrupts are supported. Thus MCE offset must be set to 0.
++ *
++ * If mask=1, the LVT entry does not generate interrupts while mask=0
++ * enables the vector. See also the BKDGs.
 + */
 +
 +#define APIC_EILVT_LVTOFF_MCE 0
 +#define APIC_EILVT_LVTOFF_IBS 1
 +
 +static void setup_APIC_eilvt(u8 lvt_off, u8 vector, u8 msg_type, u8 mask)
 +{
 +	unsigned long reg = (lvt_off << 4) + APIC_EILVT0;
 +	unsigned int  v   = (mask << 16) | (msg_type << 8) | vector;
 +
 +	apic_write(reg, v);
 +}
 +
 +u8 setup_APIC_eilvt_mce(u8 vector, u8 msg_type, u8 mask)
 +{
 +	setup_APIC_eilvt(APIC_EILVT_LVTOFF_MCE, vector, msg_type, mask);
 +	return APIC_EILVT_LVTOFF_MCE;
 +}
 +
 +u8 setup_APIC_eilvt_ibs(u8 vector, u8 msg_type, u8 mask)
 +{
 +	setup_APIC_eilvt(APIC_EILVT_LVTOFF_IBS, vector, msg_type, mask);
 +	return APIC_EILVT_LVTOFF_IBS;
 +}
++EXPORT_SYMBOL_GPL(setup_APIC_eilvt_ibs);
 +
 +/*
   * Program the next event, relative to now
   */
  static int lapic_next_event(unsigned long delta,
