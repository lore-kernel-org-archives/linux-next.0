From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 09 Feb 2015 16:10:36 +0100
Message-ID: <2023771.7SV6akbkpr@vostro.rjw.lan>
References: <20150209132642.0d61b6ed@canb.auug.org.au> <54D84747.10501@linux.intel.com> <20150209062340.GA10051@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:62207 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1760497AbbBIOre (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Feb 2015 09:47:34 -0500
In-Reply-To: <20150209062340.GA10051@e102568-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Monday, February 09, 2015 06:23:40 AM Lorenzo Pieralisi wrote:
> On Mon, Feb 09, 2015 at 05:36:07AM +0000, Jiang Liu wrote:
> > Hi Rafael and Lorenzo,
> > 	With more closer review, I suspect statement "kfree(bus_range)"
> > in commit d2be00c0fb5a ("of/pci: Free resources on failure in
> > of_pci_get_host_bridge_resources()") may cause double free of bus_range
> > because bus_range will also be freed by kfree(window->res);
> 
> Gah, my bad, you are right, sorry I missed that. Please let me know
> how you prefer fixing that, you could remove that line as part
> of the merge commit, or I can send you a patch to apply on top of it,
> it is a trivial one-line removal.

I re-did the merge.

Please have a look at my linux-next branch again and let me know if that's OK
with everybody.


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
