Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14895C433EF
	for <linux-next@archiver.kernel.org>; Mon, 11 Oct 2021 05:37:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE55460230
	for <linux-next@archiver.kernel.org>; Mon, 11 Oct 2021 05:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233772AbhJKFjw (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 11 Oct 2021 01:39:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:53174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230341AbhJKFjw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Oct 2021 01:39:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 872A160E94;
        Mon, 11 Oct 2021 05:37:46 +0000 (UTC)
Date:   Mon, 11 Oct 2021 11:07:37 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Message-ID: <20211011053737.GA1834@thinkpad>
References: <20211011101250.11902b31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011101250.11902b31@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Oct 11, 2021 at 10:12:50AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: modpost: "dw_pcie_ep_reset_bar" [drivers/pci/controller/dwc/pcie-qcom-ep.ko] undefined!
> ERROR: modpost: "dw_pcie_ep_raise_msi_irq" [drivers/pci/controller/dwc/pcie-qcom-ep.ko] undefined!
> ERROR: modpost: "dw_pcie_ep_raise_legacy_irq" [drivers/pci/controller/dwc/pcie-qcom-ep.ko] undefined!
> 
> Caused by commit
> 
>   3872e6f0544f ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
> 
> I have used the pci tree from next-20211008 fot today.
> 

I have submitted a patch for fixing this issue:

https://patchwork.kernel.org/project/linux-pci/patch/20211010115937.15856-1-manivannan.sadhasivam@linaro.org/

Thanks,
Mani

> -- 
> Cheers,
> Stephen Rothwell


