From: Boaz Harrosh <bharrosh@panasas.com>
Subject: Re: linux-next: manual merge of the osd tree with the nfs tree
Date: Sun, 12 Aug 2012 18:13:58 +0300
Message-ID: <5027C836.4070904@panasas.com>
References: <20120809100328.b8d6af3b95e1537ffcb7b053@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120809100328.b8d6af3b95e1537ffcb7b053@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Trond Myklebust <trond.myklebust@fys.uio.no>
List-Id: linux-next.vger.kernel.org

On 08/09/2012 03:03 AM, Stephen Rothwell wrote:

> Hi Boaz,
> 
> Today's linux-next merge of the osd tree got a conflict in
> fs/nfs/nfs4proc.c between commit 47fbf7976e0b ("NFSv4.1: Remove a bogus
> BUG_ON() in nfs4_layoutreturn_done") from the nfs tree and commit
> d8e8b68405db ("pnfs: Don't BUG on info received from Server") from the
> osd tree.
> 
> I just used the nfs tree version.


Sorry, was on vacation will fix right now. Your fix was correct

Thanks
Boaz
