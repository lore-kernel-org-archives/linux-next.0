From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Tue, 15 Jul 2008 22:35:13 -0700
Message-ID: <1216186513.28841.0.camel@brick>
References: <20080716153316.6a0cd6df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.30]:56650 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751753AbYGPFfT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Jul 2008 01:35:19 -0400
Received: by yw-out-2324.google.com with SMTP id 9so2688227ywe.1
        for <linux-next@vger.kernel.org>; Tue, 15 Jul 2008 22:35:19 -0700 (PDT)
In-Reply-To: <20080716153316.6a0cd6df.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andi Kleen <ak@suse.de>

CC'ing Andi whom I believe is looking after ACPI while Len is away.

On Wed, 2008-07-16 at 15:33 +1000, Stephen Rothwell wrote:
> Hi Len,
> 
> Today's linux-next merge of the acpi tree got conflicts in
> arch/x86/kernel/acpi/sleep.c between commits
> 3bf2e77453a87c22eb57ed4926760ac131c84459 ("x86, suspend, acpi: enter Big
> Real Mode") and 065cb3dfe24978651caedfa54da585388ad15dde ("x86, suspend,
> acpi: correct and add comments about Big Real Mode") from Linus' tree and
> commit 60d40a50886415040888bde5133ccfeab40d945f ("x86 ACPI: normalize
> segment descriptor register on resume") from the acpi tree (which also
> appears to be in Linus' tree).
> 
> I used the version from Linus' tree.
