From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Tegra 30 System hangs because of commit "pinctrl: move subsystem
 mutex to pinctrl_dev struct"
Date: Fri, 3 May 2013 16:19:18 +0200
Message-ID: <CACRpkdaVuwHP963hQN=K6HLvVcxszRWs9XQBBdOOPm5w-f-Phg@mail.gmail.com>
References: <CAK5ve-KXdS8az=Gtja-mF=Z3_EeZVA7bLYSU0EE2mf5bHmSUKw@mail.gmail.com>
	<517ECE94.4020806@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:57242 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762307Ab3ECOTT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 May 2013 10:19:19 -0400
Received: by mail-ie0-f177.google.com with SMTP id 9so1800809iec.8
        for <linux-next@vger.kernel.org>; Fri, 03 May 2013 07:19:19 -0700 (PDT)
In-Reply-To: <517ECE94.4020806@imgtec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: Bryan Wu <cooloney@gmail.com>, Patrice CHOTARD <patrice.chotard@st.com>, Stephen Warren <swarren@wwwdotorg.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Mon, Apr 29, 2013 at 9:48 PM, James Hogan <james.hogan@imgtec.com> wrote:
> On 29/04/13 19:15, Bryan Wu wrote:
>> Hi Patrice and Linus,
>>
>> I'm running linux-next on my Tegra 30 system everyday. But since
>> next-20130426 release, the linux-next kernel will hang on my Tegra 30
>> boards like Cardhu and Beaver.
>>
>> After some bisect and comparing to next-20130424, I found the commit
>> "pinctrl: move subsystem mutex to pinctrl_dev struct" introduced this
>> issue. If I simply revert this patch in next-20130429, system boots up
>> as before.
>>
>> Could you please help to check this?
>
> I spent a while tracking this one down today too, then found it was
> already fixed. See the patch "[PATCH, for-next] pinctrl: fix mutex
> deadlock in get_pinctrl_dev_from_of_node()" from Daniel Mack.

This one is now in Torvald's tree.

Thanks,
Linus Walleij
