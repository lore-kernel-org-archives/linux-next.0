From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: linux-next: build warning after merge of the printk tree
Date: Tue, 10 Jul 2018 22:15:47 +0900
Message-ID: <20180710131547.GA526@tigerII.localdomain>
References: <20180710164514.22c552db@canb.auug.org.au>
 <CGME20180710064527epcas1p16fd9ad765711d69264b3251890bbcc2e@epcms5p5>
 <2014348883.271177.1531206974788.JavaMail.jboss@ep1ml503>
 <20180710091909.rwgtahcew6grhd6n@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180710091909.rwgtahcew6grhd6n@pathway.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: Maninder Singh <maninder1.s@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vaneet Narang <v.narang@samsung.com>, PANKAJ MISHRA <pankaj.m@samsung.com>
List-Id: linux-next.vger.kernel.org

On (07/10/18 11:19), Petr Mladek wrote:
> suppress_message_printing() is not longer called in console_unlock().
> Therefore it is not longer needed with disabled CONFIG_PRINTK.
> 
> This fixes the warning:
> 
> kernel/printk/printk.c:2033:13: warning: ‘suppress_message_printing’ defined but not used [-Wunused-function]
>  static bool suppress_message_printing(int level) { return false; }
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Suggested-by: Maninder Singh <maninder1.s@samsung.com>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Acked-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>


Happens all the time to me as well. I'd rather remove CONFIG_PRINTK
at this point ;)


	-ss
