Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B7936215B;
	Mon, 30 Mar 2026 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887484; cv=none; b=mx9QYTjb4SKZ8MPXW70HZy3divP5BuQQz3KYDwCjMTQCIoogod+8RudKU0Jw8wlfQRftMm+Hm2MwcMyw6/nLl4wSVUjOa99hyE5kM+nnuSNcpynZkQg5qla7c3I9OXmECsiMhVl8bcugR60pJ0bS1MUgsubhDARKhQrfHGytCDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887484; c=relaxed/simple;
	bh=O2cIEBY9nUpVAn2H3q24PwK7pKs2T/eh5k99lNUtjw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KRL5Kj4ymRhct2ZRi9A6IHBgheDmlRHVbze/mCwVvaZ+98dSYhdNq3Ty06cBl9HbGYpE/KpL/VhLbzF8EqhBmEJOPF9HX7reNBVa4PR4gGSx9kLnyOEjkBXWkYM2rxfqAAlLdclRD6P0Szs3tObswJ8yi9JLvvnECDcTPCvNx/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSWEyLTj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSWEyLTj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7705C4CEF7;
	Mon, 30 Mar 2026 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774887484;
	bh=O2cIEBY9nUpVAn2H3q24PwK7pKs2T/eh5k99lNUtjw4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gSWEyLTjSSTRqpK1RALsYFd7zoMIfq2W1TUm4NDtp91Lc56RyAWLHFErfSmsV7kYa
	 9p8NUaToVRm3OoGY5VkjH1sRBr2Nvy0OTii3GeBya1+q2wEbIvrZToWyE8ztnWOtlu
	 f1Vi55QCnsDZkxQ/hoQWa9CMQ0HjRHhs+epBEgKEb6GpxkSm7q/aLmJCc783lBjLSL
	 7zgHVmztz2Cz11CrOHEfrFIAfmi8qbd+GzVIKLmNUAvzQ1Lrr9JZ3UTqnrtHW2StQ1
	 Kecxr/d/Pk2ayCDVgxSf84vGwkCkR8rNaVLmk+InCc7vBBNjjEH0eYpMdFsw026MTA
	 EdO8JjW4qe9QQ==
Date: Mon, 30 Mar 2026 11:18:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Simon Richter <Simon.Richter@hogyros.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Message-ID: <20260330161802.GA79047@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1af4c63-185f-4252-b280-bb20ce9047a8@sirena.org.uk>

On Mon, Mar 30, 2026 at 03:51:47PM +0100, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 11:48:58PM +0900, Simon Richter wrote:
> > On 3/30/26 23:06, Mark Brown wrote:
> 
> > > > After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> > > > failed like this:
> 
> > >> /tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:
> > >> In function 'intel_vga_disable':
> > >> /tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:68:9: error:
> > ignoring return value of 'vga_get_uninterruptible' declared with attribute
> > 'warn_unused_result' [-Werror=unused-result]
> > >>    68 |         vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> > >>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> > > This is still present today.
> 
> > The fix for that should have gone in through drm-next. The version where the
> > warning occurs in line 68 is ancient however (that was changed[2] in
> > December).
> 
> The DRM tree is merged into -next after the PCI tree so that's not going
> to work, and in any case your tree really should work independently.

I dropped these these patches from the PCI tree for now, sorry for the
trouble:

  21b082bd2a45 ("PCI/VGA: Mark pci_set_vga_state() as __must_check")
  dc582b5ed4b7 ("PCI/VGA: Mark vga_get() and wrappers as __must_check")

For reference, I'm attaching the patches below.  We can deal with them
later.


commit 21b082bd2a45 ("PCI/VGA: Mark pci_set_vga_state() as __must_check")
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Sun Mar 8 02:35:38 2026 +0900

    PCI/VGA: Mark pci_set_vga_state() as __must_check
    
    pci_set_vga_state() can return an error, usually on non-x86 or virtualized
    environments, so mark it as __must_check.
    
    The only caller so far is __vga_tryget() in vgaarb.
    
    Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Link: https://patch.msgid.link/20260307173538.763188-6-Simon.Richter@hogyros.de


diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d5123..aa1451d402d1 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1720,8 +1720,8 @@ resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)
 
-int pci_set_vga_state(struct pci_dev *pdev, bool decode,
-		      unsigned int command_bits, u32 flags);
+int __must_check pci_set_vga_state(struct pci_dev *pdev, bool decode,
+				   unsigned int command_bits, u32 flags);
 
 /*
  * Virtual interrupts allow for more interrupts to be allocated
commit dc582b5ed4b7 ("PCI/VGA: Mark vga_get() and wrappers as __must_check")
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Sun Mar 8 02:35:36 2026 +0900

    PCI/VGA: Mark vga_get() and wrappers as __must_check
    
    The vga_get() function and the two wrappers vga_get_interruptible() and
    vga_get_uninterruptible() can return errors. As these are paired with
    vga_put(), which must only be called after vga_get() returned success, all
    callers need to check the return code.
    
    Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Link: https://patch.msgid.link/20260307173538.763188-4-Simon.Richter@hogyros.de


diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index 97129a1bbb7d..eed524c67c22 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -27,7 +27,8 @@ struct pci_dev;
 
 #ifdef CONFIG_VGA_ARB
 void vga_set_legacy_decoding(struct pci_dev *pdev, unsigned int decodes);
-int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible);
+int __must_check vga_get(struct pci_dev *pdev, unsigned int rsrc,
+			 int interruptible);
 void vga_put(struct pci_dev *pdev, unsigned int rsrc);
 struct pci_dev *vga_default_device(void);
 void vga_set_default_device(struct pci_dev *pdev);
@@ -39,8 +40,8 @@ static inline void vga_set_legacy_decoding(struct pci_dev *pdev,
 		unsigned int decodes)
 {
 };
-static inline int vga_get(struct pci_dev *pdev, unsigned int rsrc,
-		int interruptible)
+static inline int __must_check vga_get(struct pci_dev *pdev, unsigned int rsrc,
+				       int interruptible)
 {
 	return 0;
 }
@@ -74,8 +75,8 @@ static inline int vga_client_register(struct pci_dev *pdev,
  *
  * On success, release the VGA resource again with vga_put().
  */
-static inline int vga_get_interruptible(struct pci_dev *pdev,
-					unsigned int rsrc)
+static inline int __must_check vga_get_interruptible(struct pci_dev *pdev,
+						     unsigned int rsrc)
 {
 	return vga_get(pdev, rsrc, 1);
 }
@@ -89,8 +90,8 @@ static inline int vga_get_interruptible(struct pci_dev *pdev,
  *
  * On success, release the VGA resource again with vga_put().
  */
-static inline int vga_get_uninterruptible(struct pci_dev *pdev,
-					  unsigned int rsrc)
+static inline int __must_check vga_get_uninterruptible(struct pci_dev *pdev,
+						       unsigned int rsrc)
 {
 	return vga_get(pdev, rsrc, 0);
 }
