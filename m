From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: manual merge of the pci tree with the asm-generic tree
Date: Wed, 04 Apr 2018 18:38:51 +0000
Message-ID: <CAErSpo5UpMrBn2VFyMD4VHvKnC04vGy5Wpzi76ZhD=ne6kdLtw@mail.gmail.com>
References: <20180403121415.20c4843e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180403121415.20c4843e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jesper@jni.nu, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 2, 2018 at 9:15 PM Stephen Rothwell <sfr@canb.auug.org.au>
wrote:

> Hi all,

> Today's linux-next merge of the pci tree got a conflict in:

>     arch/cris/arch-v32/drivers/pci/bios.c

> between commits:

>     c690eddc2f3b ("CRIS: Drop support for the CRIS port")
>     fd8773f9f544 ("arch: remove frv port")
>     739d875dd698 ("mn10300: Remove the architecture")

> from the asm-generic tree and commit:

>     31cbca85df15 ("PCI/MSI: Don't set up INTx if MSI or MSI-X is enabled")

> from the pci tree.

FWIW, I dropped the cris, frv, and mn10300 parts from my patch
(31cbca85df15).
