From: Petr Mladek <pmladek@suse.com>
Subject: Re: linux-next: manual merge of the printk tree with Linus' tree
Date: Tue, 16 Jan 2018 11:38:11 +0100
Message-ID: <20180116103811.piwhyxokc27zcv2a@pathway.suse.cz>
References: <20180116092319.1575cac0@canb.auug.org.au>
 <20180116020409.GB6607@jagdpanzerIV>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180116020409.GB6607@jagdpanzerIV>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Tobin C. Harding" <me@tobin.cc>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

On Tue 2018-01-16 11:04:09, Sergey Senozhatsky wrote:
> On (01/16/18 09:23), Stephen Rothwell wrote:
> > Today's linux-next merge of the printk tree got a conflict in:
> > 
> >   scripts/checkpatch.pl
> > 
> > between commit:
> > 
> >   7b1924a1d930 ("vsprintf: add printk specifier %px")
> > 
> > from Linus' tree and commit:
> > 
> >   1df7338ac965 ("checkpatch: add pF/pf deprecation warning")
> > 
> > from the printk tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary.
> 
> looks correct to me. thanks.

Yup, it looks correct to me as well.

Best Regards,
Petr
