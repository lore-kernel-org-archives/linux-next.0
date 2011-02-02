From: NeilBrown <neilb@suse.de>
Subject: Re: linux-next: build failure after merge of the md-current tree
Date: Wed, 2 Feb 2011 11:58:13 +1100
Message-ID: <20110202115813.1ee7ab4d@notabene.brown>
References: <20110202112519.7a4d2bd3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110202112519.7a4d2bd3.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 2 Feb 2011 11:25:19 +1100 Stephen Rothwell <sfr@canb.auug.org.au>
wrote:

> Hi Neil,
> 
> After merging the md-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/md/md.c: In function 'slot_store':
> drivers/md/md.c:2466: error: 'mddev' undeclared (first use in this function)
> 
> Caused by commit 778f14598b2924e92790ddd8a167424d2894ffb0 ("md: Don't
> allow slot_store while resync/recovery is happening").
> 
> Please build test your tree before publishing it.
> 
> I have used the md-current tree from next-20110201 for today.
> 

Ouch... I blame the heat!!

Fix now, thanks.

NeilBrown
