Return-Path: <SRS0=MvKh=DQ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46DBC43457
	for <linux-next@archiver.kernel.org>; Fri,  9 Oct 2020 08:51:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E45122275
	for <linux-next@archiver.kernel.org>; Fri,  9 Oct 2020 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602233485;
	bh=lAu6P8LCIByjWbxOP3nSpIqzfFQzLfcTO66WLIpNaO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=U3Dq9naWRj54K9I2R6pRCadzxvJCEUt+ZKTnEbE61/baTfs/BQjM2kl3m2AU0WU+t
	 lpJsM2LGpVpR0cDAcYRDOGBB9CDkfQrPh/vigSahTFwXCMH/Obopst/TwdP66vClWd
	 61Fmm62an2Y4FIPKI/s9Cb9VqEBDksRofYqcaqzg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730726AbgJIIvW (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 9 Oct 2020 04:51:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:52180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732492AbgJIIvV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Oct 2020 04:51:21 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 480A022272;
        Fri,  9 Oct 2020 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602233480;
        bh=lAu6P8LCIByjWbxOP3nSpIqzfFQzLfcTO66WLIpNaO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ve5Y2GFsqCjc6n3mG4gX0Oz9uflgvT6Jf4S+yw2qcfcqI1oYUR4QSUk6o/OER2vmv
         w5OBexYMrELdCzsgezUWr0P+Hryw63ZUVUGOwJvjTklbsDnJxYxIkb0luizqKbazrO
         QgLSepMCnJgUGJfA71BdCjgHF2oEvBDtqZIFBGmI=
Date:   Fri, 9 Oct 2020 09:51:15 +0100
From:   Will Deacon <will@kernel.org>
To:     Qian Cai <cai@redhat.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        James Morse <james.morse@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] arm64: initialize per-cpu offsets earlier
Message-ID: <20201009085115.GC29594@willie-the-truck>
References: <20201005164303.21389-1-mark.rutland@arm.com>
 <711bc57a314d8d646b41307008db2845b7537b3d.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <711bc57a314d8d646b41307008db2845b7537b3d.camel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 08, 2020 at 09:18:24PM -0400, Qian Cai wrote:
> On Mon, 2020-10-05 at 17:43 +0100, Mark Rutland wrote:
> > The current initialization of the per-cpu offset register is difficult
> > to follow and this initialization is not always early enough for
> > upcoming instrumentation with KCSAN, where the instrumentation callbacks
> > use the per-cpu offset.
> > 
> > To make it possible to support KCSAN, and to simplify reasoning about
> > early bringup code, let's initialize the per-cpu offset earlier, before
> > we run any C code that may consume it. To do so, this patch adds a new
> > init_this_cpu_offset() helper that's called before the usual
> > primary/secondary start functions. For consistency, this is also used to
> > re-initialize the per-cpu offset after the runtime per-cpu areas have
> > been allocated (which can change CPU0's offset).
> > 
> > So that init_this_cpu_offset() isn't subject to any instrumentation that
> > might consume the per-cpu offset, it is marked with noinstr, preventing
> > instrumentation.
> > 
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: James Morse <james.morse@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> 
> Reverting this commit on the top of today's linux-next fixed an issue that
> Thunder X2 is unable to boot:
> 
> .config: https://gitlab.com/cailca/linux-mm/-/blob/master/arm64.config
> 
> EFI stub: Booting Linux Kernel...
> EFI stub: EFI_RNG_PROTOCOL unavailable, KASLR will be disabled
> EFI stub: Using DTB from configuration table
> EFI stub: Exiting boot services and installing virtual address map...
> 
> It hangs here for more than 10 minutes even with "earlycon" before I gave up.
> The reverting makes it boot again following by those lines almost immediately.
> 
> [    0.000000][    T0] Booting Linux on physical CPU 0x0000000000 [0x431f0af1]
> [    0.000000][    T0] Linux version 5.9.0-rc8-next-20201008+ (gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5), GNU ld version 2.30-79.el8) #6 SMP Thu Oct 8 20:57:40 EDT 2020
> [    0.000000][    T0] efi: EFI v2.70 by American Megatrends
> [    0.000000][    T0] efi: ESRT=0xf9224418 SMBIOS=0xfcca0000 SMBIOS 3.0=0xfcc90000 ACPI 2.0=0xf9720000 MEMRESERVE=0xfc965918 
> [    0.000000][    T0] esrt: Reserving ESRT space from 0x00000000f9224418 to 0x00000000f9224450.
> [    0.000000][    T0] ACPI: Early table checksum verification disabled
> [    0.000000][    T0] ACPI: RSDP 0x00000000F9720000 000024 (v02 HPE   )
> [    0.000000][    T0] ACPI: XSDT 0x00000000F9720028 0000DC (v01 HPE    ServerCL 01072009 AMI  00010013)
> [    0.000000][    T0] ACPI: FACP 0x00000000F9720108 000114 (v06 HPE    ServerCL 01072009 AMI  00010013)
> [    0.000000][    T0] ACPI: DSDT 0x00000000F9720220 000714 (v02 HPE    ServerCL 20150406 INTL 20170831)
> [    0.000000][    T0] ACPI: FIDT 0x00000000F9720938 00009C (v01 HPE    ServerCL 01072009 AMI  00010013)

Interesting...

Could you provide a disassembly of init_this_cpu_offset() please?

I was hoping to send the 5.10 pull request today, so I'll probably have
to revert this change for now.

Will
