From: "Gustavo A. R. Silva" <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
Subject: Re: linux-next: build warnings after merge of the
 wireless-drivers-next tree
Date: Mon, 3 Dec 2018 09:15:23 -0600
Message-ID: <8c9a4e83-35c9-6078-8b15-f1b7895c8923@embeddedor.com>
References: <20181130120555.1d35eb6b@canb.auug.org.au>
 <87lg5b5glw.fsf@kamboji.qca.qualcomm.com>
 <20181130165006.60b2545f@canb.auug.org.au>
 <87h8fz57ty.fsf@kamboji.qca.qualcomm.com>
 <1773a3329bcd1bde2a22c267e4c582b0149a307e.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1773a3329bcd1bde2a22c267e4c582b0149a307e.camel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Luciano Coelho <luciano.coelho-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sara Sharon <sara.sharon-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kees Cook <keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-next.vger.kernel.org



On 12/3/18 6:38 AM, Luciano Coelho wrote:
> On Fri, 2018-11-30 at 09:43 +0200, Kalle Valo wrote:
>> Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> writes:
>>
>>> Hi Kalle,
>>>
>>> On Fri, 30 Nov 2018 06:33:47 +0200 Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
>>>> wrote:
>>>> I take it that -Wimplict-fallthrough is not enabled by default
>>>> yet? So
>>>> Dave and Linus won't see these warnings?
>>>
>>> Correct.
>>>
>>>> What I'm planning is to send a pull request to Dave today and fix
>>>> these
>>>> warnings in the next pull request. Does that sound good?
>>>
>>> That sounds fine.
>>
>> Great, thanks for the confirmation. I'll then send the pull request
>> today.
> 
> Just FYI, I enabled this by default in our internal tree so we will
> notice when it happens before sending the patch upstream.
> 

That's really great.

Thanks, Luca
--
Gustavo
