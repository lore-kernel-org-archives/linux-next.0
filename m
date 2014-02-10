From: Nishanth Menon <nm@ti.com>
Subject: Re: regression(ti platforms): next-20140210 (ehci?)
Date: Mon, 10 Feb 2014 10:22:05 -0600
Message-ID: <52F8FCAD.9080006@ti.com>
References: <52F8F77B.70605@ti.com> <52F8FA37.1020709@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <52F8FA37.1020709@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, linux-omap <linux-omap@vger.kernel.org>, linux-usb@vger.kernel.org, "Balbi, Felipe" <balbi@ti.com>
Cc: linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 02/10/2014 10:11 AM, Roger Quadros wrote:
> On 02/10/2014 05:59 PM, Nishanth Menon wrote:
>> Hi,
>>
>> A quick note to report that I saw regression in today's next tag (logs
>> indicate around EHCI) boot on various TI platforms:
>>
>> Note: crane and sdp2430 are not expected to pass with
>> multi_v7_defconfig (note: omap2plus_defconfig boot seems to be sane
>> but USB is disabled there)
> 
> I'll take a look what's happening.
Thanks.

> Funny thing is that am335x doesn't even have an EHCI controller.

I dont think any of the am335x platforms fail - just OMAP3,4 platforms
which do fail.

Side note: all platforms are tested with device tree boot (not the
legacy boot).


-- 
Regards,
Nishanth Menon
