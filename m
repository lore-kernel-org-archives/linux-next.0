From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 3
Date: Fri, 04 Oct 2013 06:44:56 -0700
Message-ID: <524EC658.90706@roeck-us.net>
References: <20131004010230.GI27287@sirena.org.uk>	<524E50DB.3060707@roeck-us.net> <CAOesGMhc5WYRFcBVSHShg6h8hn4HueGZtGCFKkzfX4SQEe_5LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:54916 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754482Ab3JDNpF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Oct 2013 09:45:05 -0400
In-Reply-To: <CAOesGMhc5WYRFcBVSHShg6h8hn4HueGZtGCFKkzfX4SQEe_5LQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Mark Brown <broonie@kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 10/03/2013 10:41 PM, Olof Johansson wrote:
> On Thu, Oct 3, 2013 at 10:23 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 10/03/2013 06:02 PM, Mark Brown wrote:
>>>
>>> Hi all,
>>>
>>> Better late than never I've uploaded today's linux-next tree to the
>>> master branch of the repository below:
>>>
>>>           git://gitorious.org/thierryreding/linux-next.git
>>>
>>> A next-20131003 tag is also provided for convenience.
>>>
>>> A few new conflicts today caused by the removal of the h8300
>>> architecture which I didn't report for triviality.  Several new build
>>> failures were found as a result of running allmodconfig tests between
>>> merges all of which have been reported and I'm still carrying the i.MX
>>> fix that Thierry has been carrying.
>>>
>>> Due to the length of time taken to run all the allmodconfigs I skipped
>>> the defconfig tests; I know Olof has the ARM stuff covered in his
>>> autobuilder.  I'm going to use allyesconfig tomorrow since that should
>>> run faster so hopefully I can cover the ARM, i386 and x86_64 configs
>>> again.
>>>
>>
>> I could try to set up the buildbot farm I am using for -stable candidates
>> to also test the -next tree. Would that help ?
>
> ARM is pretty well-covered by my builds, I post results at:
>
> http://lists.linaro.org/mailman/listinfo/kernel-build-reports
>

Great summaries. Do you have a single builder, or several builders and
collect the results ? Either case, any chance sharing the buildbot scripts ?

Thanks,
Guenter
