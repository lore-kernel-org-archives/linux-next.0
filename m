From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: manual merge of the pci tree with the mips tree
Date: Mon, 27 Feb 2012 16:15:20 -0700
Message-ID: <CAErSpo4r81nYtUNQ8_Wt1RGsCrWFJ4PAGSnRdpKV6vRNhkS9Lg@mail.gmail.com>
References: <20120227113129.c03c34ff7ea516f155cf0c87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:50676 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754350Ab2B0XPl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Feb 2012 18:15:41 -0500
Received: by wibhm11 with SMTP id hm11so1620395wib.19
        for <linux-next@vger.kernel.org>; Mon, 27 Feb 2012 15:15:40 -0800 (PST)
In-Reply-To: <20120227113129.c03c34ff7ea516f155cf0c87@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>

On Sun, Feb 26, 2012 at 5:31 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Jesse,
>
> Today's linux-next merge of the pci tree got a conflict in
> arch/mips/pci/pci.c between commit f79eaeb10849 ("MIPS: PCI: use
> list_for_each_entry() for bus->devices traversal") from the mips tree and
> commit 96a6b9ad05a2 ("mips/PCI: get rid of device resource fixups") from
> the pci tree.
>
> The latter appears to supersede the former, so I used that.

Sounds right to me.  Thanks.

Bjorn
