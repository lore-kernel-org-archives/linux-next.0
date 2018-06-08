From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2018-06-07-16-59 uploaded (scsi/ipr)
Date: Thu, 7 Jun 2018 18:15:19 -0700
Message-ID: <656ccc09-951c-4b74-05a0-bc6f510a6453@infradead.org>
References: <20180607235947.xWQtg%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180607235947.xWQtg%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 06/07/2018 04:59 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2018-06-07-16-59 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 

on i386 (randconfig):

../drivers/scsi/ipr.c: In function 'ipr_mask_and_clear_interrupts':
../drivers/scsi/ipr.c:767:3: error: implicit declaration of function 'writeq_relaxed' [-Werror=implicit-function-declaration]
   writeq_relaxed(~0, ioa_cfg->regs.set_interrupt_mask_reg);
   ^



need config?
-- 
~Randy
