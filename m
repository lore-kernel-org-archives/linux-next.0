From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: managing a web of git trees
Date: Fri, 13 Jun 2008 08:49:44 -0700
Message-ID: <200806130849.45269.jbarnes@virtuousgeek.org>
References: <20080613145357.1ea9f643.sfr@canb.auug.org.au> <20080613160201.ac0ffd5f.sfr@canb.auug.org.au> <200806131045.45769.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-142.bluehost.com ([67.222.38.32]:53735 "HELO
	outbound-mail-142.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1756677AbYFMPuC (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 11:50:02 -0400
In-Reply-To: <200806131045.45769.rjw@sisk.pl>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

On Friday, June 13, 2008 1:45 am Rafael J. Wysocki wrote:
> > they are not the same commits:
> > "ACPI PM: acpi_pm_device_sleep_state() cleanup"
> > 06166780eb53685e72b589814d535d1f9948e761	in the pci tree
> > 0cc5ddb904162f611568d4db66ccd8af61dffc16	int the acpi tree
> > "ACPI PM: Remove obsolete Toshiba workaround"
> > 0e6859d49ff194e01afc229c996e3aefca1a0539	in the pci tree
> > f7259bd5d588d59816e1f4d5d4f3da9382916dac	in the acpi tree
> >
> > In the acpi tree (I pull the test branch into linux-next) the former has
> > a different parent to the one on the pci tree since Jesse pulled your
> > "suspend" branch into his pci tree.
> >
> > So the git merge sees them as overlapping changes to the same file (as
> > well as the other commit above) and generates a conflict.
>
> Well, the commits will always be different, because they depend on the
> previous commits and those are different in both trees.  The files they
> modify, however, should be exactly the same finally.
>
> I don't know how to handle that cleanly. :-(

Yuck, I thought they'd retain the same commit ids for some reason.  OTOH if 
the content is the same, resolving the conflicts should be trivial (git might 
even do it automatically at merge time if it's identical?).

Linus, do you have any suggestions for this case?  We've been trying to pull 
different trees together to make merging & management easier, but it's not 
working as smoothly as we'd like.  My pull of Ingo's PCI changes worked 
pretty well (after merging his branch all the identical commits ended up the 
same), but my pull of Len's suspend branch didn't work that way...

Thanks,
Jesse
