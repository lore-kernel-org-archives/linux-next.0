From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: linux-next: build failure after merge of the final tree (wireless
 & staging trees related)
Date: Fri, 12 Aug 2011 22:24:35 +0300
Message-ID: <4E457DF3.4020808@qca.qualcomm.com>
References: <20110811155529.e5f47afa0504c4ddef58ab37@canb.auug.org.au> <4E438D56.5020801@qca.qualcomm.com> <20110811141604.GA14763@suse.de> <4E43FA61.1010301@qca.qualcomm.com> <20110812121216.28e6979b44bacb651849640b@canb.auug.org.au> <20110812135101.GA2286@tuxdriver.com> <4E453502.4000401@qca.qualcomm.com> <20110812173255.GE14182@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110812173255.GE14182-l3A5Bk7waGM@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vasanthakumar Thiagarajan <vthiagar-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, Raja Mani <rmani-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 08/12/2011 08:32 PM, Greg KH wrote:
> On Fri, Aug 12, 2011 at 05:13:22PM +0300, Kalle Valo wrote:
>> On 08/12/2011 04:51 PM, John W. Linville wrote:
>>> On Fri, Aug 12, 2011 at 12:12:16PM +1000, Stephen Rothwell wrote:
>>>> On Thu, 11 Aug 2011 18:50:57 +0300 Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org> wrote:
>>>>>
>>>>> Yes, please delete ath6kl from staging for the 3.2 release as the
>>>>> cleanup version is now in wireless-next.
>>>>>
>>>>> Thank you everyone and sorry for the mess.
>>>>
>>>> I think that the removal should be done in the wirelesss tree so that
>>>> Linus' tree is not broken during the next merge window.
>>>>
>>>> I have added the removal patch as a merge fixup one the merge of the
>>>> wireless tree for today.
>>>
>>> Makes sense to me -- probably also is more sane if there is some fool
>>> out there relying on the ath6kl driver in staging that doesn't know
>>> about the switch to the wireless tree.
>>
>> Ok, I'll send a patch to John which removes the staging driver.
> 
> Ok, that is fine with me as well.

Stephen&Greg: sorry, I accidentally sent you a 1.8 MB patch. I didn't
look at the size of the patch at all until I started to wonder why I
don't see it on linux-wireless. Man that driver was huge!

John, please take the patch from master.kernel.org:

/pub/linux/kernel/people/kvalo/ath6kl/staging-remove-ath6kl.patch

It will be available via HTTP once the mirrors have synced up:

http://www.kernel.org/pub/linux/kernel/people/kvalo/ath6kl/staging-remove-ath6kl.patch

Kalle
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
