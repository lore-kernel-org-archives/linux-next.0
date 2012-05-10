From: Kay Sievers <kay@vrfy.org>
Subject: Re: Regression due to 7ff9554 "printk: convert byte-buffer to
 variable-length record buffer"
Date: Thu, 10 May 2012 22:15:14 +0200
Message-ID: <CAPXgP10510MCgro77-sOVjvvooa5J5=0c_FR1-QbuN9smLdBPw@mail.gmail.com>
References: <4FAAB815.5040001@wwwdotorg.org> <4FAC1D09.1070004@wwwdotorg.org>
 <CAPXgP11UqAZgfWXUrxi7VsYr_hoDgi=cP4yn5UJ5rdPU8i5_sA@mail.gmail.com>
 <4FAC2085.7030002@wwwdotorg.org> <4FAC2150.2060804@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FAC2150.2060804@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, William Douglas <william.douglas@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, May 10, 2012 at 10:13 PM, Stephen Warren <swarren@wwwdotorg.org=
> wrote:
> On 05/10/2012 02:09 PM, Stephen Warren wrote:
>> On 05/10/2012 02:06 PM, Kay Sievers wrote:
>>> On Thu, May 10, 2012 at 9:54 PM, Stephen Warren <swarren@wwwdotorg.=
org> wrote:
>>>> On 05/09/2012 12:31 PM, Stephen Warren wrote:
>>>>> For me, next-20120508 prints nothing when booted, and I think als=
o
>>>>> hangs. To solve this, I reverted:
>>>>>
>>>>> 7ff9554 printk: convert byte-buffer to variable-length record buf=
fer
>>>>>
>>>>> In order to build, I also had to revert:
>>>>>
>>>>> c4e00da driver-core: extend dev_printk() to pass structured data
>>>>>
>>>>> Note: I'm running on an ARM system using a serial console, with
>>>>> earlyprintk enabled.
>>>>
>>>> This issue still occurs in next-20120510.
>>>>
>>>> I've tracked it down to the assignment of msg->ts_nsec near the en=
d of
>>>> log_store(). If I comment this out, everything works. The problem =
is the
>>>> assignment, not the call to local_clock():
>>>>
>>>> fails:
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0msg->ts_nsec =3D local_clock();
>>>> fails:
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0msg->ts_nsec =3D 0;//local_clock();
>>>> works:
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0//msg->ts_nsec =3D local_clock();
>>>
>>> Weird.
>>>
>>> What happens if you change it to:
>>> =C2=A0 cpu_clock(logbuf_cpu);
>>> ?
>>>
>>> If it works, the timestamps look ok?
>>
>> I doubt that would work - after all, assigning 0 fails, but not
>> performing the assignment at all works. But, I'll go try it...
>
> Calling cpu_clock() instead of local_clock() fails in the same way.

Ok, didn't really see the assign to 0 you tried, sorry. :)

And 'dmesg' works when you run the box with the line commented out?

And 'cat /dev/kmsg'?

Kay
