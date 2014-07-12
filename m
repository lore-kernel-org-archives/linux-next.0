From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] serial: imx: Fix build breakage
Date: Fri, 11 Jul 2014 19:00:48 -0700
Message-ID: <53C096D0.3000005@infradead.org>
References: <20140711112108.7631911b@canb.auug.org.au> <1405046206-14495-1-git-send-email-peter@hurleysoftware.com> <20140712004248.GA24760@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140712004248.GA24760@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Hurley <peter@hurleysoftware.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 07/11/14 17:42, Greg Kroah-Hartman wrote:
> On Thu, Jul 10, 2014 at 10:36:46PM -0400, Peter Hurley wrote:
>> Fix breakage introduced by
>> commit c557d392fbf5badd693ea1946a4317c87a26a716,
>> 'serial: Test for no tx data on tx restart'.
>>
>> Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
> 
> You forgot a "Reported-by:" tag.
> 
> I'll go add it...

It's not clear to me that Peter forgot it.
Someone else brought this up -- it seems to me that
Documentation/SubmittingPatches is a little too strong about needing
permission to use Reported-by:

If this patch fixes a problem reported by somebody else, consider adding a
Reported-by: tag to credit the reporter for their contribution.  Please
note that this tag should not be added without the reporter's permission,
especially if the problem was not reported in a public forum.  That said,
if we diligently credit our bug reporters, they will, hopefully, be
inspired to help us again in the future.


Sure, if a problem was reported privately, then we need to have permission
to use Reported-by, but if it was reported in a public forum, that should be
implicit permission (IMHO).

eh?

-- 
~Randy
