From: Bryan Wu <cooloney@gmail.com>
Subject: Re: Tegra 30 System hangs because of commit "pinctrl: move subsystem
 mutex to pinctrl_dev struct"
Date: Mon, 29 Apr 2013 13:53:00 -0700
Message-ID: <CAK5ve-+F2QgO7UUX-RVtu1C9_wzk8V9UCe231HVTQq9CuTu+rQ@mail.gmail.com>
References: <CAK5ve-KXdS8az=Gtja-mF=Z3_EeZVA7bLYSU0EE2mf5bHmSUKw@mail.gmail.com>
 <517ECE94.4020806@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:55152 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758152Ab3D2UxW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Apr 2013 16:53:22 -0400
Received: by mail-la0-f53.google.com with SMTP id eg20so5890572lab.12
        for <linux-next@vger.kernel.org>; Mon, 29 Apr 2013 13:53:20 -0700 (PDT)
In-Reply-To: <517ECE94.4020806@imgtec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: "patrice.chotard" <patrice.chotard@st.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Mon, Apr 29, 2013 at 12:48 PM, James Hogan <james.hogan@imgtec.com> wrote:
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
>
> Cheers
> James
>

Thanks James, I confirm the new patch in pinctrl repo's for-next
branch fixed this issue.
Everything works fine on my Cardhu and Beaver board.

-Bryan
