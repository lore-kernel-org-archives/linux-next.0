From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: linux-next: manual merge of the overlayfs tree with Linus' tree
Date: Mon, 19 Dec 2016 10:06:36 +0100
Message-ID: <CAJfpeguwvwy78-ahrswi5_RRENUzuSbqF2PR2x+nKxX1WC6h9Q@mail.gmail.com>
References: <20161219102555.15519eee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161219102555.15519eee@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Dec 19, 2016 at 12:25 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Miklos,
>
> Today's linux-next merge of the overlayfs tree got conflicts in:
>
>   fs/overlayfs/dir.c
>   fs/overlayfs/inode.c
>
> I am pretty sure thses conflicts only exist because the overlayfs tree
> was rebased before being merged by Linus.  I am dropping the oevrlay fs
> tree for today.  Please clean it up.

Hi Stephen,

Sorry, fixed now.

Thanks,
Miklos
