Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495FEC433B4
	for <linux-next@archiver.kernel.org>; Tue, 13 Apr 2021 06:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 254B061370
	for <linux-next@archiver.kernel.org>; Tue, 13 Apr 2021 06:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344862AbhDMGG4 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 13 Apr 2021 02:06:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:44370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343930AbhDMGGv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Apr 2021 02:06:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1469D613AB;
        Tue, 13 Apr 2021 06:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618293992;
        bh=a9llW2UJuHJzVBmVMgkCnV/iRToBVGCYdqDaOF3NDPU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DS9VY+qbEmJGvRUp+dANg3X5kJeTOCODIX52AJsIwg1Z5sgp/5f8xxiq/ARfHZdJM
         eIDF4GJKo/0HMWxavHFzsijjmUrzH7QYglrXbaA8LWazOc/+vNmpDrOJQYv7t+TyRB
         iQUHAFtc0hgkprjlOgcbBSlFtkVbXIBZ+XFEyghHndMSjKP+L2e/P3+zKZNSOtQwW5
         iUWlUYyL0N2KmzJMYfsA6fUI2riZFQB31GhiZALpgNuaAm4icAMEMXXvHhVanmZAAc
         50g2mTCThMXLVEL6RnjAmOnUGCOyLUguoHVSOn/WovVR6QjaY7/tVIswyg8xXtxQ3t
         wL+8sYlgUG9Qg==
Date:   Tue, 13 Apr 2021 09:06:20 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Subject: Re: linux-next: Tree for Apr 9 (x86 boot problem)
Message-ID: <YHU03AIwrpHCUlU/@kernel.org>
References: <20210409215103.03999588@canb.auug.org.au>
 <f67d3e03-af90-f790-baf4-8d412fe055af@infradead.org>
 <YHPlTifk6jST5auY@kernel.org>
 <aa83b81e-a03d-b835-6b45-01efc7e08dce@infradead.org>
 <YHR86T15BzETVHhk@kernel.org>
 <d56ebb95-1c40-5994-383f-70d8f226e8c3@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d56ebb95-1c40-5994-383f-70d8f226e8c3@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

On Mon, Apr 12, 2021 at 01:53:34PM -0700, Randy Dunlap wrote:
> On 4/12/21 10:01 AM, Mike Rapoport wrote:
> > On Mon, Apr 12, 2021 at 08:49:49AM -0700, Randy Dunlap wrote:
> >  
> > I thought about adding some prints to see what's causing the hang, the
> > reservations or their absence. Can you replace the debug patch with this
> > one:
> > 
> > diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> > index 776fc9b3fafe..a10ac252dbcc 100644
> > --- a/arch/x86/kernel/setup.c
> > +++ b/arch/x86/kernel/setup.c
> > @@ -600,10 +600,13 @@ static bool __init snb_gfx_workaround_needed(void)
> >  		return false;
> >  
> >  	vendor = read_pci_config_16(0, 2, 0, PCI_VENDOR_ID);
> > +	devid = read_pci_config_16(0, 2, 0, PCI_DEVICE_ID);
> > +
> > +	pr_info("%s: vendor: %x, device: %x\n", __func__, vendor, device);
> 
> s/device)/devid)/
 
Oh, sorry.

> > +
> >  	if (vendor != 0x8086)
> >  		return false;
> >  
> > -	devid = read_pci_config_16(0, 2, 0, PCI_DEVICE_ID);
> >  	for (i = 0; i < ARRAY_SIZE(snb_ids); i++)
> >  		if (devid == snb_ids[i])
> >  			return true;
> 
> That prints:
> 
> [    0.000000] snb_gfx_workaround_needed: vendor: 8086, device: 126
> [    0.000000] early_reserve_memory: snb_gfx: 1
> ...
> [    0.014061] snb_gfx_workaround_needed: vendor: 8086, device: 126
> [    0.014064] reserving inaccessible SNB gfx pages
> 
> 
> The full boot log is attached.
 
Can you please send the log with memblock=debug added to the kernel command
line?

Probably should have started from this...

-- 
Sincerely yours,
Mike.
