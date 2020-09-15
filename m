Return-Path: <SRS0=UXhA=CY=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAB5C43461
	for <linux-next@archiver.kernel.org>; Tue, 15 Sep 2020 18:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 776B52193E
	for <linux-next@archiver.kernel.org>; Tue, 15 Sep 2020 18:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600196256;
	bh=vZaOdC9zd2ZYi/o8U519NqAOticZXrG0R+WZlDkyJyk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-ID:From;
	b=bjEWDH6oEOiw62ax+vE6r4ob8Zy0DGQHHbe9nEB/wSRWfg7rlOUxub3euTyMah5Cp
	 3z5xkaJ0JJ0l5LE8CXQTHuonN8fieRWp8CSIEnne3C8wFHrNvbfO9sGf1IiZwqwJDB
	 B+v18V4GWPmSdJV1BMnDM73J6QhLLXbZpc+4FRzw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbgIOS5d (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 15 Sep 2020 14:57:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:51814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727279AbgIORXI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Sep 2020 13:23:08 -0400
Received: from localhost (52.sub-72-107-123.myvzw.com [72.107.123.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4A2321D1B;
        Tue, 15 Sep 2020 17:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600190554;
        bh=vZaOdC9zd2ZYi/o8U519NqAOticZXrG0R+WZlDkyJyk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=qTmRhYpq+VQS/UwssViSYfiAHzDnWUkc+I+1dxcviT7PtmKnlQVvtUefOW1mqQFX8
         tHPqMcOjK7WnfZl9RFu/mHtSUVoINwXbega1S5LQjZS9H4PUXqH/FD4W2FK/GIzosa
         0mEVmlCOYr/xVLOnFuw0WmqSZKcCwag/ioi2VT8w=
Date:   Tue, 15 Sep 2020 12:22:32 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pci tree
Message-ID: <20200915172232.GA1403447@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915105326.GA3351@e121166-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 15, 2020 at 11:53:26AM +0100, Lorenzo Pieralisi wrote:
> On Tue, Sep 15, 2020 at 01:47:21PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Wed, 9 Sep 2020 10:06:20 -0600 Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Sep 8, 2020 at 8:37 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > After merging the pci tree, today's linux-next build (arm
> > > > multi_v7_defconfig) produced this warning:  
> > > 
> > > Uggg. I guess 0-day just doesn't do arm32 builds anymore as it caught
> > > more obscure build issues, but not this one (and some others I've had
> > > recently).
> > > 
> > > > drivers/pci/controller/dwc/pci-dra7xx.c: In function 'dra7xx_pcie_establish_link':
> > > > drivers/pci/controller/dwc/pci-dra7xx.c:142:6: warning: unused variable 'exp_cap_off' [-Wunused-variable]
> > > >   142 |  u32 exp_cap_off = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > > >       |      ^~~~~~~~~~~
> > > >
> > > > Introduced by commit
> > > >
> > > >   3af45d34d30c ("PCI: dwc: Centralize link gen setting")
> > 
> > I am still getting this warning.
> 
> I have pushed out a fix-up on my pci/dwc branch, the warning should
> disappear as soon as Bjorn pulls it.

Thanks for the reminder.  Should be fixed.
