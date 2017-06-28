From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build warning after merge of the libata tree
Date: Wed, 28 Jun 2017 14:28:41 -0400
Message-ID: <20170628182841.GA27503@htj.duckdns.org>
References: <20170628155117.5bfbf545@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170628155117.5bfbf545@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Minwoo Im <dn3108@gmail.com>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 28, 2017 at 03:51:17PM +1000, Stephen Rothwell wrote:
> Hi Tejun,
> 
> After merging the libata tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/ata/libata-scsi.c: In function 'ata_scsi_var_len_cdb_xlat':
> drivers/ata/libata-scsi.c:4194:1: warning: label 'unspprt_sa' defined but not used [-Wunused-label]
>  unspprt_sa:
>  ^
> 
> Introduced by commit
> 
>   b1ffbf854e08 ("libata: Support for an ATA PASS-THROUGH(32) command.")

Fixed up.  Sorry about that.

Thanks.

-- 
tejun
