From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 9 Feb 2015 06:23:40 +0000
Message-ID: <20150209062340.GA10051@e102568-lin.cambridge.arm.com>
References: <20150209132642.0d61b6ed@canb.auug.org.au>
 <54D82111.9090003@linux.intel.com>
 <2611810.oabrJWIJSx@vostro.rjw.lan>
 <54D84747.10501@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54D84747.10501@linux.intel.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Jiang Liu <jiang.liu@linux.intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 09, 2015 at 05:36:07AM +0000, Jiang Liu wrote:
> Hi Rafael and Lorenzo,
> 	With more closer review, I suspect statement "kfree(bus_range)"
> in commit d2be00c0fb5a ("of/pci: Free resources on failure in
> of_pci_get_host_bridge_resources()") may cause double free of bus_range
> because bus_range will also be freed by kfree(window->res);

Gah, my bad, you are right, sorry I missed that. Please let me know
how you prefer fixing that, you could remove that line as part
of the merge commit, or I can send you a patch to apply on top of it,
it is a trivial one-line removal.

Thanks,
Lorenzo

> Regards!
> Gerry
> 
> On 2015/2/9 11:22, Rafael J. Wysocki wrote:
> > On Monday, February 09, 2015 10:53:05 AM Jiang Liu wrote:
> >>
> >> On 2015/2/9 10:26, Stephen Rothwell wrote:
> >>> Hi Rafael,
> > 
> > [cut]
> > 
> >>>                ^
> >>>
> >>> Caused by commit 14d76b68f281 ("PCI: Use common resource list
> >>> management code instead of private implementation") interacting with
> >>> commit d2be00c0fb5a ("of/pci: Free resources on failure in
> >>> of_pci_get_host_bridge_resources()") from the pci tree.
> >>>
> >>> I applied the following merge fix patch (which may need more work?).
> >> Hi Stephen,
> >> 	Thanks for fixing it and there should no more work needed.
> > 
> > Can you please have a look at my linux-next branch now and see if the code
> > is correct in there as well?
> > 
> > Rafael
> > 
> 
