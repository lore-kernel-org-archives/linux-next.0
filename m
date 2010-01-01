From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: origin tree build warning
Date: Thu, 31 Dec 2009 16:34:37 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0912311634110.3630@localhost.localdomain>
References: <20100101112914.41bc5f77.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:43509 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751355Ab0AAAfC (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2009 19:35:02 -0500
In-Reply-To: <20100101112914.41bc5f77.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>



On Fri, 1 Jan 2010, Stephen Rothwell wrote:
> 
> Today's linux-next build (powerpc allnoconfig) produced this warning:
> 
> drivers/pci/quirks.c: In function 'pci_dev_specific_reset':
> drivers/pci/quirks.c:2699: warning: assignment discards qualifiers from pointer target type
> 
> Introduced by commit 5b889bf237fca383b5807ad69fde3ad1e2287e42 ("PCI: Fix
> build if quirks are not enabled").

Does this trivial patch get rid of it?

		Linus
---
 drivers/pci/quirks.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 5c449fc..c746943 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2694,7 +2694,7 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
 
 int pci_dev_specific_reset(struct pci_dev *dev, int probe)
 {
-	struct pci_dev_reset_methods *i;
+	const struct pci_dev_reset_methods *i;
 
 	for (i = pci_dev_reset_methods; i->reset; i++) {
 		if ((i->vendor == dev->vendor ||
