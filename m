From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dt-rh tree with the iommu tree
Date: Wed, 11 May 2016 12:20:37 +1000
Message-ID: <20160511122037.43cd3db8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>, Robin Murphy <robin.murphy@arm.com>, Will Deacon <will.deacon@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Rob,

Today's linux-next merge of the dt-rh tree got a conflict in:

  drivers/iommu/arm-smmu.c

between commit:

  d54663573131 ("iommu/arm-smmu: Use per-domain page sizes.")

from the iommu tree and commit:

  cb6c27bb0912 ("iommu/arm-smmu: Make use of phandle iterators in device-tree parsing")

from the dt-rh tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/iommu/arm-smmu.c
index 0360919a5737,a1c965cdcfad..000000000000
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@@ -397,6 -357,14 +397,12 @@@ struct arm_smmu_domain 
  	struct iommu_domain		domain;
  };
  
+ struct arm_smmu_phandle_args {
+ 	struct device_node *np;
+ 	int args_count;
+ 	uint32_t args[MAX_MASTER_STREAMIDS];
+ };
+ 
 -static struct iommu_ops arm_smmu_ops;
 -
  static DEFINE_SPINLOCK(arm_smmu_devices_lock);
  static LIST_HEAD(arm_smmu_devices);
  
@@@ -1950,11 -1829,14 +1969,14 @@@ static int arm_smmu_device_dt_probe(str
  
  		i++;
  	}
+ 
  	dev_notice(dev, "registered %d master devices\n", i);
  
+ 	kfree(masterspec);
+ 
  	parse_driver_options(smmu);
  
 -	if (smmu->version > ARM_SMMU_V1 &&
 +	if (smmu->version == ARM_SMMU_V2 &&
  	    smmu->num_context_banks != smmu->num_context_irqs) {
  		dev_err(dev,
  			"found only %d context interrupt(s) but %d required\n",
