From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
Date: Tue, 13 Oct 2009 17:38:42 -0700
Message-ID: <20091013173842.3c926b0c@jbarnes-g45>
References: <20091014110532.f543b915.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-11.bluehost.com ([69.89.18.111]:60499 "HELO
	outbound-mail-11.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751296AbZJNAjn (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Oct 2009 20:39:43 -0400
In-Reply-To: <20091014110532.f543b915.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Woodhouse <David.Woodhouse@intel.com>, Tejun Heo <tj@kernel.org>

On Wed, 14 Oct 2009 11:05:32 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> Today's linux-next merge of the pci tree got a conflict in
> drivers/pci/pci.c between commit
> 8d86fb2c80ec376b35ae64ac858d406ae1d42a3f ("Rename pci_init() to
> pci_apply_final_quirks(), move it to quirks.c") from Linus' tree and
> commit b20dd110d21aac94b3f4063cffbcf9718656ce51 ("PCI: determine CLS
> more intelligently") from the pci tree.
> 
> I fixed it up by removing the bits of pci_init() that had been moved
> and leaving the newly added bits where they are.  Hopefully this will
> be ok since the moved bits are actually run earlier now.  Obviously,
> there is probably a better fix ...

Ah, thanks.  I'll check it out and update my linux-next branch.

-- 
Jesse Barnes, Intel Open Source Technology Center
