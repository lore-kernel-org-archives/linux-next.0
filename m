From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Subject: Re: mmotm 2011-08-24-14-08 uploaded
Date: Thu, 25 Aug 2011 16:13:07 +0900
Message-ID: <20110825161307.7c921e46.kamezawa.hiroyu@jp.fujitsu.com>
References: <201108242148.p7OLm1lt009191@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <201108242148.p7OLm1lt009191@imap1.linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 24 Aug 2011 14:09:05 -0700
akpm@linux-foundation.org wrote:

> The mm-of-the-moment snapshot 2011-08-24-14-08 has been uploaded to
> 
>    http://userweb.kernel.org/~akpm/mmotm/
> 
> It contains the following patches against 3.1-rc3:
> (patches marked "*" will be included in linux-next)
> 

just reporting.

A compile error from linux-next.patch.

drivers/built-in.o: In function `dwc3_testmode_open':
/home/kamezawa/Kernel/mmotm-Aug24/drivers/usb/dwc3/debugfs.c:481: undefined reference to `dwc3_send_gadget_ep_cmd'
/home/kamezawa/Kernel/mmotm-Aug24/drivers/usb/dwc3/debugfs.c:482: undefined reference to `dwc3_send_gadget_ep_cmd'
make: *** [.tmp_vmlinux1] Error 

Thanks,
-Kame

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
