From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the pci-current tree
Date: Wed, 18 Jul 2018 17:03:51 -0500
Message-ID: <CAErSpo5nbS5oUpkEQGfG3VFEaR_JDjFRCOior33zms_NL7qZrQ@mail.gmail.com>
References: <20180719074927.68da9f86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719074927.68da9f86@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 18, 2018 at 4:49 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Bjorn,
>
> Commits
>
>   27a6c9ebf29b ("PCI: v3-semi: Fix I/O space page leak")
>   db2aff16ea70 ("PCI: mediatek: Fix I/O space page leak")
>   52022fc6f6ad ("PCI: faraday: Fix I/O space page leak")
>   a9c0419ec92f ("PCI: aardvark: Fix I/O space page leak")
>   45cb32b4e8ea ("PCI: designware: Fix I/O space page leak")
>   89c0f3551827 ("PCI: versatile: Fix I/O space page leak")
>   596c66bf9663 ("PCI: xgene: Fix I/O space page leak")
>   ede26a1e8c35 ("PCI: OF: Fix I/O space page leak")
>
> are missing a Signed-off-by from their committer.  Presumably they were
> all rebased?

Yep, sorry, I picked those from Lorenzo's fixes branch.  I added
signoffs and updated my for-linus branch.
