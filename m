From: "Stoyan Gaydarov" <stoyboyker@gmail.com>
Subject: Re: Linux-next testing
Date: Thu, 17 Jul 2008 02:48:23 -0500
Message-ID: <6d291e080807170048v762ddd90mc89794cb9c42adb8@mail.gmail.com>
References: <6d291e080807160427o5a853ca8u96841a2717901a8d@mail.gmail.com>
	 <20080716144316.GA26366@student.math>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.191]:17941 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758129AbYGQHs0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 03:48:26 -0400
Received: by nf-out-0910.google.com with SMTP id d3so1937126nfc.21
        for <linux-next@vger.kernel.org>; Thu, 17 Jul 2008 00:48:24 -0700 (PDT)
In-Reply-To: <20080716144316.GA26366@student.math>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kspaans@student.math.uwaterloo.ca
Cc: linux-next@vger.kernel.org

On Wed, Jul 16, 2008 at 9:43 AM, Kyle Spaans
<kspaans@student.math.uwaterloo.ca> wrote:
> On Wed, Jul 16, 2008 at 06:27:27AM -0500, Stoyan Gaydarov wrote:
>> I know I
>> can do a 'git clone "path to linux-next git tree" ' and go into that
>> and use randconfig then install and reboot, but I was wondering if
>> there was some other better way to do it because the clone command
>> only works in an empty directory. I think fetch or something like that
>> might work better.
> Have a look in the archives for this list. Every time Stephen announces a new linux-next release, he includes a blurb at the bottom of the email that will tell you how you can get the linux-next tree, besides just cloning it anew each day. (I found that blurb helpful even on top of the wiki at http://linux.f-seidel.de/linux-next/pmwiki/)
>
>> The last question I have is ... stress the system a little and try to
>>  break it in a way that can be useful.
> Look around on the linux-next wiki, and you'll see that other people are running automated testing. Have a look at how they are doing it. Also look around on the kernelnewbies.org website, they have tips for how to stress-test your system. (bonnie++ as a filesystem benchmark springs immediately to mind, prime95 as a way to generate cpu load, etc...). I'm sure a quick internet search for "linux stress test" will also turn up useful results.
>
> I'm largely doing the same thing as you, so I'll be interested to see the answers to your other questions.

I was actually thinking about doing something with uml, where i could
build several kernels with ARCH=um SUBARCH=** that way I could boot
them without having to restart the computer and I could also log all
of the output that was generated a lot easier, and the other thing is
I can have multiple kernels booted at the same time. This would make
the stress tests a lot more effective if theres even less resources
per uml kernel running. Any suggestions on how to do this effectively
and correctly(since i am not an expert in any of these topics) would
be greatly appreciated.

-Stoyan G

>
> gl & hf
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
