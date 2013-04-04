From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: linux-next: build warning after merge of the wireless-next tree
Date: Wed, 03 Apr 2013 20:17:01 -0500
Message-ID: <515CD48D.9030607@lwfinger.net>
References: <20130404120043.794afc7dd061dcd3adac0fdb@canb.auug.org.au> <20130404120402.2384c71a6e1850ebe76d62e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:49848 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761846Ab3DDBRE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Apr 2013 21:17:04 -0400
In-Reply-To: <20130404120402.2384c71a6e1850ebe76d62e2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/03/2013 08:04 PM, Stephen Rothwell wrote:
> Hi John,
>
> On Thu, 4 Apr 2013 12:00:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the wireless-next tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input file unused because linking not done
>> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input file unused because linking not done
>> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input file unused because linking not done
>> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input file unused because linking not done
>> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input file unused because linking not done
>> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input file unused because linking not done
>> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input file unused because linking not done
>> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input file unused because linking not done
>> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input file unused because linking not done
>> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input file unused because linking not done
>> x86_64-linux-gcc: warning: drivers/net/wireless/rtlwifi: linker input file unused because linking not done
>>
>> I have no idea what caused that.
>
> Though I suspect commit 8b138d4898a0 ("rtlwifi: rtl8188ee: Enable build
> of new driver") - I wonder if the gap between the "-I" and
> "drivers/net/wireless/rtlwifi" added to ccflags-y is the cause?
>
> I am using gcc 4.6.3 if that matters.

I use 4.7.2.

I'll send a patch with the space removed to see if that helps.

Larry
