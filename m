From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: linux-next: manual merge of the pm tree with the pci tree
Date: Wed, 11 Feb 2015 02:05:50 +0000
Message-ID: <20150211020550.GA27432@e102568-lin.cambridge.arm.com>
References: <20150211120755.50217078@canb.auug.org.au>
 <1544592.4ITKEDgnAg@vostro.rjw.lan>
 <4805506.yPQhhiqbXU@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4805506.yPQhhiqbXU@vostro.rjw.lan>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Rafael,

On Wed, Feb 11, 2015 at 02:03:49AM +0000, Rafael J. Wysocki wrote:
> On Wednesday, February 11, 2015 02:41:35 AM Rafael J. Wysocki wrote:
> > On Wednesday, February 11, 2015 12:07:55 PM Stephen Rothwell wrote:
> > > Hi Rafael,
> > > 
> > > Today's linux-next merge of the pm tree got a conflict in
> > > drivers/of/of_pci.c between commit d2be00c0fb5a ("of/pci: Free
> > > resources on failure in of_pci_get_host_bridge_resources()") from the
> > > pci tree and commit 5c493df25a0d ("Merge branch 'pci/host-generic' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci into
> > > acpi-resources") from the pm tree.
> > > 
> > > I fixed it up (I just use the latter version, please check when it
> > > comes out) and can carry the fix as necessary (no action is required,
> > > though someone might want to tell Linus how to resolve it - including
> > > the removal of the "kfree(bus_range);").
> > 
> > Sorry, I messed this up.  The commit that supposed to be a merge ended
> > up as a non-merge commit in my tree, just because I tried to modify
> > the changelog of it without doing the merge again.
> > 
> > Then, I should have noticed that when I was putting together the pull request
> > for Linus earlier today, but then I didn't.
> 
> Linus merged my tree and the PCI one already, but his conflict resolution
> didn't remove the kfree(bus_range); line, so it looks like we'll need a
> separate patch removing it.
> 
> Lorenzo, will you send it or should I prepare one?

I will send the patch myself sorry for the churn.

Thank you,
Lorenzo
