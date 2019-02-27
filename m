From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: linux-next: build warning after merge of the iommu tree
Date: Wed, 27 Feb 2019 10:48:53 -0800
Message-ID: <e4db08ff-256d-5273-f02e-f8d0533efe04@linux.intel.com>
References: <20190227132004.4d3a3da4@canb.auug.org.au>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190227132004.4d3a3da4@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Joerg Roedel <joro@8bytes.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

On 2/26/19 6:20 PM, Stephen Rothwell wrote:
> Hi Joerg,
>
> After merging the iommu tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> In file included from drivers/pci/pci.c:32:
> include/linux/pci-ats.h:70:12: warning: 'pci_prg_resp_pasid_required' defined but not used [-Wunused-function]
>   static int pci_prg_resp_pasid_required(struct pci_dev *pdev)
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Introduced by commit
>
>    e5567f5f6762 ("PCI/ATS: Add pci_prg_resp_pasid_required() interface.")
>
> The non CONFIG_PCI_PASID version needs an "inline".
I can submit the fix, but do we need a new patch to fix it or the 
original patch can be updated ?
>
-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer
