From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: manual merge of the printk tree with the asm-generic
 tree
Date: Thu, 15 Mar 2018 16:50:06 +0900
Message-ID: <20180315075006.GC3628@jagdpanzerIV>
References: <20180315114500.65daa865@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180315114500.65daa865@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Petr Mladek <pmladek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
List-Id: linux-next.vger.kernel.org

On (03/15/18 11:45), Stephen Rothwell wrote:
> Hi Petr,
> 
> Today's linux-next merge of the printk tree got a conflict in:
> 
>   arch/blackfin/kernel/dumpstack.c
> 
> between commit:
> 
>   e7e57f690e38 ("arch: remove blackfin port")
> 
> from the asm-generic tree and commit:
> 
>   33251b634b4a ("dump_stack: convert generic dump_stack into a weak symbol")
> 
> from the printk tree.

If blackfin is gone and nds32 was fixed then we can drop my patch.

	-ss
