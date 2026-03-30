Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062593264FF;
	Mon, 30 Mar 2026 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.187.169.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882507; cv=none; b=FUdrLNR8iljTe9W31eI96ZSk90wqrq+bB3b+TZEjEUYaWR44I/R4DnD0oWKGzwI6VQY0wqcQ1eK1hxWBdAqzMDYOdV9/PiCG6aqPLU57Owa+WJGK7+rxAOlURUF4d/YkKMEnGFNrrZpsHDjaiaChGmE3QXbGisqhp+dKrBa7ivQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882507; c=relaxed/simple;
	bh=H5yJrA/1CzjkU+Du+zFrF8PJ6izEYeWTnbsqZ9SNWJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDH3AjvMVbQWhBTjTyfCLE8IKMZp2gNJZeNGaXQhfWF4Q+mAIKHeNmYiIAlL9pygWAVSSM+hjevhzjxW8nNKD43YYkijIyhOc80uCi8qMgaXiI/IJ402clgBCdP/J3kTS3YsoV7/eVof2ew9p1MNlEq6WX09LGDlkYXBjfYLX3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass smtp.mailfrom=hogyros.de; arc=none smtp.client-ip=185.187.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hogyros.de
Received: from localhost.localdomain (unknown [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id E6CBE3F01D;
	Mon, 30 Mar 2026 16:55:00 +0200 (CEST)
From: Simon Richter <Simon.Richter@hogyros.de>
To: Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Simon Richter <Simon.Richter@hogyros.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH 1/1] drm/i915: handle failure from vga_get_uninterruptible()
Date: Mon, 30 Mar 2026 23:53:02 +0900
Message-ID: <20260330145420.6884-1-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0e1a5161-ca49-4fad-9ef3-640236c2600f@sirena.org.uk>
References: <0e1a5161-ca49-4fad-9ef3-640236c2600f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vga_get_uninterruptible() function can return an error if it fails to
set up VGA decoding for the requested device.

If VGA decoding is unavailable, we don't need to be careful to leave the
VGA emulation in a usable state, as vgacon will also be unable to get
access later on, so just skip over the VGA accesses and the vga_put() call
matching the failed vga_get_uninterruptible().

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 drivers/gpu/drm/i915/display/intel_vga.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 6e125564db34..dd581f20e962 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -49,6 +49,7 @@ void intel_vga_disable(struct intel_display *display)
 	enum pipe pipe;
 	u32 tmp;
 	u8 sr1;
+	int err;
 
 	tmp = intel_de_read(display, vga_reg);
 	if (tmp & VGA_DISP_DISABLE)
@@ -65,13 +66,22 @@ void intel_vga_disable(struct intel_display *display)
 		    pipe_name(pipe));
 
 	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
-	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+	/*
+	 * if the VGA ports are inaccessible now, the chance that vgacon
+	 * will be able to access them later is low enough that we don't
+	 * have to care about the emulation state machines being in sync
+	 */
+	err = vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+	if (err)
+		goto skip;
+
 	outb(0x01, VGA_SEQ_I);
 	sr1 = inb(VGA_SEQ_D);
 	outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
 	vga_put(pdev, VGA_RSRC_LEGACY_IO);
 	udelay(300);
 
+skip:
 	intel_de_write(display, vga_reg, VGA_DISP_DISABLE);
 	intel_de_posting_read(display, vga_reg);
 }
@@ -79,6 +89,7 @@ void intel_vga_disable(struct intel_display *display)
 void intel_vga_reset_io_mem(struct intel_display *display)
 {
 	struct pci_dev *pdev = to_pci_dev(display->drm->dev);
+	int err;
 
 	/*
 	 * After we re-enable the power well, if we touch VGA register 0x3d5
@@ -89,8 +100,14 @@ void intel_vga_reset_io_mem(struct intel_display *display)
 	 * console_unlock(). So make here we touch the VGA MSR register, making
 	 * sure vgacon can keep working normally without triggering interrupts
 	 * and error messages.
+	 *
+	 * We ignore this issue if we can't access the VGA registers, because
+	 * neither can vgacon.
 	 */
-	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+	err = vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+	if (err)
+		return;
+
 	outb(inb(VGA_MIS_R), VGA_MIS_W);
 	vga_put(pdev, VGA_RSRC_LEGACY_IO);
 }
