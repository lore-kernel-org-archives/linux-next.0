From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci-current tree
Date: Fri, 1 Feb 2019 08:57:58 -0600
Message-ID: <CAErSpo7=GUvSpYWYKVBdH_ypoqOHyU7P_zq_QX_QYTx8ynvgiQ@mail.gmail.com>
References: <20190201165130.1d9c9850@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201165130.1d9c9850@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jan 31, 2019 at 11:51 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Bjorn,
>
> Commits
>
>   f14bcc0add3a ("Revert "PCI: armada8k: Add support for gpio controlled reset signal"")
>   432dd7064aa1 ("ARM: cns3xxx: Use actual size reads for PCIe")
>   65dbb423cf28 ("ARM: cns3xxx: Fix writing to wrong PCI config registers after alignment")
>   a4ace4fa2007 ("PCI: imx: Fix checking pd_pcie_phy device link addition")
>   a6093ad7fc49 ("PCI: imx: Fix probe failure without power domain")
>
> are missing a Signed-off-by from their committer.

Dang, that's my fault.  They were originally commited by Lorenzo, but
instead of merging Lorenzo's branch directly, I cherry-picked the
commits into my for-linus branch so I could tweak a changelog.  I'd
fix it, but Linus has already pulled them.  Sorry, I'll try to
remember to do this right next time.

Bjorn
