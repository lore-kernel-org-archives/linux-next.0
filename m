From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the kbuild tree
Date: Fri, 21 Dec 2018 11:59:44 +0100
Message-ID: <1790706.irnnyc2D39@aspire.rjw.lan>
References: <20181221125945.0114b06c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221125945.0114b06c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sinan Kaya <okaya@kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Friday, December 21, 2018 2:59:45 AM CET Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the pm tree got a conflict in:
> 
>   arch/arm64/Kconfig
> 
> between commits:
> 
>   2eac9c2dfb2b ("PCI: consolidate the PCI_DOMAINS and PCI_DOMAINS_GENERIC config options")
>   20f1b79d3359 ("PCI: consolidate the PCI_SYSCALL symbol")
> 
> from the kbuild tree and commit:
> 
>   52146173a033 ("arm64: select ACPI PCI code only when both features are enabled")
> 
> from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The fix looks good to me, thank you!
