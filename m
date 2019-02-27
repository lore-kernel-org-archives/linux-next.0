From: Kuppuswamy Sathyanarayanan
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v1 1/1] PCI/ATS: Add inline to pci_prg_resp_pasid_required()
Date: Wed, 27 Feb 2019 11:26:46 -0800
Message-ID: <65d2712b741cc17c72994642458520853e78f6ba.1551295414.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20190227132004.4d3a3da4@canb.auug.org.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190227132004.4d3a3da4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, joro@8bytes.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com
List-Id: linux-next.vger.kernel.org

Fix unused function warning when compiled with CONFIG_PCI_PASID
disabled.

Fixes: e5567f5f6762 ("PCI/ATS: Add pci_prg_resp_pasid_required() interface.")
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 include/linux/pci-ats.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
index facfd6a18fe1..1ebb88e7c184 100644
--- a/include/linux/pci-ats.h
+++ b/include/linux/pci-ats.h
@@ -67,7 +67,7 @@ static inline int pci_max_pasids(struct pci_dev *pdev)
 	return -EINVAL;
 }
 
-static int pci_prg_resp_pasid_required(struct pci_dev *pdev)
+static inline int pci_prg_resp_pasid_required(struct pci_dev *pdev)
 {
 	return 0;
 }
-- 
2.20.1
