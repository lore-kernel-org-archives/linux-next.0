From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: manual merge of the printk tree with Linus' tree
Date: Tue, 16 Jan 2018 11:04:09 +0900
Message-ID: <20180116020409.GB6607@jagdpanzerIV>
References: <20180116092319.1575cac0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180116092319.1575cac0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Petr Mladek <pmladek@suse.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Tobin C. Harding" <me@tobin.cc>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

On (01/16/18 09:23), Stephen Rothwell wrote:
> Today's linux-next merge of the printk tree got a conflict in:
> 
>   scripts/checkpatch.pl
> 
> between commit:
> 
>   7b1924a1d930 ("vsprintf: add printk specifier %px")
> 
> from Linus' tree and commit:
> 
>   1df7338ac965 ("checkpatch: add pF/pf deprecation warning")
> 
> from the printk tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

looks correct to me. thanks.

	-ss

> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc scripts/checkpatch.pl
> index 31031f10fe56,0bb68e7ff173..000000000000
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@@ -5753,7 -5753,7 +5753,7 @@@ sub process 
>   		        for (my $count = $linenr; $count <= $lc; $count++) {
>   				my $fmt = get_quoted_string($lines[$count - 1], raw_line($count, 0));
>   				$fmt =~ s/%%//g;
> - 				if ($fmt =~ /(\%[\*\d\.]*p(?![\WFfSsBKRraEhMmIiUDdgVCbGNOx]).)/) {
>  -				if ($fmt =~ /(\%[\*\d\.]*p(?![\WSsBKRraEhMmIiUDdgVCbGNO]).)/) {
> ++				if ($fmt =~ /(\%[\*\d\.]*p(?![\WSsBKRraEhMmIiUDdgVCbGNOx]).)/) {
>   					$bad_extension = $1;
>   					last;
>   				}
> 
