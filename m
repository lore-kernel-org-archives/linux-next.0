From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
Date: Mon, 26 Nov 2018 08:56:11 +0100
Message-ID: <20181126075611.GA799@lst.de>
References: <20181126110629.45969c51@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181126110629.45969c51@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Sterba <dsterba@suse.cz>, Kees Cook <keescook@google.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 26, 2018 at 11:06:29AM +1100, Stephen Rothwell wrote:
> Introduced by commit
> 
>   cf8cddd38bab3 ("btrfs: don't abuse REQ_OP_* flags for btrfs_map_block")
> 
> exposed by my new use of -Wimplicit-fallthrough
> 
> I am not sure why this has only turned up now (as opposed to earlier
> today).

It looks like something only in linux-next moved the code around a bit.

Either way the fallthough looks fine, it will just need a little
/*FALLTHRU*/ annotation.
