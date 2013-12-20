From: Frank Haverkamp <haver@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] GenWQE: Fix endian issues detected by sparse
Date: Fri, 20 Dec 2013 20:12:53 +0100
Message-ID: <1387566773.1847.28.camel@oc7383187364.ibm.com>
References: <CA+r1Zhimt7Xusnc4kkkVqfoRhfZRnreMmZqaN7WP7rSpZ3XTvw@mail.gmail.com>
	 <1387553171-31469-1-git-send-email-haver@linux.vnet.ibm.com>
Reply-To: haver@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387553171-31469-1-git-send-email-haver@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: fengguang.wu@intel.com
Cc: jim.epost@gmail.com, sfr@canb.auug.org.au, gregkh@linuxfoundation.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kbuild-all@01.org
List-Id: linux-next.vger.kernel.org

Hi Greg,

Am Freitag, den 20.12.2013, 16:26 +0100 schrieb Frank Haverkamp:
> +++ b/drivers/misc/genwqe/card_utils.c
> @@ -59,7 +59,7 @@ int __genwqe_writeq(struct genwqe_dev *c
>         if (cd->mmio == NULL)
>                 return -EIO;
> 
> -       __raw_writeq(cpu_to_be64((val)), (cd->mmio + byte_offs));
> +       __raw_writeq((__force u32)cpu_to_be64(val), cd->mmio +
> byte_offs);

what a pity. I introduced here a wrong cast to u32 and not to u64 what
it should have been. I will send a fix, once I have tried it out.

Regards

Frank
