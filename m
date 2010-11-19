From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] staging: fix winbond build, needs delay.h
Date: Fri, 19 Nov 2010 09:48:44 -0800
Message-ID: <4CE6B87C.2010203@oracle.com>
References: <20101119143207.b2d5731e.sfr@canb.auug.org.au> <20101119093018.340dab03.randy.dunlap@oracle.com> <20101119173831.GA6098@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101119173831.GA6098@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 11/19/10 09:38, Greg KH wrote:
> On Fri, Nov 19, 2010 at 09:30:18AM -0800, Randy Dunlap wrote:
>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> winbond drivers use msleep() and delay(), so include linux/delay.h
>> in a common header file to prevent build errors.
>>
>> drivers/staging/winbond/phy_calibration.c:987: error: implicit declaration of function 'msleep'
>> drivers/staging/winbond/phy_calibration.c:1556: error: implicit declaration of function 'udelay'
>> drivers/staging/winbond/reg.c:894: error: implicit declaration of function 'msleep'
>> drivers/staging/winbond/reg.c:1178: error: implicit declaration of function 'udelay'
> 
> Is this error showing up in Linus's tree, or only in linux-next?

I saw it in linux-next, but it looks like it should also be a build error
in mainline.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
