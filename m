From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: manual merge of the pm tree with the pci tree
Date: Thu, 10 Jan 2013 11:30:06 -0700
Message-ID: <CAErSpo6vWrpJ-y4dGp3pa65UZUm50nzW-QfXji8tdYjh-OU_AA@mail.gmail.com>
References: <20130110112836.19126ca740c8e13a15860dc0@canb.auug.org.au> <3580741.9uNSi7V1RO@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3580741.9uNSi7V1RO@vostro.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jan 10, 2013 at 6:12 AM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> Hi,
>
> On Thursday, January 10, 2013 11:28:36 AM Stephen Rothwell wrote:
>> Hi Rafael,
>>
>> Today's linux-next merge of the pm tree got a conflict in
>> drivers/acpi/pci_root.c between commit 3c449ed00759 ("PCI/ACPI: Reserve
>> firmware-allocated resources for hot-added root buses") from the pci tree
>> and commit 47525cda88f5 ("ACPI / PCI: Fold acpi_pci_root_start() into
>> acpi_pci_root_add()") from the pm tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary (no action
>> is required).
>
> Thanks for the fixup and please carry it for now (the conflict should go away
> when Bjorn pulls from my acpi-scan branch).

I pulled from acpi-scan and put it in my -next branch.

I had done this yesterday, but botched the conflict resolution
(thanks, Stephen, for showing me the correct resolution).  So I
recreated my pci/yinghai-survey-resources+acpi-scan branch, re-did the
merge, the force-updated both my
pci/yinghai-survey-resources+acpi-scan and next branches.

Bjorn
