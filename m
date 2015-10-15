From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with the arm-soc tree
Date: Thu, 15 Oct 2015 13:19:11 +1100
Message-ID: <20151015131911.3b3a7ca8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59701 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751098AbbJOCTN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Oct 2015 22:19:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Kukjin Kim <kgene@kernel.org>

Hi Lee,

Today's linux-next merge of the mfd tree got a conflict in:

  Documentation/devicetree/bindings/mfd/s2mps11.txt

between commit:

  6a4479f96543 ("dt-bindings: Document grounded ACOKB pin on S2MPS11")

from the arm-soc tree and commit:

  db96ec728d69 ("mfd: dt-bindings: Document pulled down WRSTBI pin on S2MPS1X")

from the mfd tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/devicetree/bindings/mfd/s2mps11.txt
index 90eaef393325,a0bc753955c2..000000000000
--- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
+++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
@@@ -15,10 -15,9 +15,13 @@@ Optional properties
  - interrupt-parent: Specifies the phandle of the interrupt controller to which
    the interrupts from s2mps11 are delivered to.
  - interrupts: Interrupt specifiers for interrupt sources.
 +- samsung,s2mps11-acokb-ground: Indicates that ACOKB pin of S2MPS11 PMIC is
 +  connected to the ground so the PMIC must manually set PWRHOLD bit in CTRL1
 +  register to turn off the power. Usually the ACOKB is pulled up to VBATT so
 +  when PWRHOLD pin goes low, the rising ACOKB will trigger power off.
+ - samsung,s2mps11-wrstbi-ground: Indicates that WRSTBI pin of PMIC is pulled
+   down. When the system is suspended it will always go down thus triggerring
+   unwanted buck warm reset (setting buck voltages to default values).
  
  Optional nodes:
  - clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffered 32.768
