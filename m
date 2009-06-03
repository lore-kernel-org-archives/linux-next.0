From: Matthew Garrett <mjg@redhat.com>
Subject: Re: linux-next: manual merge of the wireless tree with the acpi
	tree
Date: Wed, 3 Jun 2009 04:05:41 +0100
Message-ID: <20090603030541.GC28009@srcf.ucam.org>
References: <20090603122724.ddf679ba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:45598 "EHLO
	vavatch.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752530AbZFCDFm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2009 23:05:42 -0400
Content-Disposition: inline
In-Reply-To: <20090603122724.ddf679ba.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Len Brown <lenb@kernel.org>

Easiest in this case might be to drop the toshiba-acpi patches from me 
from acpi-test for the moment - I'm still waiting for some testing 
feedback on them. I can rebase against the rfkill code as long as it 
lands early enough.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
