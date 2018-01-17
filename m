From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
Date: Wed, 17 Jan 2018 15:00:30 -0600
Message-ID: <CAErSpo512X9mEEN7Ke9crjX5zb6AG8KqutabCvpzOFhKkNDkCw@mail.gmail.com>
References: <20180118075332.41277d6f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180118075332.41277d6f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 17, 2018 at 2:53 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Bjorn,
>
> Commit
>
>   209930d809fa ("PCI/ASPM: Add pci_enable_link_state()")
>
> is missing a Signed-off-by from its author and commmiter.

Oh, thanks!  I didn't intend to include that commit.  I dropped it and
updated my "next" branch.
