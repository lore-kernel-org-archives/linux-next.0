From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the pci tree
Date: Mon, 4 Jun 2018 12:04:32 -0500
Message-ID: <CAErSpo7VL6jajWxHVacbv-43iYZu_0H=+s=ZkGjeQd1irEkucA@mail.gmail.com>
References: <20180603114133.64a2cc77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180603114133.64a2cc77@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, l.subrahmanya@mobiveil.co.in
List-Id: linux-next.vger.kernel.org

On Sat, Jun 2, 2018 at 8:41 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Bjorn,
>
> Commits
>
>   aeddc65a043f ("PCI: mobiveil: Add Mobiveil PCIe Host Bridge IP driver DT bindings")
>   c1efa236b42b ("PCI: mobiveil: Add Mobiveil PCIe Host Bridge IP driver")
>   18eb4158c840 ("PCI: mobiveil: Add MSI support")
>
> are missing a Signed-off-by from their committer.

Fixed, thanks.  I had cherry-picked those from Lorenzo's branch to fix
an issue while he's away, and neglected to add my own Signed-off-by.
