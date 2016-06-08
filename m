From: Ben Greear <greearb-my8/4N5VtI7c+919tysfdA@public.gmane.org>
Subject: Re: [PATCH] Add .set_antenna callback in ath6kl driver to remove
 wireless core warns
Date: Wed, 8 Jun 2016 09:10:20 -0700
Message-ID: <5758436C.3000707@candelatech.com>
References: <1465388474-20503-1-git-send-email-prasunmaiti87@gmail.com>
 <87wplzkbd9.fsf@kamboji.qca.qualcomm.com>
 <CAEO8o4=DnEfXQAnAOxugC9TngbhvgV9DXz0HOVHNLk0B2fAXQA@mail.gmail.com>
 <87porrkaax.fsf@kamboji.qca.qualcomm.com>
 <CAEO8o4kD7MU09o+xOwPLn-PAgcuMExQ0MbNWgqv0fOs61rG8Xw@mail.gmail.com>
 <87d1nrk89v.fsf@kamboji.qca.qualcomm.com>
 <CAEO8o4=XEr4DQC3bqAXGE01s5WC+kuZ3PqoJFtuSCE52RNyDzA@mail.gmail.com>
 <57583EFC.3070901@candelatech.com>
 <CAEO8o4=a54o0qvQ7ynQW=tJ95OY0_BiNYPP-5uj5jozDLQCp4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEO8o4=a54o0qvQ7ynQW=tJ95OY0_BiNYPP-5uj5jozDLQCp4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Valo, Kalle" <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, Linux Next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ath6kl-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath6kl-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 06/08/2016 08:56 AM, Prasun Maiti wrote:
> Please help me how to test this one?? It will be great to me if you help me.

I do not have time or interest, sorry.  You basically need access to
firmware source to do any useful development on this driver in my opinion,
and I do not have access to that source.

Why are you so concerned about the warning anyway?

Thanks,
Ben

>
> On Wed, Jun 8, 2016 at 9:21 PM, Ben Greear <greearb-my8/4N5VtI7c+919tysfdA@public.gmane.org> wrote:
>> On 06/08/2016 08:46 AM, Prasun Maiti wrote:
>>>
>>> Please tell me if I mention that this code is untested in commit log,
>>> then could you check the code kindly and also help me to fix this type
>>> of warning?
>>
>>
>> In my experience, ath6kl has very fragile and buggy firmware, so I would
>> not add any new API to it unless you have tested this thoroughly.
>>
>> Thanks,
>> Ben
>>
>>>
>>> On Wed, Jun 8, 2016 at 9:00 PM, Valo, Kalle <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
>>> wrote:
>>>>
>>>> Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>>>
>>>>> I am not sure it works fine. Like ath6kl driver send another cmd to
>>>>> firmare, I have just filled up the cmd buffer with "tx_ant", and
>>>>> "rx_ant" values, then use "ath6kl_wmi_cmd_send()" api to send the cmd
>>>>> buffer to firmware. I have resend the patch as there are some errors
>>>>> in the previous patch. Let me know if any modifications are needed?
>>>>
>>>>
>>>> I don't take untested code. In some special cases it might be ok to send
>>>> untested code but even then it needs to be clearly stated in the commit
>>>> log that it's untested.
>>>>
>>>> Please resend once you have tested this, I'm dropping this now.
>>>>
>>>> --
>>>> Kalle Valo
>>>
>>>
>>>
>>>
>>
>>
>> --
>> Ben Greear <greearb-my8/4N5VtI7c+919tysfdA@public.gmane.org>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>
>
>


-- 
Ben Greear <greearb-my8/4N5VtI7c+919tysfdA@public.gmane.org>
Candela Technologies Inc  http://www.candelatech.com

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
