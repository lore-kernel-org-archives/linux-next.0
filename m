From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Date: Thu, 15 Oct 2015 14:05:11 +1100
Message-ID: <20151015140511.0b1e0a2f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  Documentation/arm/uefi.txt

between commit:

  d4dddfdbbc75 ("arm64/efi: remove /chosen/linux, uefi-stub-kern-ver DT property")

from the arm64 tree and commit:

  c9494dc81875 ("arm64: Use core efi=debug instead of uefi_debug command line parameter")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/arm/uefi.txt
index 7f1bed8872f3,7b3fdfe0f7ba..000000000000
--- a/Documentation/arm/uefi.txt
+++ b/Documentation/arm/uefi.txt
@@@ -58,5 -58,5 +58,3 @@@ linux,uefi-mmap-desc-size | 32-bit | Si
  --------------------------------------------------------------------------------
  linux,uefi-mmap-desc-ver  | 32-bit | Version of the mmap descriptor format.
  --------------------------------------------------------------------------------
- 
- For verbose debug messages, specify 'uefi_debug' on the kernel command line.
 -linux,uefi-stub-kern-ver  | string | Copy of linux_banner from build.
 ---------------------------------------------------------------------------------
