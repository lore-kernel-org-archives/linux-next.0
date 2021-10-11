Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428BFC433EF
	for <linux-next@archiver.kernel.org>; Mon, 11 Oct 2021 11:23:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27DFC60EDF
	for <linux-next@archiver.kernel.org>; Mon, 11 Oct 2021 11:23:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbhJKLZE (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 11 Oct 2021 07:25:04 -0400
Received: from foss.arm.com ([217.140.110.172]:46770 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230394AbhJKLZD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Oct 2021 07:25:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74667106F;
        Mon, 11 Oct 2021 04:23:03 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 701E43F66F;
        Mon, 11 Oct 2021 04:23:02 -0700 (PDT)
Date:   Mon, 11 Oct 2021 12:22:55 +0100
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Message-ID: <20211011112255.GA20292@lpieralisi>
References: <20211011101250.11902b31@canb.auug.org.au>
 <20211011053737.GA1834@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011053737.GA1834@thinkpad>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 11, 2021 at 11:07:37AM +0530, Manivannan Sadhasivam wrote:
> Hi Stephen,
> 
> On Mon, Oct 11, 2021 at 10:12:50AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > ERROR: modpost: "dw_pcie_ep_reset_bar" [drivers/pci/controller/dwc/pcie-qcom-ep.ko] undefined!
> > ERROR: modpost: "dw_pcie_ep_raise_msi_irq" [drivers/pci/controller/dwc/pcie-qcom-ep.ko] undefined!
> > ERROR: modpost: "dw_pcie_ep_raise_legacy_irq" [drivers/pci/controller/dwc/pcie-qcom-ep.ko] undefined!
> > 
> > Caused by commit
> > 
> >   3872e6f0544f ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
> > 
> > I have used the pci tree from next-20211008 fot today.
> > 
> 
> I have submitted a patch for fixing this issue:
> 
> https://patchwork.kernel.org/project/linux-pci/patch/20211010115937.15856-1-manivannan.sadhasivam@linaro.org/

I have squashed it in the original commit it is fixing.

Thanks,
Lorenzo
