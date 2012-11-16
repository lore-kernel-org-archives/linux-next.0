From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the pm tree with the pci tree
Date: Fri, 16 Nov 2012 11:17:02 +0100
Message-ID: <1551022.HZcUtXAPiN@vostro.rjw.lan>
References: <20121106134826.32a117100825204d48150f0b@canb.auug.org.au> <CAErSpo7=wZUi4mB4N-pAWzRsyineRFh-W2NtZgAPJe5pNWUayA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([193.178.161.156]:48316 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751297Ab2KPKMk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Nov 2012 05:12:40 -0500
In-Reply-To: <CAErSpo7=wZUi4mB4N-pAWzRsyineRFh-W2NtZgAPJe5pNWUayA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Feng Tang <feng.tang@intel.com>

On Tuesday, November 06, 2012 09:52:40 AM Bjorn Helgaas wrote:
> On Mon, Nov 5, 2012 at 7:48 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Rafael,
> >
> > Today's linux-next merge of the pm tree got a conflict in
> > arch/x86/pci/acpi.c between commit 3f385fa9edce ("x86/PCI: Ignore _SEG on
> > HP xw9300") from the pci tree and commit 97a7108a3c00 ("ACPI / x86: Add
> > quirk for "CheckPoint P-20-00" to not use bridge _CRS_ info") from the pm
> > tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> 
> My opinion was that we should just drop the CheckPoint quirk.  See
> https://bugzilla.kernel.org/show_bug.cgi?id=47981#c36 for my
> rationale.

OK, I agree.  I'll revert that commit, then.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
