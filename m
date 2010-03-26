From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: linux-next: manual merge of the pci tree with the pci-current tree
Date: Fri, 26 Mar 2010 08:43:35 -0600
Message-ID: <201003260843.35458.bjorn.helgaas@hp.com>
References: <20100326115712.2d800053.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100326115712.2d800053.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thursday 25 March 2010 06:57:12 pm Stephen Rothwell wrote:
> Hi Jesse,
> 
> Today's linux-next merge of the pci tree got a conflict in
> arch/x86/pci/acpi.c between commit
> eb9fc8ef7cb1362374e55d9503e3e7458f319991 ("x86/PCI: for host bridge
> address space collisions, show conflicting resource") from the
> pci-current tree and commit 7589c4d809ccfc88100ba224e3358706fd21f37e
> ("x86/PCI: trim _CRS windows when they conflict with previous
> reservations") from the pci tree.

I'm sure Jesse has straightened this out already, but my intent
was to drop the "trim _CRS windows when they conflict" patch.

I replaced it with one called "truncate _CRS windows with _LEN >
_MAX - _MIN + 1".

Bjorn
