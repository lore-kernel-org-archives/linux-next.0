From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pstore tree
Date: Thu, 6 Apr 2017 12:31:58 +1000
Message-ID: <20170406123158.7d575f47@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34549 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752635AbdDFCcE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 Apr 2017 22:32:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Evgeny Kalugin <evgeny.kalugin@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Kees Cook <keescook@chromium.org>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/firmware/efi/efi-pstore.c

between commit:

  76cc9580e3fb ("pstore: Replace arguments for write() API")

from the pstore tree and commit:

  fee929ba1c93 ("efi/pstore: Return error code (if any) from efi_pstore_write()")

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

diff --cc drivers/firmware/efi/efi-pstore.c
index 93d8cdbe7ef4,6b5acefce6b3..000000000000
--- a/drivers/firmware/efi/efi-pstore.c
+++ b/drivers/firmware/efi/efi-pstore.c
@@@ -254,14 -274,14 +254,14 @@@ static int efi_pstore_write(struct psto
  	for (i = 0; i < DUMP_NAME_LEN; i++)
  		efi_name[i] = name[i];
  
- 	efivar_entry_set_safe(efi_name, vendor, PSTORE_EFI_ATTRIBUTES,
- 			      !pstore_cannot_block_path(record->reason),
- 			      record->size, record->psi->buf);
+ 	ret = efivar_entry_set_safe(efi_name, vendor, PSTORE_EFI_ATTRIBUTES,
 -				    !pstore_cannot_block_path(reason),
 -				    size, psi->buf);
++				    !pstore_cannot_block_path(record->reason),
++				    record->size, record->psi->buf);
  
 -	if (reason == KMSG_DUMP_OOPS)
 +	if (record->reason == KMSG_DUMP_OOPS)
  		efivar_run_worker();
  
 -	*id = part;
 +	record->id = record->part;
  	return ret;
  };
  
