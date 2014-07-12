From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH] serial: imx: Fix build breakage
Date: Sat, 12 Jul 2014 09:11:26 -0400
Message-ID: <53C133FE.7020603@hurleysoftware.com>
References: <20140711112108.7631911b@canb.auug.org.au> <1405046206-14495-1-git-send-email-peter@hurleysoftware.com> <20140712004248.GA24760@kroah.com> <53C096D0.3000005@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout32.mail01.mtsvc.net ([216.70.64.70]:51589 "EHLO
	n23.mail01.mtsvc.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752221AbaGLNLf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 12 Jul 2014 09:11:35 -0400
In-Reply-To: <53C096D0.3000005@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On 07/11/2014 10:00 PM, Randy Dunlap wrote:
> On 07/11/14 17:42, Greg Kroah-Hartman wrote:
>> On Thu, Jul 10, 2014 at 10:36:46PM -0400, Peter Hurley wrote:
>>> Fix breakage introduced by
>>> commit c557d392fbf5badd693ea1946a4317c87a26a716,
>>> 'serial: Test for no tx data on tx restart'.
>>>
>>> Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
>>
>> You forgot a "Reported-by:" tag.
>>
>> I'll go add it...
>
> It's not clear to me that Peter forgot it.

Yeah, it was an oversight. I was rushing to get the patch done because
I was embarrassed about breaking the build.

The kbuild test robot actually notified me first though :)

> Someone else brought this up -- it seems to me that
> Documentation/SubmittingPatches is a little too strong about needing
> permission to use Reported-by:
>
> If this patch fixes a problem reported by somebody else, consider adding a
> Reported-by: tag to credit the reporter for their contribution.  Please
> note that this tag should not be added without the reporter's permission,
> especially if the problem was not reported in a public forum.  That said,
> if we diligently credit our bug reporters, they will, hopefully, be
> inspired to help us again in the future.

I wish the Reported-by tag (and some others) was picked up by git send-email
automatically.

> Sure, if a problem was reported privately, then we need to have permission
> to use Reported-by, but if it was reported in a public forum, that should be
> implicit permission (IMHO).
>
> eh?

I agree.

Regards,
Peter Hurley
