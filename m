From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: mmotm 2012-07-10-16-59 uploaded (staging/ccg)
Date: Thu, 12 Jul 2012 07:46:26 -0700
Message-ID: <4FFEE342.4060903@xenotime.net>
References: <20120711000148.BAD1E5C0050@hpza9.eem.corp.google.com> <4FFDF7BC.6050602@xenotime.net> <20120711151644.23016bd8.akpm@linux-foundation.org> <000001cd600c$c00e0230$402a0690$%p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:50366 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932530Ab2GLOrQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Jul 2012 10:47:16 -0400
In-Reply-To: <000001cd600c$c00e0230$402a0690$%p@samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: 'Andrew Morton' <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, 'Mike Lockwood' <lockwood@android.com>, 'Felipe Balbi' <balbi@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 07/12/2012 02:00 AM, Andrzej Pietrasiewicz wrote:

> Dear Andrew,
> 
> On Thursday, July 12, 2012 12:17 AM Andrew Morton wrote:
> 
>> On Wed, 11 Jul 2012 15:01:32 -0700
>> Randy Dunlap <rdunlap@xenotime.net> wrote:
>>
>>> In file included from drivers/staging/ccg/ccg.c:59:0:
>>> drivers/staging/ccg/../../usb/gadget/f_fs.c:41:0: warning: "pr_vdebug"
>> redefined
>>> drivers/staging/ccg/../../usb/gadget/u_serial.c:138:0: note: this is the
>> location of the previous definition
>>
>> <looks at drivers/staging/ccg/ccg.c>
> 
> <snip>
> 
> @Randy:
> 
> There is a patch for this:
> http://www.spinics.net/lists/linux-usb/msg65344.html
> 
> I guess you acked it.

so I did.  Thanks.


> @Feilpe, Greg:
> 
> Should I send a pull request?



-- 
~Randy
