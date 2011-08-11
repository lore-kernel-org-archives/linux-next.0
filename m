From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: linux-next: build failure after merge of the final tree (wireless
 & staging trees related)
Date: Thu, 11 Aug 2011 18:50:57 +0300
Message-ID: <4E43FA61.1010301@qca.qualcomm.com>
References: <20110811155529.e5f47afa0504c4ddef58ab37@canb.auug.org.au> <4E438D56.5020801@qca.qualcomm.com> <20110811141604.GA14763@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110811141604.GA14763-l3A5Bk7waGM@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vasanthakumar Thiagarajan <vthiagar-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, Raja Mani <rmani-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 08/11/2011 05:16 PM, Greg KH wrote:
> On Thu, Aug 11, 2011 at 11:05:42AM +0300, Kalle Valo wrote:
>
>> Yes, the cleaned up version of ath6kl is now in wireless-next and the
>> staging version can be removed in 3.2. Greg, how do you want to handle
>> removal of the staging version? Should I send a patch to you removing
>> it? Or should I send the patch to John?
> 
> Just tell me.  Should I really delete drivers/staging/ath6kl/ for the
> 3.2 kernel release?  If so, I'll gladly do so in my tree so linux-next
> will be fine for issues like this in the future.

Yes, please delete ath6kl from staging for the 3.2 release as the
cleanup version is now in wireless-next.

Thank you everyone and sorry for the mess.

Kalle
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
