From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: manual merge of the async_tx tree with the arm tree
Date: Tue, 3 Aug 2010 01:09:19 -0700
Message-ID: <AANLkTim_7YUEWGi9=V37GZA8FanD-k-r+A1YyXzwO5Jp@mail.gmail.com>
References: <20100727120805.f583c70b.sfr@canb.auug.org.au>
	<AANLkTin4EAQ48HP3ETDUMqBe2AzcznRuZdBdG+_RhR8x@mail.gmail.com>
	<20100728074322.GA8147@flint.arm.linux.org.uk>
	<AANLkTikTdLcYQ2cqt7HOoEANTRYOB_ySqdud5QEs5pd5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:61161 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751882Ab0HCIJV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Aug 2010 04:09:21 -0400
In-Reply-To: <AANLkTikTdLcYQ2cqt7HOoEANTRYOB_ySqdud5QEs5pd5@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: Russell King <rmk@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin.vincent@stericsson.com>, Jonas Aaberg <jonas.aberg@stericsson.com>

On Wed, Jul 28, 2010 at 4:50 PM, Linus Walleij
<linus.ml.walleij@gmail.com> wrote:
> 2010/7/28 Russell King <rmk@arm.linux.org.uk>:
>> On Wed, Jul 28, 2010 at 12:11:19AM -0700, Dan Williams wrote:
>>> On Mon, Jul 26, 2010 at 7:08 PM, Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>>> > Hi Dan,
>>> >
>>> > Today's linux-next merge of the async_tx tree got a conflict in
>>> > arch/arm/mach-ux500/devices-db8500.c between commit
>>> > 6055930cba8fdb2c8855b32bae262aaf69c1fdb4 ("ARM: 6266/1: ux500: ad=
d
>>> > separate irq lists for DB8500 and DB5500") from the arm tree and =
commit
>>> > 5aa12e8c9c57741606e52f43e62ab1b9dc8e9dcc ("DMAENGINE: ste_dma40: =
arch
>>> > updates for LCLA and LCPA") from the async_tx tree.
>>> >
>>> > I fixed it up (I think - see below) and can carry the fix as nece=
ssary.
>>> > --
>>>
>>> Thanks Stephen!
>>>
>>> Russell, the dma40 driver updates and related arch fixups have been
>>> sitting in next for a month, I'd prefer not to lose this baseline.
>>> Assuming this change is brand new any chance the dma40 specific par=
t
>>> of this patch can be peeled off and sent through my tree, or are yo=
u
>>> in a similar "can't/won't" rebase position?
>>
>> I don't see how the change in the ARM tree could be reasonably split=
=2E
>> Up to Rabin/Linus to decide what they want to do about this.
>
> Actually the way subsystem maintainers fix up conflicts and resolve t=
hem
> is a bit of opaque to me, I'd be happy to help in any way possible.
>
> Isn't it so that whoever hits the merge window first goes in and the
> other apply Stephens patch before issuing any pull request and be
> done with it? That was my na=EFve idea about these things...
>

It's a bag of dirty choices:

1/ Do nothing: LinusT will need to fix up the conflict in the same way
that Stephen has done.
2/ Drop the new patch from the ARM tree as the conflict could have
been seen ahead of time and send it later in the merge window after
async_tx.git has been merged,  but this might involve rebasing the ARM
tree.
3/ Back merge the ARM tree after it goes upstream so the conflict is
resolved before Linus pulls async_tx.git, but this makes the history
ugly
4/ Rewind the async_tx.git tree so we at least keep the same branch
point, but this still screws up people who use git pull to track
async_tx.git.

Option 1 is probably the lesser evil as Linus has said he does not
mind the occasional conflict, but it still feels wrong to push any
pain upstream when the conflict could have been seen ahead of time.

--
Dan
