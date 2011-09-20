From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the kernel-doc
 tree
Date: Tue, 20 Sep 2011 15:04:45 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1109201504040.13109@pobox.suse.cz>
References: <20110919163946.9165592b447bf5b578146f83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110919163946.9165592b447bf5b578146f83@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amos Kong <kongjianjun@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, Paul Bolle <pebolle@tiscali.nl>
List-Id: linux-next.vger.kernel.org

On Mon, 19 Sep 2011, Stephen Rothwell wrote:

> Today's linux-next merge of the trivial tree got a conflict in
> Documentation/PCI/pci.txt between commit b814f0357fbe
> ("Documentation/PCI/pci.txt: fix a reference doc name") from the
> kernel-doc tree and commit c460578a674f ("Documentation: fix broken
> references") from the trivial tree.
> 
> It looks like the former supercedes the latter, so I used that.

I don't know where to get either linux-next or linux-doc at the moment, so 
just correct me if I am wrong -- I will just drop the 
Documentation/PCI/pci.txt hunk from c460578a674f in my tree, right?

Thanks,

-- 
Jiri Kosina
SUSE Labs
