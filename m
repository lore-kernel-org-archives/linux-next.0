From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the akpm tree with the rr tree
Date: Mon, 14 May 2012 10:59:34 +0930
Message-ID: <877gwfv9c1.fsf@rustcorp.com.au>
References: <20120510185155.47d24f37951786b64af97868@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120510185155.47d24f37951786b64af97868@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Thu, 10 May 2012 18:51:55 +1000, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got conflicts in
> kernel/lglock.c, include/linux/lglock.h, fs/namespace.c and fs/internal.h
> between various commits from the rr tree and commit "brlocks/lglocks:
> cleanups" from the akpm tree.
> 
> The akpm tree patch seems to be a merge of the rr tree commits, so I
> dropped the akpm tree patch.

Al said he'd take them, so I dropped mine now too.

Thanks,
Rusty.
