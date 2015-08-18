From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: linux-next: manual merge of the thermal-soc tree with the arm
 tree
Date: Tue, 18 Aug 2015 02:33:48 -0700
Message-ID: <20150818093348.GB26346@localhost.localdomain>
References: <20150817121754.04736e67@canb.auug.org.au>
 <20150817075549.GG7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:33792 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751475AbbHRCdx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Aug 2015 22:33:53 -0400
Content-Disposition: inline
In-Reply-To: <20150817075549.GG7557@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>

Russell,

On Mon, Aug 17, 2015 at 12:55 AM, Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> On Mon, Aug 17, 2015 at 12:17:54PM +1000, Stephen Rothwell wrote:
>> Hi Eduardo,
>>
>> Today's linux-next merge of the thermal-soc tree got a conflict in:
>>
>>   drivers/thermal/cpu_cooling.c
>>
>> between commit:
>>
>>   df6f527755a5 ("thermal: cpu_cooling: fix lockdep problems in cpu_cooling")
>>
>> from the arm tree and commits:
>>
>>   02373d7c69b4 ("thermal: cpu_cooling: fix lockdep problems in cpu_cooling")
>>   a24af233a1fd ("thermal/cpu_cooling: convert 'switch' block to 'if' block in notifier")
>>
>> from the thermal-soc tree.
>>
>> I fixed it up (the first two look like two versions of the same patch,
>> so I used the version from the thermal-soc tree) and can carry the fix
>> as necessary (no action is required).
>>
>> Russell: that commit in your tree has no Signed-off-by :-(
>
> Yes it does.  It's above the explanation of why it's there.  However,
> now that Eduardo has taken patches to fix the long standing bug, I can
> drop this commit.
>

Thanks once again for the effort to push the fix. Once again, sorry for the inconvenience.


> --
> FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
> according to speedtest.net.



-- 
Eduardo Bezerra Valentin
