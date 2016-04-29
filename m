From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 29 Apr 2016 16:55:00 +1000
Message-ID: <20160429165500.0148ec5d@canb.auug.org.au>
References: <20160429164543.039df436@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160429164543.039df436@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Quinn Tran <quinn.tran@qlogic.com>
List-Id: linux-next.vger.kernel.org

Hi All,

On Fri, 29 Apr 2016 16:45:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/scsi/ipr.c: In function 'ipr_show_device_id':
> drivers/scsi/ipr.c:4462:34: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
>    len = snprintf(buf, PAGE_SIZE, "0x%llx\n", be64_to_cpu(res->dev_id));
>                                   ^
> 
> Lots and lots like this :-(
> 
> Introduced by commit
> 
>   eef17fb79096 ("byteswap: try to avoid __builtin_constant_p gcc bug")
> 
> I guess __builtin_bswap64() has type "unsigned long int" :-(

So, I have reverted that commit for today ... it produces too many
warnings :-(

-- 
Cheers,
Stephen Rothwell
