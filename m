From: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Subject: Re: linux-next: Tree for Oct 11 (iio/resolver)
Date: Wed, 12 Oct 2011 09:58:10 +0100
Message-ID: <4E9556A2.9050005@cam.ac.uk>
References: <20111011201127.455df266dcbffb1d621f8576@canb.auug.org.au> <4E94AADA.4080204@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E94AADA.4080204-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 10/11/11 21:45, Randy Dunlap wrote:
> On 10/11/11 02:11, Stephen Rothwell wrote:
>> Hi all,
>>
>> The linux-next tree is now available from
>> git://github.com/sfrothwell/linux-next.git as a temporary measure while
>> the kernel.org servers are unavailable.
>>
>> It may also turn up on git.kernel.org (depending on the mirroring).  The
>> patch set is still absent, however.
>>
>> Changes since 20111007:
> 
> When no GPIO support is enabled:
Thanks Randy. Fix is clearly to add the GENERIC_GPIO dependence which should always
have been there for this driver.  Previously it was building a non working driver
as the stubs covered everything being used.  I'll sort a patch shortly and chase down
if we have any others missing GENERIC_GPIO dependencies.

Jonathan
> 
> drivers/staging/iio/resolver/ad2s1210.c:657:14: error: array type has incomplete element type
> drivers/staging/iio/resolver/ad2s1210.c:665:44: warning: type defaults to 'int' in type name
> drivers/staging/iio/resolver/ad2s1210.c:665:44: warning: type defaults to 'int' in type name
> drivers/staging/iio/resolver/ad2s1210.c:665:44: error: negative width in bit-field '<anonymous>'
> drivers/staging/iio/resolver/ad2s1210.c:671:14: error: array type has incomplete element type
> drivers/staging/iio/resolver/ad2s1210.c:679:34: warning: type defaults to 'int' in type name
> drivers/staging/iio/resolver/ad2s1210.c:679:34: warning: type defaults to 'int' in type name
> drivers/staging/iio/resolver/ad2s1210.c:679:34: error: negative width in bit-field '<anonymous>'
