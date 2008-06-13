From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of acpi tree
Date: Fri, 13 Jun 2008 10:45:45 +0200
Message-ID: <200806131045.45769.rjw@sisk.pl>
References: <20080613145357.1ea9f643.sfr@canb.auug.org.au> <alpine.LFD.1.10.0806130107530.8340@localhost.localdomain> <20080613160201.ac0ffd5f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:43093 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754660AbYFMIos (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 04:44:48 -0400
In-Reply-To: <20080613160201.ac0ffd5f.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>

On Friday, 13 of June 2008, Stephen Rothwell wrote:
> Hi Len,
> 
> On Fri, 13 Jun 2008 01:09:31 -0400 (EDT) Len Brown <lenb@kernel.org> wrote:
> >
> > On Fri, 13 Jun 2008, Stephen Rothwell wrote:
> > 
> > > Today's linux-next merge of the acpi tree got a context conflict in
> > > drivers/acpi/sleep/main.c between commit
> > > d8f3de0d2412bb91639cfefc5b3c79dbf3812212 ("Suspend-related patches for
> > > 2.6.27") from the pci tree and a couple of commits that are duplicate in
> > > the pci and acpi trees ("ACPI PM: acpi_pm_device_sleep_state() cleanup"
> > > and "ACPI PM: Remove obsolete Toshiba workaround").
> > 
> > What do you use to merge?
> 
> git, gitk and vi (and my eyes :-))
> 
> > Jesse pulled my suspend branch, so you should get the exact same commit 
> > id's for 3 patches in both his tree and mine.
> 
> they are not the same commits:
> "ACPI PM: acpi_pm_device_sleep_state() cleanup"
> 06166780eb53685e72b589814d535d1f9948e761	in the pci tree
> 0cc5ddb904162f611568d4db66ccd8af61dffc16	int the acpi tree
> "ACPI PM: Remove obsolete Toshiba workaround"
> 0e6859d49ff194e01afc229c996e3aefca1a0539	in the pci tree
> f7259bd5d588d59816e1f4d5d4f3da9382916dac	in the acpi tree
> 
> In the acpi tree (I pull the test branch into linux-next) the former has
> a different parent to the one on the pci tree since Jesse pulled your
> "suspend" branch into his pci tree.
> 
> So the git merge sees them as overlapping changes to the same file (as
> well as the other commit above) and generates a conflict.

Well, the commits will always be different, because they depend on the
previous commits and those are different in both trees.  The files they modify,
however, should be exactly the same finally.

I don't know how to handle that cleanly. :-(

Thanks,
Rafael
