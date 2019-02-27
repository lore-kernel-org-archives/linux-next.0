From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
Date: Wed, 27 Feb 2019 17:51:46 -0600
Message-ID: <CAErSpo5-wi128AGyMsyvoyX0ObKon3Q4dU8FJEDTZAtxFHPk=w@mail.gmail.com>
References: <20190228080147.20df150f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228080147.20df150f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 27, 2019 at 3:01 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Bjorn,
>
> Commit
>
>   a048671aa0c8 ("PCI: qcom: Don't deassert reset GPIO during probe")
>
> is missing a Signed-off-by from its committer.

Lorenzo, if you add your signed-off-by, I can rebuild this.  I think
it's on your pci/dwc branch.
