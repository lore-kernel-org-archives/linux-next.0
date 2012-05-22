From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the mips
 tree
Date: Tue, 22 May 2012 11:01:18 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1205221101020.16396@pobox.suse.cz>
References: <20120522145041.67536df96e34135fd802fd2b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120522145041.67536df96e34135fd802fd2b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Crispin <blogic@openwrt.org>, Ralf Baechle <ralf@linux-mips.org>, Masanari Iida <standby24x7@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, 22 May 2012, Stephen Rothwell wrote:

> Hi Jiri,
> 
> Today's linux-next merge of the trivial tree got a conflict in
> arch/mips/pci/pci-lantiq.c between commit 57c8cb8f2429 ("MIPS: pci:
> convert lantiq driver to OF") from the mips tree and commit 6997991ab0db
> ("mips: Fix printk typos in arc/mips") from the trivial tree.
> 
> The former did the fix from the latter as a side effect so I used that.

I have dropped the hunk from trivial.git to avoid the unnecessary 
conflict, thanks.

-- 
Jiri Kosina
SUSE Labs
