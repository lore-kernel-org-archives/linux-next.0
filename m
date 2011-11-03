From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: build failure after merge of the pci-current tree
Date: Wed, 2 Nov 2011 19:04:36 -0700
Message-ID: <20111102190436.5b4c805a@jbarnes-desktop>
References: <20111103125325.c1e20275e3a68498465b5ddf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111103125325.c1e20275e3a68498465b5ddf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>
List-Id: linux-next.vger.kernel.org

On Thu, 3 Nov 2011 12:53:25 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> After merging the pci-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/pci/ats.c:13:26: fatal error: linux/export.h: No such file or directory
> 
> Caused by commit 571eba1b8aa9 ("PCI: Fix compile errors with PCI_ATS and !
> PCI_IOV").
> 
> You didn't build this, right? :-(  linux/export.h does not yet exist in
> Linus' tree ...  I have used the pci-current tree from next-20111102 for
> today.

Oh I thought Randy said this stuff was in -next already...  Sorry for
the trouble.

-- 
Jesse Barnes, Intel Open Source Technology Center
