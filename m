From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci tree
Date: Wed, 25 Jun 2008 12:28:19 -0700
Message-ID: <200806251228.19414.jbarnes@virtuousgeek.org>
References: <20080625130104.b376c221.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-11.bluehost.com ([69.89.18.111]:41508 "HELO
	outbound-mail-11.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752401AbYFYT2c (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 15:28:32 -0400
In-Reply-To: <20080625130104.b376c221.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Robert Richter <robert.richter@amd.com>, Gary Hade <garyhade@us.ibm.com>, Ingo Molnar <mingo@elte.hu>

On Tuesday, June 24, 2008 8:01 pm Stephen Rothwell wrote:
> Hi Jesse,
>
> Today's linux-next merge of the pci tree got a conflict in
> arch/x86/pci/pci.h between commit
> 547084aab406ea46c1b9bebb115dc86787720c11 ("x86: Move PCI IO ECS code to
> x86/pci") from the x86 tree and commit
> bb71ad880204b79d60331d3384103976e086cb9f ("PCI: boot parameter to avoid
> expansion ROM memory allocation") from the pci tree.
>
> Both commits wanted to use 0x40000 for a define (PCI_HAS_IO_ECS and
> PCI_NOASSIGN_ROMS).  I set PCI_NOASSIGN_ROMS to 0x80000.

Works for me, I can make that change in my linux-next tree if it helps.

Thanks,
Jesse
