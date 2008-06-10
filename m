From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci/kbuild-current merge conflict
Date: Mon, 9 Jun 2008 22:53:54 -0700
Message-ID: <200806092253.54654.jbarnes@virtuousgeek.org>
References: <20080610143434.9cec3775.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-108.bluehost.com ([69.89.22.8]:54455 "HELO
	outbound-mail-108.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751507AbYFJFyV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 01:54:21 -0400
In-Reply-To: <20080610143434.9cec3775.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shaohua Li <shaohua.li@intel.com>, Sebastian Siewior <bigeasy@linutronix.de>, linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Sam Ravnborg <sam@ravnborg.org>

On Monday, June 09, 2008 9:34 pm Stephen Rothwell wrote:
> Hi Jesse,
>
> Today's linux-next merge of the pci tree got a trivial merge conflict in
> include/asm-generic/vmlinux.lds.h between commit
> f1cb2ba8ca4a8b4b76bbf0b795375af52442501b ("generic: add
> OUTPUT_DATA_SECTION to vmlinux.lds.h") from the kbuild-current tree and
> commit 638d515d37e4cfc9af9d8672f9668324b7b6600d ("Suspend/Resume bug in
> PCI layer wrt quirks") from the pci tree.
>
> I did the obvious fixup.
>
> This can be fixed by you merging Linus' tree into the pci tree sometime
> after he takes the kbuild patch.  No real urgency, though.
>
> It is interesting that the pci patch is authored by Rafael, but has no
> Signed-off-by from him.

Ok, I'll try to fix that up tomorrow.  I've been meaning to pull in Linus' 
latest bits for awhile anyway...  Thanks for the heads up.

Jesse
