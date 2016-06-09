From: Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add .set_antenna callback in ath6kl driver to remove
 wireless core warns
Date: Thu, 9 Jun 2016 10:34:12 +0530
Message-ID: <CAEO8o4kxbFm5sGk0FBUAYDsjmvMW7pwO1b4=E7sLyrYeqXT00A@mail.gmail.com>
References: <1465388474-20503-1-git-send-email-prasunmaiti87@gmail.com>
 <87wplzkbd9.fsf@kamboji.qca.qualcomm.com> <CAEO8o4=DnEfXQAnAOxugC9TngbhvgV9DXz0HOVHNLk0B2fAXQA@mail.gmail.com>
 <87porrkaax.fsf@kamboji.qca.qualcomm.com> <CAEO8o4kD7MU09o+xOwPLn-PAgcuMExQ0MbNWgqv0fOs61rG8Xw@mail.gmail.com>
 <CAGRGNgV4sL2TypkR+zsaDHN26KCF0kjtWPsi9y9D_JkGpvWrUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGRGNgV4sL2TypkR+zsaDHN26KCF0kjtWPsi9y9D_JkGpvWrUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Valo, Kalle" <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ath6kl-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath6kl-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Hello Julian,

It was an assumption on my part that the firmware supports a SET
function. I realize it was premature to do so. I am sending another
patch to convert the ath6kl_set_antenna() to a NO-OP. This will take
care of the kernel warning, but would not fire any commands to
firmware. I hope this solution is acceptable.

Thanks,
Prasun

On Thu, Jun 9, 2016 at 5:35 AM, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Prasun,
>
> On Thu, Jun 9, 2016 at 1:20 AM, Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> I am not sure it works fine. Like ath6kl driver send another cmd to
>> firmare, I have just filled up the cmd buffer with "tx_ant", and
>> "rx_ant" values, then use "ath6kl_wmi_cmd_send()" api to send the cmd
>> buffer to firmware.
>> I have resend the patch as there are some errors in the previous patch.
>> Let me know if any modifications are needed?
>
> Let me ask the question in another way: how do you know that the
> command WMI_SET_ANTENNA_CMDID exists, has that number, takes arguments
> in that format and works?
>
> Thanks,
>
> Julian Calaby
>
>
>> On Wed, Jun 8, 2016 at 8:16 PM, Valo, Kalle <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org> wrote:
>>> Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>>
>>>> No. I did not any test for that case.
>>>> This driver create a new wiphy for use with cfg80211 through
>>>> "wiphy_new_nm" api, but in this api, I found that more warnings for
>>>> inconsistent ops are added there. e.g; "WARN_ON(ops->set_antenna &&
>>>> !ops->get_antenna);"
>>>> So, warning comes during creation of a new wiphy. That's why It is needed.
>>>
>>> I'm confused. Are you really saying that you added a new firmware
>>> command (WMI_SET_ANTENNA_CMDID) to ath6kl but you didn't test it in any
>>> way? How do you know that it works then?
>>>
>>> --
>>> Kalle Valo
>>
>>
>>
>> --
>> Thanks,
>> Prasun
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Julian Calaby
>
> Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Profile: http://www.google.com/profiles/julian.calaby/



-- 
Thanks,
Prasun
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
